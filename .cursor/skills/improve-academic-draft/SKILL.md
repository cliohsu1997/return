---
name: improve-academic-draft
description: Reviews and improves academic draft text by checking notation definitions, logical flow, tone, and mathematical consistency. Use when reviewing academic papers, LaTeX documents, draft text, or when the user asks to improve, review, or check academic writing. For introduction or pre-model sections (institutions, data, stylized facts), run §1b and §1c. For identification sections, run §1e (necessary/sufficient information, no repetition across model/identification/estimation).
---

# Improve Academic Draft

When invoked on draft text, perform these checks systematically.

- **Introduction only** (`\section{Introduction}`): run **§1b** in full, plus relevant parts of checks 1–4.
- **Pre-model sections** (institutional background, data, stylized facts): run **§1c** in full, plus checks 4–5.
- **Equilibrium / consumer-behavior subsections** (e.g., RRSI, CRSI under equilibrium analysis): apply **Cross-references** anti-patterns table; verify hold/fail cases stay with the condition they interpret; flag forward equation refs and adjacent section pointers.
- **Identification sections** (and similar technical blocks): run **§1e**; ensure necessary and sufficient content only, with no repetition of model setup or estimation mechanics.
- **Full paper**: run checks 1–7; add §1b/§1c/§1e when those sections are in scope.

## 1. Notation and Concept Definitions

- List all notations/symbols/technical concepts used
- Verify each is defined at its first appearance
- Flag undefined or late-defined terms
- When prose refers to $CS_i^l$, $CS^l$, or purchase cutoffs from zero surplus, write **expected consumer surplus**, not “expected surplus” alone. Reserve “expected social surplus” for $W^l$ / $S_i^l$.

**Output**: Create a table listing all notations/concepts with their definitions and first appearance location.

## 1b. Introduction Review (when reviewing §1 only)

Apply these criteria in addition to checks 1–4 when the introduction is in scope. Scope: full `\section{Introduction}` (including literature review subsection and roadmap if present). Exclude the abstract unless the user asks for it.

### Paragraph purpose

- Map each paragraph to **one primary job** (e.g., motivation, framework, policy object, mechanisms, limitations, alternative policy, empirical design, findings preview).
- Flag paragraphs that **mix two or more jobs** without a clear hinge sentence.
- Flag **redundant** paragraphs that repeat an earlier paragraph’s job without adding new information.

**Output**: Table — paragraph | primary purpose | verdict (clear / mixed / redundant) | note.

### Terms before definition

- List **project-specific or non-obvious** terms (policy names, coined phrases, decomposition labels, margin names).
- Mark whether each is **defined, illustrated, or only named** at first use.
- Flag terms used **before** first definition/illustration, or used in a **strong claim** before the reader can parse them.
- Standard field terms (e.g., monopoly, adverse selection) need only a brief gloss if context is thin.

**Output**: Table — term | first use (¶) | defined? | issue (if any).

### Clarity and ambiguity

- Flag **unexplained**, **vague**, or **referentially ambiguous** words/phrases (unclear antecedents, “this/its/these,” jargon without gloss).
- Flag **category labels** or **results** stated without the dimension that explains them (e.g., high vs low margin).

**Output**: Bullet list with location and suggested fix (one line each).

### Sentence balance (length and logic)

- Flag paragraphs where **one sentence carries multiple independent claims** (definition + mechanism + implication).
- Flag **unbalanced** pairs/lists (long setup, short payoff; or vice versa).
- Flag **overlong** sentences (>~40 words or >2 semicolon-clauses) that should split.
- Check that **parallel structures** match parallel logic (e.g., First/Second reasons; RRSI vs CRSI contrasts).

**Output**: Bullet list with location, issue type, and optional split suggestion.

### Introduction verdict

- **Overall**: well written / mostly clear / needs revision (one line).
- **Publishing standard**: strong / acceptable / needs work for target journal (one line).
- **AI tone**: none / mild / noticeable (one line, with examples if any).
- **Connection**: coherent arc / local gaps (one line).
- **Top 3 fixes** (if any): ordered by impact on reader comprehension.
- Do **not** rewrite the introduction unless the user asks; diagnosis only unless they request edits.

