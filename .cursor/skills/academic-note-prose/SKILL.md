---
name: academic-note-prose
description: Writes and edits economics draft notes and model sections as continuous paper prose—natural transitions, derive results from definitions, minimal notation, and sparse equation cross-references. Use when drafting or revising LaTeX under draft/, writing model/derivation sections, welfare or incidence notes, or when the user asks for paper-like flow, natural linking, minimal notation, or derive-don't-state results.
---

# Academic Note Prose

Apply when **writing or revising** economics draft notes (`draft/**/*.tex`), especially model blocks, welfare derivations, and incidence sections. For **diagnostic review** (notation tables, intro checks), use **improve-academic-draft** instead.

## Core rules

1. **Connect with words, not headers.** Write like a paper paragraph. Do not use `\paragraph{...}` or bold signpost labels inside a section. Use hinge sentences (“Aggregating across types yields…”, “Summing across firms defines…”, “Differentiating with respect to $w$ gives…”).
2. **Derive; do not announce.** Do not state a result and then prove it. Start from primitives or aggregate definitions, work step by step, and display the result only at the end of the argument.
3. **Minimal notation.** Introduce only symbols needed for the explanation. Drop redundant aliases (e.g. do not also write $\pi_j$, $\Pi(w)$, $PS_j(w)$ when $PS(w)=\sum_j[w q_j-C_j(q_j)]$ suffices). Do not label intermediate steps unless they are reused later.
4. **Sparse `\eqref`.** Avoid `\eqref{...}` in prose. Refer in words (“market clearing”, “the zero-margin condition”, “$dCS=-K\,dp$”) unless a cross-reference is genuinely needed (long documents, repeated objects, or user request).

## Section structure

- **`\section{...}`** titles are fine for major blocks (Setting, Consumer side, Supply side, etc.).
- Within a section: one continuous narrative arc—setup → aggregates → differentiation/envelope → conclusion.
- No standalone “Proof.” headings; weave verification into the paragraph before the displayed equation.

## Derivation template

Use this order for welfare, surplus, pass-through, and similar blocks:

1. **Primitives** — optimization problem or definition in one short setup.
2. **Aggregates** — sum/integrate; one displayed definition if helpful.
3. **Stepwise logic** — differentiate or envelope; show intermediate algebra inline or in unnumbered display math.
4. **Result** — numbered equation only when the object is used downstream or worth citing in the PDF.
5. **Interpretation** — one sentence (economic meaning, special case, or equilibrium evaluation).

**Bad (announce then verify):**
```latex
Industry surplus equals the area under supply:
\begin{equation} PS(w)=\int_0^w S(x)\,dx. \end{equation}
To verify \eqref{eq:PS-integral}, differentiate \eqref{eq:agg-def}...
```

**Good (derive then conclude):**
```latex
Summing across firms defines market supply and industry profit:
\begin{equation}
  S(w)\equiv\sum_j q_j(w),\qquad
  PS(w)\equiv\sum_j\bigl[w q_j(w)-C_j(q_j(w))\bigr].
\end{equation}
Differentiating $PS(w)$... Therefore $PS'(w)=S(w)$. With no production at $w=0$,
\begin{equation} PS(w)=\int_0^w S(x)\,dx. \end{equation}
```

## Notation checklist

Before finishing an edit, scan for:

- [ ] Same object with two symbols ($PS$ vs $\Pi$, $K$ vs $D(1-r)$ when one suffices in that paragraph)
- [ ] Firm-level surplus integral when only aggregate $PS$ is used later
- [ ] Labels on equations never referenced in text
- [ ] `\eqref` where prose would be shorter and clearer

## LaTeX workflow

After editing any file under `draft/`, recompile per **latex-compilation** / project-workflow (typically `pdflatex` twice from the note’s directory).

## Relation to other skills

| Skill | Role |
|-------|------|
| **academic-note-prose** (this) | Write/edit model and derivation text |
| **improve-academic-draft** | Review checks: definitions, intro, identification, tone |
| **latex-compilation** | Build PDFs after `.tex` changes |
