#!/usr/bin/env python3
"""Render REPORT.zh.md using Pandoc; preserve the collection's existing CSS."""
from pathlib import Path
import hashlib, subprocess
B=Path(__file__).resolve().parents[1]
source=B/'REPORT.zh.md';sha=hashlib.sha256(source.read_bytes()).hexdigest()
body=subprocess.check_output(['pandoc','--from=gfm','--to=html5',str(source)],text=True)
css=(B/'assets/report.css').read_text()
page=f'''<!DOCTYPE html>
<html lang="zh-CN"><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aurantium · Mathematics</title>
<meta name="generator" content="scripts/render_report.py + Pandoc">
<meta name="source-file" content="REPORT.zh.md"><meta name="source-sha256" content="{sha}">
<style>{css}</style></head><body><div class="shell">
{body}
<footer class="aris-footer">Source: REPORT.zh.md · SHA256: {sha} · Catalog date: 2026-10-22.</footer>
</div></body></html>
'''
(B/'REPORT.html').write_text(page)
print('Rendered REPORT.html from REPORT.zh.md')
