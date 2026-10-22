#!/usr/bin/env python3
"""Recompute public catalog counts, CSV exports, source lists and summary SVGs.

Inputs: projects.json, bibliography.json, result_counts.json and selected/excluded
records in prior_research_coverage.json. Uses only Python's standard library.
It does not run or certify the mathematical proofs.
"""
from pathlib import Path
import csv, html, json, statistics
B=Path(__file__).resolve().parents[1]; D=B/'data'; AS_OF='2026-10-22'
def load(name):return json.loads((D/name).read_text())
def save(name,data):(D/name).write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n')
p=load('projects.json'); bib=load('bibliography.json'); r=load('result_counts.json'); cov=load('prior_research_coverage.json')
assert len({x['repo'] for x in p})==len(p)
primary=['affirmative_original_targets','counterexample_focus_projects','further_progress','construction_or_classification']
flat=[s for k in primary for s in r[k]]
assert len(flat)==len(set(flat))==len(p) and set(flat)=={x['repo'] for x in p}
allauthors=sorted({a for x in bib for a in x['authors']})
prior=sorted({a for x in cov['selected_records'] for a in x['authors']})
cov.update(as_of=AS_OF,direct_records=len(cov['selected_records']),listed_researcher_names=len(prior),researcher_names=prior);save('prior_research_coverage.json',cov);save('authors.json',allauthors)
lean=len(r['lean_project_repositories']);ext=sum(x['extension_group'] for x in p)
r.update(lean_projects=lean,extension_groups=ext,result_families=len(p),families_with_extensions=ext);save('result_counts.json',r)
a=[x['source_age_years'] for x in p if x['age_stat_primary']];v=[x['verified_version_age_years'] for x in p if x['age_stat_primary']]
summary=load('catalog_summary.json');summary.update(public_projects=len(p),categories={k:sum(x['result_class']==k for x in p) for k in dict.fromkeys(x['result_class'] for x in p)},projects_with_Lean=lean,extension_groups=ext,counterexample_or_negative_certificate_projects=sum(x['counterexample_component'] for x in p),bibliographic_records=len(bib),research_documents_excluding_OEIS=sum(x['kind']!='OEIS原始提问' for x in bib),named_author_strings_lower_bound=len(allauthors),source_age_year_difference=dict(n=len(a),minimum=min(a),maximum=max(a),mean=statistics.mean(a),median=statistics.median(a)),verified_version_age_year_difference=dict(n=len(v),minimum=min(v),maximum=max(v),mean=statistics.mean(v)),literature_updated=AS_OF)
ai=[x['source_age_years'] for x in p if x['source_age_years'] is not None];summary['including_indirect_2000_report']=dict(n=len(ai),minimum=min(ai),maximum=max(ai),mean=statistics.mean(ai));save('catalog_summary.json',summary)
f=load('frontpage_statistics.json');f.update(research_families=len(p),original_target_answers=sum(len(r[k]) for k in primary[:2]),affirmative_results=len(r[primary[0]]),counterexample_focus=len(r[primary[1]]),partial_results=len(r[primary[2]]),extension_families=ext,lean_families=lean,lean_source_files=196,formalization_archive_projects=8,formalization_archive_source_files=189,external_partial_lean_source_files=7,lean_scope_note='8 archived projects plus the Zudilin partial companion (7 source files); the latter is not a complete formalization.',journal_problem_sources=15,bibliographic_records=len(bib),primary_source_author_names=len({a for x in p for a in x['authors']}),all_listed_author_names=len(allauthors),dated_sources=len(a),source_age_year_difference=dict(min=min(a),max=max(a),mean=statistics.mean(a)),prior_researcher_names=len(prior),prior_research_records=len(cov['selected_records']),as_of=AS_OF)
f['display_labels']['lean_families']='含Lean材料的项目 / Projects with Lean material';f['original_target_count_note']=r['original_target_count_note'];save('frontpage_statistics.json',f)
ag=load('aggregate_metrics.json');ag.update(as_of=AS_OF,public_projects=len(p),projects_with_Lean=lean,extension_groups=ext,bibliographic_records=len(bib),listed_author_name_strings=len(allauthors));save('aggregate_metrics.json',ag)
for name,rows in [('projects',p),('bibliography',bib)]:
 fields=list(dict.fromkeys(k for x in rows for k in x))
 with (D/(name+'.csv')).open('w',encoding='utf-8-sig',newline='') as o:
  w=csv.DictWriter(o,fieldnames=fields);w.writeheader()
  for x in rows:w.writerow({k:'; '.join(map(str,v)) if isinstance(v,list) else json.dumps(v,ensure_ascii=False) if isinstance(v,dict) else v for k,v in x.items()})