### AI tone (economics papers)

Flag only when patterns cluster or read template-like. Normal economics phrases are **not** AI tics by themselves.

**Usually fine**: “consistent with,” “the remainder of the paper proceeds as follows,” numbered research questions, “First… Second…,” “threefold” contribution lists, hedged “tends to dominate.”

**Watch for**:
- Throat-clearing openers (“This section describes…,” “We organize the related literature to follow…”).
- Empty signposting with no new information.
- **Excess cross-references** (see **Cross-references** below).
- Stacked buzzwords (“landscape,” “delve,” “crucial,” “nuanced,” “holistic,” “leverage”).
- Over-hedged or over-balanced triads with no content.
- Generic platform/e-commerce boilerplate before the paper’s specific institution or data object appears.

### Cross-references (LaTeX)

Do **not** add `Section~\ref{...}` / “as in Section X” unless at least one applies:

1. **Distance**: the definition or object is **not** in the immediately preceding section or the same major section (reader cannot see it on the same scroll).
2. **Abrupt jump**: without the pointer, a term, equation, or welfare concept appears **without context** the reader could not infer from nearby text.
3. **Technical deferral**: the link points to **non-obvious** construction (appendix algorithm, calibration subsection, proof) that is not restated nearby.

**Do not** add cross-references when:

- The prior material is **adjacent** (e.g., model utilities in §4 → equilibrium in §5).
- The step is **routine** substitution readers expect in sequence.
- The pointer only says “we already defined this” with no new information.

When editing or polishing, **remove** gratuitous `\ref{sec:...}` added for signposting. Flag clustered section pointers as an AI tic in reviews.

**Equilibrium subsections (common anti-patterns):**

| Mistake | Why it fails | Prefer |
|--------|----------------|--------|
| Forward `\eqref{...}` to equations in the **next sentence** | Reader has not seen the display yet | State aggregation, then display $D^l$, $R^l$ |
| `Section~\ref{subsubsec:...}` to the **immediately preceding** subsection | Same scroll; restates what was just read | “cutoffs above,” “the cases above,” or nothing |
| Re-derive primitives at aggregation (“$\nu_i$ implied by (1), normal with…”) | Model section already defined $\nu$; seller integrates over types | “Aggregating over $F_\nu$ and $\Psi$” |
| Merge hold/fail interpretation **into a later paragraph** on a different topic | Wedge economics belongs with the wedge; return probs are separate | After wedge eq.: when it holds → when it fails; then return probabilities |
| Put “when it holds” **after** “when it fails” | Backward logic | Hold case immediately after wedge |
| Replace failure **mechanism** with outcome only (“no one buys insurance”) | Loses link between cutoffs and incentives | Keep marginal nonpositive expected consumer surplus when that is the economic content |
| Delete a clause as “redundant” when it only **partially** repeats prior logic | Often removes the intuitive bridge | Drop only true duplicates (e.g., “high-valuation consumers return less” after “returns more likely”) |

**Flow vs substance:** Merging paragraphs for smooth prose is fine; **do not** cut economic content or reorder hold/fail logic to save words.

### Connection arc (introduction)

Verify the reader can trace this chain (labels may differ by paper):

```text
Motivation → conceptual framework → policy object → mechanisms / trade-offs
→ limitations of status quo → alternative policy (if any) → empirical design
→ findings preview → literature → contribution → roadmap
```

Flag if **findings preview** appears before the reader knows the framework, or if **literature review** breaks the arc without purpose. Results-before-lit-review is acceptable when findings preview motivates the literature.

## 1c. Pre-Model Sections Review (institutions + data + stylized facts)

Scope: sections after the introduction and before `\section{Model}` (or equivalent), including institutional background and data/stylized facts. Exclude the model unless the user asks.

### Section roles

| Block | Primary job |
|-------|-------------|
| Institutional background | Policy institutions, contract rules, variation used for identification |
| Data opening | Sample, units, coverage, cleaning rules, limitations |
| Summary tables/figures | Descriptive facts at stated level of aggregation |
| Interpretation | Mechanism-consistent patterns; confounds acknowledged |
| Handoff | Bridge to structural model |

