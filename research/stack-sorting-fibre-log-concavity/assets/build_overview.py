"""Render the documented exact example and proof route; requires matplotlib."""
from pathlib import Path
import json
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch

root = Path(__file__).resolve().parents[1]
data = json.loads((root/'verification/direct_composition_example.json').read_text())
a = data['reduced_Narayana_sum_coefficients']
assert a == [50, 457, 1469, 2131, 1469, 457, 50]
plt.rcParams.update({'font.family': 'DejaVu Sans', 'svg.fonttype': 'none'})
fig = plt.figure(figsize=(13.4, 7.2), facecolor='#fbfaf6')
fig.text(.055, .93, 'Every stack-sorting fibre', fontsize=25, weight='bold', color='#183b37')
fig.text(.055, .883, 'AI-assisted full proof candidate for log-concavity', fontsize=14, color='#183b37')
fig.text(.055, .837, 'Not externally peer reviewed  |  Priority unestablished  |  Real-rootedness unresolved', fontsize=10, color='#66594d')
left = fig.add_axes([.055, .19, .43, .58]); left.set_axis_off()
steps = [
    ('Fixed stack-sorting fibre', 'Defant: valid compositions and fertilitopes'),
    ('Laminar Narayana sum', 'Unique subtree surpluses and formal tail shifts'),
    ('Three-variable Lorentzian lift', 'Ordinary truncation + exact degree invariant'),
    ('Binary extraction of degree d', 'Trimmed ultra-log-concavity => log-concavity')
]
for i, (title, subtitle) in enumerate(steps):
    y = .80-i*.24
    left.add_patch(FancyBboxPatch((.015, y), .96, .17, boxstyle='round,pad=0.012,rounding_size=0.018', linewidth=.8, edgecolor='#bfd0c8', facecolor='#eef3ed'))
    left.text(.045, y+.108, title, fontsize=11.2, weight='bold', color='#183b37')
    left.text(.045, y+.043, subtitle, fontsize=8.6, color='#455c55')
    if i < 3:
        left.annotate('', xy=(.495,y-.058), xytext=(.495,y-.012), arrowprops={'arrowstyle':'->','color':'#75897e','lw':1.3})
right = fig.add_axes([.57, .29, .38, .40], facecolor='#fbfaf6')
bars = right.bar(range(len(a)), a, width=.62, color=['#bdccc1']*3+['#b87531']+['#bdccc1']*3)
right.bar_label(bars, labels=[str(v) for v in a], padding=5, fontsize=10, color='#183b37')
right.set(ylim=(0, 2550), xticks=range(len(a)), xlabel='Trimmed coefficient index j', yticks=[0,1000,2000])
right.tick_params(colors='#5b665f',labelsize=9)
for k in ['top','right']: right.spines[k].set_visible(False)
for k in ['bottom','left']: right.spines[k].set_color('#bcc8bf')
right.set_axisbelow(True); right.yaxis.grid(True,color='#e2e6df',linewidth=.6)
fig.text(.57, .745, 'Exact laminar example', fontsize=15, weight='bold', color='#183b37')
fig.text(.57, .708, 'm = 5, Q = 11, d = 6; 50 lattice points', fontsize=11, color='#5b665f')
fig.text(.57, .204, 'All ULC inequalities checked with exact arithmetic.', fontsize=10, color='#183b37')
fig.text(.57, .170, 'Example only; the uniform claim comes from the proof.', fontsize=9, color='#66594d')
fig.text(.055, .090, 'Known inputs: Defant; Branden-Huh; Ross-Suss-Wannerer.', fontsize=9, color='#59655b')
fig.text(.055, .060, 'Proposed construction: finite tail shifts, the exact homogeneous lift, and its extraction.', fontsize=9, color='#59655b')
fig.savefig(root/'assets/overview.svg', facecolor=fig.get_facecolor(), metadata={'Date':None})
fig.savefig(root/'assets/overview.png', dpi=150, facecolor=fig.get_facecolor(), metadata={'Software':'Matplotlib'})
