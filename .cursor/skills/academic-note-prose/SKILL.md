---
name: academic-note-prose
description: Writes and edits economics draft notes and model sections as continuous paper prose—natural transitions, define notation at first use, derive results from definitions, minimal notation, and sparse equation cross-references. Use when drafting or revising LaTeX under draft/, writing model/derivation sections, welfare or incidence notes, or when the user asks for paper-like flow, natural linking, minimal notation, or derive-don't-state results.
---

# Academic Note Prose

Apply when **writing or revising** economics draft notes (`draft/**/*.tex`), especially model blocks, welfare derivations, and incidence sections. For **diagnostic review** (notation tables, intro checks), use **improve-academic-draft** instead.

## Revision lessons (prose vs algebra)

Compare draft text against an earlier version when polish goes wrong. Common failure modes:

| Failure | Symptom | Fix |
|--------|---------|-----|
| **Notation-led prose** | **Because** clauses restate payoffs (`lose $u-p$`) instead of economics | Plain language in prose; formal objects in the display |
| **Triple redundancy** | Keep/return logic, then $\kappa$ flat in $p$, then “in words $s_p$ is …” | One economic sentence, then one equation |
| **Double definition** | `Write $s_p$ for …; in words, $s_p$ is …` | Define in `where` at first appearance; embed meaning in one lead-in sentence |
| **Wrong section job** | Setting repeats in Consumer side; primitives re-introduced | Setting = full setup once; later sections = aggregate/derive only |
| **Extra names** | $K$ and $D(1-r)$; reservation price and WTP | One object, one name; drop aliases not used downstream |
| **Hand-waved derive** | “By the envelope theorem, $CS'=\cdots$” with no margin split | Integral → extensive term (often zero) → intensive term → aggregates |
| **Template filler** | “defined by … defined by …”; bogus **and**; equation opens section | Follow expository order; prose before first display |

**Git baseline vs polished note:** an older commit may get aggregates and results right while still violating exposition (vague Setting, repeated setup, redundant $K$, announced results). Polishing is not adding words—it is **one clear pass** through the logic: primitives → sufficient statistic → aggregates → derive → interpret.

## Core rules

1. **Connect with words, not headers.** Write like a paper paragraph. Do not use `\paragraph{...}` or bold signpost labels inside a section. Use hinge sentences (“Aggregating across types yields…”, “Summing across firms defines…”, “Differentiating with respect to $w$ gives…”).
2. **Derive; do not announce.** Do not state a result and then prove it. Start from primitives or aggregate definitions, work step by step, and display the result only at the end of the argument.
3. **Minimal notation.** Introduce only symbols needed for the explanation. Drop redundant aliases. Do not label intermediate steps unless they are reused later.
4. **Sparse `\eqref`.** Avoid `\eqref{...}` in prose unless a cross-reference is genuinely needed.

## Define notation at first use

- **Explain every new symbol in words** when it first appears—not later, not as an unexplained tuple like $(\kappa_i,G_i)$.
- **Expository order:** product/market → who agents are → each dimension of heterogeneity (with meaning) → timing and micro payoffs → expected objects → **summarize to a sufficient statistic** (e.g. willingness to pay) → population aggregates ($F$, $D$, shares).
- **Do not run backward:** avoid “heterogeneity is only across $(\kappa_i,G_i)$” before saying what $\kappa_i$ and $G_i$ are.

**Bad:**
```latex
Consumer heterogeneity is only across types $i$ in $(\kappa_i,G_i)$. Type $i$ has
return hassle $\kappa_i$ and draws $u$ from $G_i$.
```

**Good:**
```latex
Consumers indexed by $i$ differ in return hassle $\kappa_i$, the disutility from
returning the product, and in match distribution $G_i$ over post-purchase
quality $u$.
```

## Sentence and paragraph craft

### “And” discipline

Use **and** only when two clauses are **the same logical step**. Separate sentences for separate steps.

| Join with **and** | Separate sentences |
|---|---|
| Two dimensions of the same heterogeneity | Product price, then consumer types |
| Keep vs return payoffs in one decision rule | Buy rule, then definition of WTP |
| Aggregates defined in one aggregation sentence | Primitive setup, then derived objects |

**Bad:** `Type $i$ buys if $s_i(p)\geq 0$, and reservation price $v_i$ solves $s_i(v_i)=0$.` (two unrelated definitions stitched with **and**)