Flag **throat-clearing** section openers (“This section describes…”). Start with substance.

### Evidence levels (data / stylized facts)

Map each fact to its **level** (e.g., pooled, conditional, within-unit, time series). **Repeating the same directional pattern across levels is acceptable** when each level addresses a different confound (product mix, selection, secular trends). Flag repetition only when the **same level** restates the same point without new information.

### Causal language on descriptive evidence

- Direct table or sample facts: state plainly (no “consistent with”).
- Mechanism interpretation on descriptive splits: prefer **“is consistent with”** over **“reflects”** or **“indicates”** unless design supports stronger language.
- Flag **“reflects”** / **“indicates”** on insured/uninsured or cross-scheme comparisons that are associative.

### Redundancy across locations

Check that sample construction, imputation, and aggregation rules are not duplicated in:
- main-text body,
- table/figure notes,
- appendix (cross-reference instead).

Table notes should add **notation or sample caveats**, not repeat full paragraphs already in the body or appendix.

### Appendix consistency

When the main text cites an appendix for data construction, verify:
- Main claims (pooling rules, imputation, category screen, estimation vs descriptive sample) match appendix subsection text.
- Table construction (e.g., two-step price means vs direct pooling) is stated consistently.

**Output** (pre-model verdict):
- **Overall**: well written / mostly clear / needs revision.
- **AI tone**: none / mild / noticeable.
- **Level structure**: clear / muddy (one line).
- **Top fixes** (if any), ordered by impact.
- Diagnosis only unless the user requests edits.

## 1d. Equilibrium consumer-behavior subsections (RRSI / CRSI / similar)

Scope: subsections that characterize purchase, insurance, and return cutoffs immediately before retailer pricing or welfare. Run when reviewing §5.1–5.2 or equivalent.

### Paragraph order

- **Condition → interpretation → application.** After a wedge or existence condition, interpret when it holds and when it fails **before** moving to a new object (e.g., segment-specific return probabilities).
- Flag prose that **defers** hold/fail interpretation to the end of a later paragraph.

### Cross-references and repetition

- Apply the **Equilibrium subsections** table under **Cross-references**.
- Flag re-stating the distribution of $\nu_i$ or $F_\nu$ at aggregation if the model section already defined it.
- `\eqref{eq:return_probability_r}` from CRSI back to RRSI: acceptable **only** if it avoids duplicating a displayed formula; optional to drop if “as under RRSI” suffices without a pointer.

### Substance checks

- Wedge failure: verify the text states **why** no insurance (e.g., nonpositive surplus at the margin), not only **that** no one buys.
- Insurance-value paragraphs: flag clauses that repeat the same comparative static in words after the math already implies it.

**Output** (equilibrium consumer-behavior verdict):
- **Overall**: well written / mostly clear / needs revision.
- **Publishing standard**: strong / acceptable / needs work.
- **Cross-ref clutter**: none / mild / noticeable.
- **Top fixes** (if any), ordered by impact.

## 1e. Identification and estimation-style sections

Scope: sections that state what is identified from which variation (e.g., §6 Identification) and adjacent technical blocks that must not duplicate the model setup or the full estimation procedure.

### Necessary and sufficient information

- Each section should contain **only what belongs in that section**: identification logic, normalization choices, and mapping from observables to parameters—not a reprise of model primitives, data construction, or GMM mechanics already covered elsewhere.
- Flag **repetition** when the same fact appears in roadmap bullets and again in formal algebra, or when setup facts ($\omega_j$ time-invariance, market size, separability, $\Psi$ non-parametrics) are restated in Identification after Model or Estimation.
- Flag **redundant paragraphs** that preview and then repeat the same argument; prefer one clear path (brief intuition → key equations → conclusion).
- Flag **estimation content** in identification (observed outcomes lists, GMM pooling, calibration detail that belongs in Estimation) unless needed for a single cross-reference.

### Structure checks

