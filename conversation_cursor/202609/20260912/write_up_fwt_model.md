# Proposal: FWT notes (no-return and returns in one note)

**Date:** 2026-09-21  
**Files:** `draft/FWT/model_fwt.tex`

## Design

One note, `model_fwt.tex`. Continuum of buyers and a continuum of identical price-taking firms. Consumer \(i\)'s income is \(\omega_i\) plus her share of industry profit. Constant unit cost \(c\). Walrasian price-taking (firms choose scale only), not Rothschild–Stiglitz menus or Bertrand posting.

## No returns

Setting plus competitive equilibrium. Value \(v_i\) is known at purchase. Both sides see \(p\). Positive demand forces \(p=c\). Firms meet the measure of buyers.

## Returns

Checkout price and refund are two prices. Handling cost \(h\) on salvaged returns. Types \((G_i,\kappa_i)\). Keep iff \(v\geq R-\kappa_i\). Buy iff \(cs_i(p,R)\geq 0\). Effective margin \(\mu=p-r(R+h)\). Return rate \(r(p,R)\) is the mean of \(\phi_i(R)\) among buyers.

Competitive equilibrium when demand is positive:
\[
  p-r(p,R)\,(R+h)=c.
\]
One equation in two prices, so many pairs. Any such pair is a CE: consumers optimize at \((p,R)\), \(\mu=c\) so firms supply any scale, industry meets demand.

Efficiency of keep requires \(R=-h\), hence \(p=c\). That pair satisfies the CE equation, so the efficient allocation can be sustained as a competitive equilibrium. Other solutions are CE at which consumers return too often or too rarely. \(R=-h\) is not implied by scale choice.

## Not in this note

Separate `fwt_no_return.tex` dropped. Two technologies, trial/keep accounting, and Bertrand pinning of \(R\) postponed.