# Preserve existing venue notes after the source list.
sources=B/'SOURCES.md';old=sources.read_text();tail='\n## '+old.split('\n## ',1)[1] if '\n## ' in old else ''
lines=['# 问题来源与参考文献','',f'{len(p)}条问题来源与{len(bib)-len(p)}条相关研究／工具背景，共{len(bib)}条。原题行使用中文索引名；正式题名见原文。相关工作按实际关系列出。','', '| # | 文献 | 年份 | 作者 | 刊物／载体 | 关系 | 链接 |','| --- | --- | --- | --- | --- | --- | --- |']
for i,x in enumerate(bib,1):lines.append(f"| {i} | {x['title']} | {x['year']} | {'; '.join(x['authors'])} | {x['venue']} | {x['role']} | [来源]({x['url']}) |")
sources.write_text('\n'.join(lines)+'\n'+tail)
lines=['# 前期研究者与直接相关工作','',f'当前整理到**{len(prior)}位前期研究者，涉及{len(cov["selected_records"])}条原题及直接相关研究记录**。包括问题提出者、已有特例和直接相关对象的研究作者；通用工具、定义、宽泛背景与编辑重述不计入人数。不是失败尝试人数或全球研究者总数。','', '| 原题或研究 | 作者 | 与本项目的关系 |','| --- | --- | --- |']
for x in cov['selected_records']:lines.append(f"| [{x['title']}]({x['url']}) | {'、'.join(x['authors'])} | {x['role']} |")
lines+=['',f'逐条筛选及未纳入文献见[覆盖明细](data/prior_research_coverage.json)。完整书目保留[全部{len(bib)}条记录](SOURCES.md)。','', '[返回首页](README.md)']
(B/'PRIOR_RESEARCH.md').write_text('\n'.join(lines)+'\n')
# The same clean six-metric layout, now generated from data rather than copied numbers.
(B/'assets').mkdir(exist_ok=True)
values=[len(p),f['original_target_answers'],ext,lean,len(prior),'2012–2026']
labels={'zh':['研究成果组','主要目标解答','推广成果组','含Lean材料的项目','前期研究者','问题提出年份'],'en':['Research families','Main targets answered','Extension families','Projects with Lean material','Prior researchers','Source years']}
for lang in labels:
 for mobile in [False,True]:
  w,h=(900,840) if mobile else (1600,584);cols=2 if mobile else 3;cellw=(w-64)/cols;cellh=(h-20)/(3 if mobile else 2)
  s=[f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}" height="{h}" viewBox="0 0 {w} {h}" role="img" aria-label="Catalog statistics as of {AS_OF}">','<rect width="100%" height="100%" fill="white"/>','<style>text{font-family:Arial,"Noto Sans CJK SC",sans-serif}</style>']
  for i,(label,value) in enumerate(zip(labels[lang],values)):
   x=32+(i%cols)*cellw;y=(i//cols)*cellh
   size=70 if i==5 else (128 if mobile else 152);labsize=(26 if mobile else 29) if lang=='en' else (28 if mobile else 31)
   if i==3:labsize=23 if lang=='en' else 27
   s+=[f'<text x="{x}" y="{y+85}" font-size="{labsize}" fill="#4a4a4a">{html.escape(label)}</text>',f'<text x="{x}" y="{y+235}" font-size="{size}" fill="{"#285fa4" if i in [1,3,5] else "#202020"}">{value}</text>']
  for row in range(1,3 if mobile else 2):s.append(f'<line x1="32" x2="{w-32}" y1="{row*cellh+20}" y2="{row*cellh+20}" stroke="#d8d8d8"/>')
  s.append('</svg>');(B/'assets'/f'research-overview.current.{"mobile." if mobile else ""}{lang}.svg').write_text('\n'.join(s)+'\n')
print(json.dumps(dict(projects=len(p),main_targets=f['original_target_answers'],affirmative=f['affirmative_results'],counterexamples=f['counterexample_focus'],partial=f['partial_results'],lean=lean,bibliography=len(bib),authors=len(allauthors),prior=len(prior),prior_records=len(cov['selected_records']),source_age_mean=statistics.mean(a),version_age_mean=statistics.mean(v))))