- Opening: scope and objects to identify only; no duplicate category/market-size boilerplate from §4 or §7.
- Demand: $\kappa$ normalization justified once; RRSI path for $\Psi$, $\omega$, $\sigma_t$, $\mu_t/\xi_t$ without First/Second/Third duplication of the math.
- Supply: FOC inversion and cost recovery; defer $h_t$ calibration narrative to Estimation (plain “below,” not `\ref` to adjacent subsections).
- Cross-refs: use `\ref` only for distant material (Model, Appendix); for Identification → immediately following Estimation subsections, write “below” or “in estimation” without section numbers.

**Output** (identification-section verdict):
- **Overall**: well written / mostly clear / needs revision.
- **Publishing standard**: strong / acceptable / needs work.
- **Redundancy**: none / mild / noticeable (setup vs identification vs estimation).
- **Top fixes** (if any), ordered by impact.

## 2. Paragraph and Sentence Structure

- Each paragraph has a clear topic/purpose
- Sentences are concise; flag overly complex sentences
- Remove redundancy and fix ambiguous references

**Output**: Bullet list of structure issues with locations (paragraph/sentence numbers or line references).

## 3. Logic Flow

- Arguments progress clearly; conclusions follow from premises
- Identify logical gaps/unexplained jumps; improve transitions

**Output**: Bullet list of logic flow issues with locations and suggested improvements.

## 4. Academic Tone

- Flag informal/colloquial language
- Ensure consistent voice; use appropriate hedging

**Output**: Bullet list of tone issues with locations and suggested academic alternatives.

## 5. Grammar, Spelling, and Punctuation

- Fix spelling/grammar/collocation/punctuation
- **Remove all em dashes (—) and en dashes (–) from main text**
- Replace dashes with parentheses/colons/semicolons or split sentences

**Output**: Bullet list of grammar/spelling/punctuation issues with locations and corrections.

## 6. Mathematical Consistency

- List all equations/formulas
- Verify notation is consistent across math and matches the narrative
- Flag contradictions

**Output**: Table of equations with notation verification and consistency checks.

## 7. Proof Consistency and Validity

For each theorem/lemma/proposition proof:
- Verify logical validity and completeness
- Track assumptions and case coverage
- Verify correct application of definitions/results
- Flag circular reasoning, missing cases, unjustified steps, direction/quantifier errors, ambiguity

**Output**: Bullet list of proof issues with locations and specific problems identified.

## Output Format

Produce:

1. **Notation/Concepts Table** (when math is in scope): definitions and first appearance
2. **§1b Introduction verdict** (when introduction is in scope): overall, publishing standard, AI tone, connection, top fixes
3. **§1c Pre-model verdict** (when institutions/data are in scope): overall, AI tone, level structure, top fixes
4. **§1d Equilibrium consumer-behavior verdict** (when RRSI/CRSI-style subsections are in scope): overall, publishing standard, cross-ref clutter, top fixes
5. **§1e Identification-section verdict** (when identification or similar technical sections are in scope): overall, publishing standard, redundancy, top fixes
6. **Mathematical Consistency Table** (when equations are in scope)
7. **Structure / Logic / Tone / Grammar issues**: bullet lists with locations
8. **Proof Issues** (when proofs are in scope)
9. **Revised Cleaned Draft**: only when the user requests edits (reviews are diagnosis-only by default)

## LaTeX Auxiliary Files

When working with LaTeX drafts (e.g., in `draft/`):

- **Delete automatically generated auxiliary files** after edits or when the user requests a clean state (e.g., before committing, or when listing/cleaning the draft folder).
- Auxiliary file types to delete: `.aux`, `.log`, `.bbl`, `.blg`, `.out`, `.toc`, `.fls`, `.fdb_latexmk`, `.synctex.gz`, and optionally `.lof`, `.lot`.
- Do not delete source files (`.tex`, `.bib`) or output the user keeps (e.g., `.pdf` if they want it tracked).

## Workflow

1. Read the entire draft first
2. Perform checks 1-7 systematically
3. Compile all issues into organized output
4. Create revised draft with all improvements
5. Present both the analysis and the cleaned draft
6. When done with LaTeX drafts: delete auxiliary files as above if the user has asked to clean or commit
