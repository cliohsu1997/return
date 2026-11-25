# Plan: No-buyer-tax welfare evaluation and what comes next

Date: 2026-11-25.
File: `draft/welfare_foundation/welfare_with_returns_no_buyer_tax.tex`.

## What this is for

The note now has a complete first-order welfare treatment of a seller-remitted
platform fee (unit tax $t$, retained share $\beta$ on returns) under returns.
This plan records the verified state of that evaluation and lists the remaining
questions. No `.tex` changes were needed: the algebra below was checked and is
sound.

## Verified welfare results (current state)

All local, at the current equilibrium, with $Q\equiv D(p)$, $r\equiv r(p)$,
$\theta\equiv 1-r+\beta r$, and $\mu_p=1-r-r'\bigl[p+h-(1-\beta)t\bigr]$.

1. **Joint (private) surplus** $W\equiv CS+PS$:
   - $dW/dc=-Q\Lambda$, $dW/dh=-Qr\Lambda$, $dW/dt=-Q\theta\Lambda$,
     where $\Lambda\equiv 1+r'(p)\rho_c\bigl[p+h-(1-\beta)t\bigr]$.
   - Ex-ante rectangle vs ex-post keep/return term, and the three regimes
     (offset $0<\Lambda<1$, amplification $\Lambda>1$, reversal $\Lambda<0$),
     all correct.

2. **Social surplus** $V\equiv W+G$ with platform revenue $G=Qt\theta$:
   - $dV/dt=D'(p)\,t\theta^{2}\rho_c-Q\theta\,r'(p)\rho_c(p+h)$
     (`eq:dV-simple`), correct after the $(1-\beta)t$ refund cancels.
   - Sign cases (`res:tax-welfare`): negative pass-through $\Rightarrow dV/dt>0$;
     behavioral-positive $\rho_c\Rightarrow dV/dt<0$; selection $\Rightarrow$
     sign of $-Qr'(p)(p+h)+D'(p)t\theta$.
   - Retained share: $dV/d\beta=(rt/\theta)\,dV/dt$ (`res:beta-welfare`).

3. **Margins** (`res:efficiency-margins`): purchase margin over/underprovision
   iff $(\phi(p,p)-r)(p+h)\gtrless t\theta$; return margin term
   $-Q(p+h)r'_b(p)\rho_t$. Marginal social benefit = marginal social cost
   algebra checks out.

## What is not done yet

These follow directly from the note's own first-order objects but are not stated.

### 1. Optimal retained share $\beta^\ast$ is a corner (state it)

`res:beta-welfare` gives $dV/d\beta=(rt/\theta)\,dV/dt$ with $rt/\theta>0$ for
$t>0$, $r>0$. Hence $\beta$ is monotone in $V$ and the optimum is a corner:
- $\beta^\ast=0$ (full refund) iff $dV/dt<0$;
- $\beta^\ast=1$ (keep the whole fee) iff $dV/dt>0$;
- any $\beta$ iff $dV/dt=0$.

Make this explicit; it answers the "is the refund administration fee good?"
question cleanly (Q4 of `frame_referral_fee_questions.md`).

### 2. Interior optimal tax $t^\ast$ (Laffer cut), if it exists

Set `eq:dV-simple` to zero:
\[
  t^\ast=\frac{Q\,r'(p)(p+h)}{D'(p)\,\theta},
\]
positive iff $r'(p)<0$ (selection dominates). At fixed $\beta$ this is the
candidate interior optimum. But $Q,r',\theta,D'$ all move with $t$, so the
statement is a local fixed-point condition, not a closed-form optimum. Next:
(a) state the first-order condition, (b) check the sign of $dV^2/dt^2$ at the
candidate, (c) identify whether the global optimum is interior or a corner
($t=0$ or a prohibitive $t$).

### 3. Total deadweight loss (Harberger with returns)

The bib already contains `harberger_measurement_1964` but the note never cites
it. Integrate $dV/dt$ along the tax path to get $V(t)-V(0)$, and compare with
the no-return triangle. The local sign results do not deliver the total DWL or
whether returns shrink vs expand it. This is the natural place to use Harberger.

### 4. Nest with the buyer-tax note

`welfare_with_returns.tex` has seller remittance $\mu^s=\mu(p,h)-\tau$ (zero
reclaim) and buyer remittance. Here the platform fee gives
$\mu=(1-r)(p-t)-r(\beta t+h)=p-r(p+h)-t\theta$. Two fixed points:
- $\beta=1\Rightarrow\theta=1$, so the platform fee is exactly seller
  remittance with $\tau=t$ (seller pays $t$ on every sale, kept or returned).
- $\beta\in[0,1)$ is a richer family the buyer-tax note does not cover, because
  the fee is refunded in part.

State this bridge in one place so the two notes are not two disconnected
objects.

### 5. A welfare-regime figure (optional)

`fig:cs_ps_mu_sign` already plots the supply/CS/PS geometry. Add the dual
figure mapping $r'(p)$ to the $\Lambda$ regimes and the sign of $dV/dt$
(offset / amplification / reversal, plus the $r'<0$ selection region). This
makes `res:welfare-bias` and `res:tax-welfare` one picture.

## Suggested order

1. State $\beta^\ast$ corner (small, closes Q4).
2. Add the $t^\ast$ FOC + SOC paragraph; decide corner vs interior.
3. Integrate $dV/dt$ for total DWL (cite Harberger).
4. Add the one-paragraph bridge to `welfare_with_returns.tex`.
5. Recompile `welfare_with_returns_no_buyer_tax.pdf` (one `pdflatex` pass)
   after each `.tex` edit, per the workspace LaTeX rule.