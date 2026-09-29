# Plan: Buyer remittance return rate \(r_R\) vs univariate \(r'\)

**Date:** 2026-08-15  
**Primary file:** `draft/welfare_foundation/welfare_with_returns.tex`  
**Downstream:** `draft/welfare_foundation/partial_recovery.tex`  
**Status:** in progress — Setting seed + neutrality restructured (buyer-differs subsection); intro defers buyer claims; pass-through onward not yet updated

---

## Problem

Univariate \(r(p)\) is defined when **purchase price and refund coincide** at \(p\) (the diagonal). Under buyer remittance they split:

- checkout / purchase price: \(p\)
- return recovery: \(R=p-\tau\) (zero reclaim; no \(\alpha\) in the companion)

Writing \(r(p-\tau)\) reuses a diagonal object off the diagonal. For **levels** at \(\tau=0\), \(R=p\), so no problem. For **tax derivatives at fixed checkout**, only \(R\) moves, so the correct return-rate response is \(\tilde r_R(p,p)\), not \(r'(p)\).

Seller remittance stays on the diagonal (\(R=p\)). **No change** to seller formulas.

---

## Notation (companion, \(\alpha=0\))

| Object | Meaning |
|--------|---------|
| \(\tilde r(p,R)\) | Aggregate return rate among buyers at checkout \(p\) with recovery \(R\) |
| \(r(p)=\tilde r(p,p)\) | Diagonal object already in the note |
| \(r'(p)=\tilde r_p(p,p)+\tilde r_R(p,p)\) | List-price slope of diagonal \(r\) |
| \(r_R:=\tilde r_R(p,p)\) | Recovery derivative at the diagonal (fixed purchase price) |
| \(\beta:=1-r(p)-(p+h)\,r_R\) | Buyer-tax pass-through factor at \(\tau=0\) |

**Honesty on signs:**

- \(\tilde r_p\): purchase-margin **selection only** (keep rule depends on \(R\), not \(p\)).
- \(\tilde r_R\): **behavioral** keep-threshold effect (positive) **plus** possible option-value selection (**unsigned**). So \(r_R\) is **not** always positive as a whole.

**Correct local buyer formulas at \(\tau=0\):**

\[
\mu^b_\tau=-\beta,\qquad \rho^b_\tau=\beta\,\rho_c.
\]

Link to old object: \(\mu_p-\beta=-(p+h)\tilde r_p\) (gap = purchase selection). If that selection is zero, \(\beta=\mu_p\) and the old formulas return.

---

## Where to introduce the bridge (exposition)

### Decision: Option B — bridge at buyer remittance, not at first \(r(p)\)

| Option | Approach | Verdict |
|--------|----------|---------|
| **A** | Introduce \(\tilde r(p,R)\) in Setting, then specialize to the diagonal | Reject for this note |
| **B** | Keep diagonal \(r(p)\) in Setting; introduce \((p,R)\) when buyer remittance appears | **Adopt** |

**Why B:** CS, supply, \(\mu(p,h)\), cost/handling pass-through, and seller tax all live on \(P=R=p\). Leading with bivariate \(r\) taxes every early section for a distinction that only bites for buyer-tax \(\tau\)-derivatives.

**Where to put the bridge:** in **Failure of tax neutrality** / buyer remittance clearing (not in the first \(r(p)\) display; not only in an appendix).

**Suggested beat at that door:**

1. Seller remittance: refund = checkout \(p\) → stays on the diagonal; \(r(p)\) as already defined.
2. Buyer remittance: checkout \(p\) still governs purchase; recovery is \(R=p-\tau\).
3. Return rate is \(\tilde r(p,R)\) among buyers at \(p\) with recovery \(R\); the note’s \(r(\cdot)\) is the diagonal \(\tilde r(p,p)\).
4. Clearing uses \(\tilde r(p,p-\tau)\). At \(\tau=0\), levels coincide with \(r(p)\); tax derivatives at fixed checkout use \(r_R\), not \(r'\).

**Optional one sentence in Setting (no new symbols):** the keep rule is written for refund = purchase price; that coincidence is relaxed under buyer remittance.

---

## Detailed changes in `welfare_with_returns.tex`

### A. Setting — light seed only

1. Optional one sentence: keep rule assumes refund = purchase price; relaxed under buyer remittance.
2. Do **not** introduce \(\tilde r(p,R)\) or \(r_R\) here.
3. Leave existing univariate \(r'(p)=\) behavioral + selection as the **diagonal** decomposition.

### B. Neutrality — introduce the bridge here

4. Seller clearing: unchanged (\(r(p)\)).
5. Buyer clearing: \(\tilde r(p,p-\tau)\) (or state that \(r(p-\tau)\) means that).
6. Neutrality Result / footnote: same object.
7. Prose: purchase at \(p\), returns at recovery \(R=p-\tau\).

### C. Pass-through — main algebra fix

8. **Delete** “\(\tau\) enters like \(-p\)” / \(\mu^b_\tau=-\mu_p\).
9. Replace with: at fixed checkout, tax lowers \(R\) one-for-one; \(\mu^b_\tau=-\beta\), \(\rho^b_\tau=\beta\rho_c\).
10. Result (i): \(\rho^b_\tau=\beta\rho_c\).
11. Result (ii): opposite signs iff \(\beta<0\) (not \(\mu_p<0\)).
12. Interpretive paragraph: \(\beta<0\Leftrightarrow r_R(p+h)>1-r\).
13. Optional: \(\mu_p-\beta=-(p+h)\tilde r_p\).

**Do not change:** \(\rho_c\), \(\rho_h\), \(\rho^s_\tau=\rho_c\), \(\mu_p=1-r-r'(p+h)\), elasticity / negative-\(\rho_c\) / classical \(\rho_c\) bias.

### D. Introduction / roadmap

14. Opposite-sign claim: key off \(\beta<0\), not \(\mu_p<0\).
15. Pareto / remittance welfare direction: re-check with \(\operatorname{sgn}(\beta\rho_c)\).
16. Buyer remittance scales welfare pieces by \(\beta\), not \(\mu_p\).

### E. Incidence

17. Table row \(\tau^b\): \(\rho_x=\beta\rho_c\), \(\mu_x=-\beta\).
18. Recompute \(dCS\), \(dPS\), \(I_x\) for buyer tax; verify common \(I_x\) formula.
19. Prose “buyer tax shifts mapping by \(\mu_p\)” → by \(\beta\).
20. Pareto paragraph when \(\rho_c<0\): re-verify opposite tax regimes.

### F. First-order \(W\) / EA–EP / buyer bias — rewrite, don’t find-replace

With correct objects,
\[
\frac{dW}{d\tau^b}=-Q\beta\Lambda,\qquad \Lambda=1+r'(p)(p+h)\rho_c,
\]
\[
\frac{dV}{d\tau^b}=Q(1-\beta\Lambda).
\]

21. DWL shocks: \(dW/d\tau^b=-Q\beta\Lambda\).
22. **Rewrite** buyer EA/EP: frozen-\(r\) factor is \(1-r\), not \(\beta\); \(\beta\) already includes fixed-\(p\) recovery channel via \(r_R\); price-path returns still use \(r'\) in \(\Lambda\).
23. Result EA–EP buyer sentences: replace.
24. Buyer bias corollary: \(\beta\Lambda\gtrless 1\); **re-derive** elasticity cut.
25. Table `buyer-bias-cases` + Cases 1–4: rebuild around \(\beta\) and \(r_R\) (use \(r'\) only for checkout-price path).
26. \(dV/d\tau^b=Q(1-\beta\Lambda)\).

### G. Appendix `appendix_welfare_bias_primitives.tex`

27. Buyer corollary proof: replace \(\mu_p\) algebra with \(\beta\); new cut if it still simplifies.

### H. Leave alone

- CS sufficiency of \((D,r)\) on the diagonal  
- Supply \(\mu(p,h)\), \(S\), \(PS\)  
- Cost / handling / seller-tax pass-through and their welfare  
- Classical \(\rho_c\) bias via \(\mu_p\gtrless 1\)

---

## Downstream: `partial_recovery.tex`

28. Buyer factor: \(1-r-(1-\alpha)(p+h)r_R\) (not \(r'\)).
29. At \(\alpha=0\), must match corrected companion \(\beta\).
30. Prose \(r'\lessgtr 0\) cases → focus on \(r_R\) (with honesty that \(r_R\) is not signed overall).
31. Buyer \(dW\)/\(dV\) factors accordingly.
32. Seller / \(\mu_p\) / reclaim seller factor \(1-\alpha r\): unchanged in structure.

---

## Implementation order

1. Setting seed sentence (optional) + neutrality bridge (\(\tilde r\), \(r_R\), \(\beta\))
2. Pass-through Result + intro claims
3. Incidence table
4. \(dW/d\tau^b\), \(dV\), EA/EP
5. Buyer bias corollary + cases table + appendix
6. Align `partial_recovery.tex`
7. Compile both PDFs (`pdflatex` ×2 each)

---

## Open choice before editing (resolved)

- **Exposition:** Option B (bridge at buyer remittance).  
- **Still confirm when implementing:** name the buyer factor \(\beta\) in the note, or write \(1-r-(p+h)r_R\) inline without an alias.