**Good:** `For purchase, all consumer-side heterogeneity summarizes into willingness to pay $v_i$, defined by $s_i(v_i)=0$, so type $i$ buys if and only if $p\leq v_i$.`

### Length balance

- **Not choppy:** do not break every short sentence into its own LaTeX paragraph (a blank line forces a new paragraph in the PDF).
- **Not run-on:** do not glue product, heterogeneity, timing, and aggregates into one line.
- **Target:** one logical beat per sentence or two; at most ~2 sentences per beat when the logic is tight. Link related ideas with **who/which/where**, commas, or **so**—not a bogus **and**.

### Sections do not open on display math

Always **one prose sentence** before the first equation in a section.

**Bad:** `\section{Consumer side}` then `\begin{equation} CS(p)=...\end{equation}`

**Good:** `At list price $p$, consumer surplus integrates expected surplus over types who buy:` then the display.

## Sufficient statistics for heterogeneity

When a margin (purchase, participation, entry) depends on a scalar summary of type:

- Say explicitly that **all heterogeneity on that margin summarizes** into **willingness to pay** $v_i$.
- Give **defined by** immediately (e.g. `$v_i$ defined by $s_i(v_i)=0$`).
- State the **decision rule** in the same sentence or the next (e.g. `$p\leq v_i$`).

Return behavior, match risk, etc. may still depend on underlying type parameters **off** the purchase margin; say so in the derivation section when relevant.

## One object, one name

- **Do not give two names to the same object** (e.g. willingness to pay and reservation price for the same $v_i$; $K$ and $D(1-r)$ when one symbol suffices in a paragraph).
- Pick one term at first use and keep it throughout the note.
- In derivations, **omit type-level steps** that add notation without new content when the next line already connects to the aggregate definition—but when a partial or derivative is new notation, give **one sentence** of economic meaning before its display, not a separate “Write …; in words, …” block.

## Surplus, margins, and interpretation

### Integral form when teaching extensive vs intensive margins

For surplus over a WTP distribution $F$, prefer

```latex
CS(p)=\int_p^\infty s(v,p)\,dF(v), \qquad s(v,v)=0,
```

Differentiate to expose **extensive margin** (boundary term; often zero because $s(v,v)=0$) and **intensive margin** (integral of $\partial s/\partial p$). Define partials where they first appear (e.g. `$s_p(v,p)\equiv \partial s(v,p)/\partial p$` in the same display or its `where` clause).

**Bad (triple redundancy):** state the economic logic, then `Write $s_p$ for …; in words, $s_p$ is …`, then the same equation.

**Good:** one sentence embeds meaning and the object—`On the intensive margin, $s_p(v,p)$ equals minus the keep probability, because a higher price harms the consumer only when she keeps the purchase:` then the display. Do not restate the same logic with payoff notation (`$u-p$`) in the **because** clause when plain language already says it.

### Interpretation **after** the math

1. Derive the result (display the final formula).
2. **Then** interpret: economic meaning, special cases, what enters at first order.
3. When a local welfare object depends **only on aggregates** (e.g. $D(p)$ and $r(p)$), say so explicitly—and that **micro heterogeneity in how behavior responds to price** does not matter holding those aggregates fixed. That is often the main punchline; do not bury it in algebra.

## Derivation template

1. **Primitives** — market, agents, heterogeneity (each symbol defined), micro payoffs in consistent notation.
2. **Summarize** — sufficient statistic for the relevant margin (WTP, type index, etc.).
3. **Aggregates** — $F$, demand, shares; avoid “defined by … defined by …” chains—group logically.
4. **Aggregate object** — surplus or profit in integral/sum form when margins matter.
5. **Stepwise logic** — differentiate or envelope; show extensive/intensive split if useful.
6. **Result** — numbered equation only when reused downstream.
7. **Interpretation** — after the result; sufficient-statistic / aggregate-dependence claims belong here.

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

## Pre-compile proofread

Before `pdflatex`, read the edited passage and check:

- [ ] Every symbol defined at first use (no naked tuples)
- [ ] Expository order: primitives → summarize → aggregates
- [ ] No bogus **and** between unrelated steps
- [ ] No one-sentence paragraphs; no single run-on opening sentence
- [ ] No section opens on a display equation
- [ ] No comma-spliced “defined by” chains
- [ ] Payoff notation consistent with $\max(\cdot)$ or equivalent objects
- [ ] Interpretation follows derivation; aggregate-sufficiency stated when true

## Notation checklist

- [ ] Same object with two symbols or two prose names when one suffices
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
