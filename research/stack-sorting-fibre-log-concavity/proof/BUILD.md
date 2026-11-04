# Building the proof draft

The editable source is `laminar_narayana_ulc.tex`. The accompanying `laminar_narayana_ulc.pdf` is a nine-page, US Letter PDF compiled with pdfLaTeX. It has no named author or affiliation in its text or PDF author metadata.

The draft is an AI-assisted proof candidate. It has received internal mathematical checks, not external peer review. Priority is unestablished, and the draft does not claim to prove the real-rootedness conjecture.

## Standard TeX Live build

Requirements: pdfLaTeX with Latin Modern, AMS mathematics, geometry, microtype, enumitem, xurl, hyperref, and fancyhdr. Poppler is needed only for the optional rendering check.

From this directory, run:

```sh
set -eu
mkdir -p build
pdflatex -interaction=nonstopmode -halt-on-error \
  -output-directory=build laminar_narayana_ulc.tex
pdflatex -interaction=nonstopmode -halt-on-error \
  -output-directory=build laminar_narayana_ulc.tex
cp build/laminar_narayana_ulc.pdf laminar_narayana_ulc.pdf
```

Two passes resolve theorem, equation, section, and bibliography references. No BibTeX run is needed because the references are included in the source. No shell escape or network access is needed to compile.

## Restricted Debian TeX Live build

The checked build used pdfTeX 1.40.26 from TeX Live 2025/dev/Debian. In that environment the TeX distribution files were present but the generated format and filename databases were missing, while system directories were read-only. The following alternative creates a format and font map in a temporary directory without changing the TeX installation. It is intended for that specific layout; a normally configured TeX Live installation should use the simpler commands above.

From this directory, run:

```sh
set -eu
src="$PWD/laminar_narayana_ulc.tex"
out="$PWD/laminar_narayana_ulc.pdf"
build="$(mktemp -d)"
export TEXMF="{$build/texmf,/usr/share/texmf,/usr/share/texlive/texmf-dist}"
export TEXMFVAR="$build/texmf-var"
export TEXMFCONFIG="$build/texmf-config"
export TEXFORMATS="$TEXMFVAR//:"
mkdir -p "$TEXMFVAR" "$build/texmf/fonts/map/pdftex"

cat /usr/share/texmf/fonts/map/dvips/lm/lm.map \
    /usr/share/texlive/texmf-dist/fonts/map/dvips/amsfonts/cm.map \
    /usr/share/texlive/texmf-dist/fonts/map/dvips/amsfonts/latxfont.map \
    /usr/share/texlive/texmf-dist/fonts/map/dvips/amsfonts/symbols.map \
    > "$build/texmf/fonts/map/pdftex/pdftex.map"

(cd "$TEXMFVAR" && \
  pdftex -ini -etex -interaction=nonstopmode -halt-on-error \
    -jobname=pdflatex pdflatex.ini)

pdflatex -interaction=nonstopmode -halt-on-error \
  -output-directory="$build" "$src"
pdflatex -interaction=nonstopmode -halt-on-error \
  -output-directory="$build" "$src"
cp "$build/laminar_narayana_ulc.pdf" "$out"
printf 'Build files retained at %s\n' "$build"
```

## Render and inspect

```sh
mkdir -p build/render
pdfinfo laminar_narayana_ulc.pdf
pdftoppm -r 120 -png laminar_narayana_ulc.pdf build/render/page
pdftotext -layout laminar_narayana_ulc.pdf build/render/extracted.txt
```

The supplied PDF was compiled twice, rendered at 120 dpi, and visually inspected on all nine pages. The final build has no errors, undefined references, or overfull boxes. One underfull bibliography paragraph is reported by TeX; its rendered lines are readable and remain inside the text area. Mathematical glyphs, equation numbering, page numbers, references, and hyperlinks were checked. Temporary formats, compilation logs, auxiliary files, extracted text, and rendered page images are not part of the proof deliverables.

## Page guide

- Pages 1–2: statement, hypotheses, integrality, and feasibility lemma.
- Page 3: capacity allocation proof and unique subtree surplus recurrence.
- Page 4: formal Narayana substitution and finite polynomial expression.
- Pages 5–6: Lorentzian ingredients, simultaneous degree invariant, and lift.
- Pages 6–7: coefficient extraction, factorial, positivity, and exact degree.
- Pages 7–8: stack-sorting consequence, empty fibers, endpoint cases, and scope.
- Pages 8–9: credited truncation verification and four primary references.
