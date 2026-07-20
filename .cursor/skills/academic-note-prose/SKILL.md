---
name: academic-note-prose
description: Writes and edits economics draft notes and model sections as continuous paper prose—define notation at first use, derive don't announce, minimal notation, sparse eqref, prose rhythm, math in displays. Use when drafting or revising LaTeX under draft/, welfare/incidence derivations, or when the user asks for paper-like flow.
---

# Academic Note Prose

**Write/edit** economics notes (`draft/**/*.tex`). **Review-only** diagnosis → **improve-academic-draft** (§1f points here).

**Core principle:** One clear pass through the logic—primitives → sufficient statistic → aggregates → derive → interpret. Polishing is not adding words or shuffling blocks.

---

## Before every edit (mandatory)

Read the passage aloud (mentally). Fix in this order:

1. **Redundancy** — same economics or symbol defined twice?
2. **Paragraph rhythm** — stub one-line paragraphs? run-on sentence doing an equation's job?
3. **Expository order** — mechanism before notation?
4. **Model honesty** — claiming structure the primitives do not impose?
5. **Structure last** — only after 1–4; reordering algebra is not a readability fix.

Then run **Pre-compile checklist** (bottom) before `pdflatex`.

---

## Core rules

| Rule | Do | Don't |
|------|----|-------|
| **Connect** | Hinge sentences between steps | `\paragraph{}`, bold signposts |
| **Derive** | Primitives → steps → display at end | State result, then prove |
| **Notation** | Symbols needed downstream only | Aliases ($K$ vs $D(1-r)$); firm-level ($j^*$, $\omega$) after $S(\mu)$ exists |
| **`\eqref`** | Distant, non-obvious refs | Adjacent or just-defined equations |
| **Terms** | **Effective margin** for $\mu$ | Bare “margin” when $\mu$ is meant |
| **Honesty** | Say when model does not impose X | Invent common $c$, symmetric shocks, etc. |

---

## Exposition order

**Setting (once):** market → agents → each heterogeneity dimension (words, not tuples) → timing/payoffs → expected objects → **sufficient statistic** (e.g. WTP $v_i$, defined by $s_i(v_i)=0$) → aggregates ($F$, $D$, $r$).

**Later sections:** aggregate / derive only—no primitive re-intro.

**One object, one name:** WTP not also “reservation price”; no `Write $s_p$…; in words, $s_p$ is…`—meaning in one lead-in or `where` clause.

**Bad tuple:** `heterogeneity is only across $(\kappa_i,G_i)$` before defining $\kappa_i$, $G_i$.

---

## Prose craft

### Sentences

- **And** only for the **same logical step**; separate unrelated definitions.
- **~1–2 sentences per beat**; link with *who/which/so*, not bogus **and**.
- **Not run-on:** do not pack product, heterogeneity, timing, aggregates, and three partials in one line.

### Paragraphs

- Blank line in LaTeX = new PDF paragraph—use sparingly.
- **Not choppy:** one line per shock, per symbol, or per “Write …”.
- **Typical break:** economics (what moves) → derivation (one continuous block through displays)—not “general paragraph / special paragraph” as fake structure.

### Punctuation

- **No `:` or `;`** as templates before displays or between unrelated steps. Period, then equation—or *so/yields/therefore*.
- **Keep `:`** only for `FOC:`, conventional labels, true lists.
- **Sections:** at least one prose sentence before the first display.

### Math placement

- **Prose:** economic meaning, one short hinge.
- **Displays:** partials, multi-equation substitutions, pass-through formulas, $dPS/dx$ cases.
- **Bad:** `At the production shock, $\mu_c=0$, and … $S_c=-S'$, and … $\mu_h=-r$, and …` in one sentence.
- **Good:** one hinge → `align` or `equation`.

---

## Derivation template

1. Primitives (symbols defined)
2. Sufficient statistic for the margin
3. Aggregates
4. Aggregate object (integral/sum if margins matter)
5. Stepwise logic (extensive/intensive split when teaching $CS'$)
6. Numbered equation **only if reused**
7. Interpretation **after** result (special cases; aggregate-sufficiency punchline)

**Surplus margins:** $CS(p)=\int_p^\infty s(v,p)\,dF(v)$, $s(v,v)=0$ → differentiate → extensive (often zero) → intensive ($s_p$ in `where`) → aggregates. Plain language in **because** clauses; not payoff restatement ($u-p$) when words suffice.

**Announce-then-verify (bad):** display $PS=\int S$, then “To verify \eqref{…}, differentiate…”

**Derive-then-conclude (good):** aggregate $PS$, differentiate, envelope → $PS'=S$ → integral.

---

## Pass-through and incidence

### Readability ≠ algebra order

General $\rho_x=-m_x/m_p$ before special cases is **correct math** but **not** a readability fix by itself. Reader must know **what each shock moves** before $m(p,x)$, $\rho_x$, or $x\in\{c,h\}$.

### Structure (competitive notes; aggregate only)

1. **Opening (once):** clearing $D(p)=S(\mu(p,h))$; $Q\equiv D(p)$; two shocks in plain English—production = uniform parallel +$1 in every firm's MC → shifts $S$ at given $\mu$; handling = +$1 in $h$ → lowers $\mu(p,h)$ at fixed $p$. Do **not** also say “$\mu$ unchanged” and “$S$ unchanged” for both—that is redundant.
2. **General derive (keep density):** $m(p,x)\equiv D-S$; $m=0$; $\rho_x=-m_x/m_p$; align $m_p$, $m_x$; general $\rho_x$ in $\mu_x$, $S_x$.
3. **Specialize (no re-teach):** one short hinge → **align** for shock-specific $\mu_x$, $S_x$ → $\rho_c$, $\rho_h$ (define $\rho_c,\rho_h$ here if not yet named).
4. **Incidence:** $dCS$; $dPS$ integral + envelope term; handling and production in **displays**, not inline; one sentence links $\int S_x=-Q$ to $\mu_x=-1$ in unified $dPS/dx$; incidence ratio in display.

### Model facts (welfare note; do not misstate)

- Primitives: heterogeneous $C_j(q_j)$—**not** common scalar production cost $c$.
- Production shock: **parallel shift** in every firm's marginal cost (indexes $c$ in $\rho_c=dp/dc$).
- Handling: **level** $h$ in $\mu(p,h)=p-r(p)(p+h)$.
- Pass-through: $\mu_c=0$, $S_c=-S'(\mu)$; $\mu_h=-r(p)$, $S_h=0$.
- Incidence burden: $\mu_x=0$ in pass-through vs $\mu_x=-1$ for production in $dPS$—state the bridge explicitly.

### Keep vs cut

| Keep | Cut |
|------|-----|
| $m=0$, $\rho_x=-m_x/m_p$, $m_p/m_x$ align | “Both shocks enter through the same clearing condition” |
| $\int S_x$ for production; $\mu_x=-1$ link | “numerator/direct effect…”, “with $\mu$ from (4)…” |
| Shock channels **once** at top | Same channels in specialization prose |
| Key steps for publication density | Stub paragraphs; notation-led openings |

### Snippets

**Bad opening:**
```latex
Write $Q\equiv D(p)$. Consider shocks indexed by $x\in\{c,h\}$: handling cost
$h$ in $\mu(p,h)$, or a uniform one-dollar parallel shift… Write
$\rho_x\equiv dp/dx$. Production cost shifts $S(\cdot)$… Handling shifts
$\mu(p,h)$…
```

**Good opening:**
```latex
Equilibrium satisfies $D(p)=S(\mu(p,h))$. Write $Q\equiv D(p)$. A uniform
one-dollar parallel shift in every firm's marginal production cost shifts market
supply at a given effective margin $\mu$. A one-dollar increase in handling
cost $h$ lowers $\mu(p,h)$ at a fixed list price $p$.
```

**Bad specialize:**
```latex
At the production-cost shock, $\mu$ does not move at fixed $p$, so $\mu_c=0$,
and aggregate quantity falls… so $S_c=-S'(\mu)$. At the handling shock,
$\mu_h=-r(p)$…
```

**Good specialize:**
```latex
The two shocks differ in which margin moves at fixed $p$ or fixed $\mu$,
\begin{align}
  \mu_c &= 0, & S_c &= -S'(\mu), & \mu_h &= -r(p), & S_h &= 0.
\end{align}
```

---

## Failure modes (quick reference)

| Failure | Symptom | Fix |
|---------|---------|-----|
| **Reorder ≠ readable** | Shuffled paragraphs; still unreadable | Economics once; math in displays; then structure |
| **Notation-led** | $\rho_x$, $x\in\{c,h\}$ before shocks explained | Mechanism → symbols |
| **Triple redundancy** | Channels in open + middle + specialize | State once; align for partials |
| **Math in prose** | Many partials/derivatives in one sentence | Hinge + align/equation |
| **Choppy PDF** | Blank line after every short sentence | One break: economics → derive |
| **Double definition** | $\rho_c$ early and late; two names for one object | Define at first **use** |
| **Wrong model** | “Common $c$” with heterogeneous $C_j$ | Parallel MC shift; say what model imposes |
| **Over-trim** | Cut $m=0$, $\mu_x=-1$ bridge | Keep derivation density; cut filler |
| **Over-pad** | `\paragraph{}`, eq narration, filler hinges | Hinge only when logic turns |
| **Hand-wave** | “By envelope, $CS'=…$” with no margin split | Integral → margins → aggregate |
| **Wrong section job** | Setting repeated downstream | Aggregates only in later sections |
| **Punctuation tics** | `;` / `:` before every display | Period + display |
| **Interpretation timing** | Punchline before derive | After numbered result |

**Git baseline:** older commits may have correct math and bad exposition—fix exposition without dropping steps the user kept.

---

## Pre-compile checklist

- [ ] Symbols defined in words at first use (no naked tuples)
- [ ] Exposition: primitives → summarize → aggregates
- [ ] Shock/mechanism before indexed notation ($x$, $\rho_x$)
- [ ] No bogus **and**; no one-line paragraphs; no run-on math sentences
- [ ] No section opens on display math
- [ ] No unnecessary `:` or `;` before displays
- [ ] No `\paragraph{}` signposts; sparse `\eqref`
- [ ] Math-heavy steps in align/equation, not prose
- [ ] Pass-through: channels once; general $m=0$ kept; specialize via align
- [ ] Incidence: $dPS$ cases in displays; $\mu_x=-1$ bridge if production supply shift
- [ ] Interpretation after derivation; aggregate-sufficiency stated when true
- [ ] Model claims match primitives (no invented common cost, etc.)
- [ ] Payoff notation consistent with $\max(\cdot)$ or equivalent

---

## Workflow

After any `draft/**/*.tex` edit → **latex-compilation** / project-workflow (`pdflatex` twice from note directory; bib cycle if needed).

| Skill | Role |
|-------|------|
| **academic-note-prose** (this) | Write/edit model and derivation text |
| **improve-academic-draft** (§1f) | Review verdict on draft notes |
| **latex-compilation** | Build PDFs |
