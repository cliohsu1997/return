# Revise CS/PS supply-shift figure (μ_p > 0 case)

## Objective

Replace the ad hoc functional forms in `figuretable/code/plot_cs_ps_supply_shift.R`
with primitives from a structural RSI-style model, derive the demand,
aggregate-return, and supply curves analytically where possible, and redraw the
cost-shock incidence figure for the case `μ_p^0 > 0` only.

## Structural model (RSI paper style)

Ex-ante valuation `ν_i = μ + ξ + ω·ε_i`, `ε_i ~ N(0,1)`, so
`ν ~ N(m_ν, ω²)` with `m_ν = μ + ξ`. Return hassle `κ` (non-monetary, common).
Return-shipping coverage `k_i` is held fixed/reimbursed in the baseline
(RI-style: return shipping reimbursed, no buyer-side premium), so the return
branch mean utility is `u_return = -κ`.

After delivery, consumer `i` draws idiosyncratic match shocks `ε_keep_i` and
`ε_return_i`, **Type-I extreme value with mean 0 and scale `1/σ`** (ex-post
precision `σ`). Realized utilities:
`U_keep = (ν_i - p) + ε_keep`, `U_return = -κ + ε_return`.

### Closed forms

1. **Individual consumer surplus** (logit softplus, mean-0 Gumbel shocks):
   `cs(p; ν) = (1/σ)·log(exp(σ(ν - p)) + exp(-σκ))`.

2. **Willingness to pay** (solves `cs(v; ν) = 0`):
   `v = ν + c_σ(κ)`, where `c_σ(κ) = (1/σ)·log(1/(1 - exp(-σκ)))`.
   Hence `v ~ N(m_ν + c_σ(κ), ω²)`.

3. **Gross demand** (probit, closed form):
   `D(p) = Pr(v ≥ p) = Φ((m_ν + c_σ(κ) - p)/ω)`.

4. **Conditional return probability** for a buyer with WTP `v`:
   The difference of two mean-0 Gumbels(scale `1/σ`) is `Logistic(0, 1/σ)`, so
   `φ(v, p) = 1 / (1 + A·exp(σ(v - p)))`, with `A = exp(σκ) - 1`.

5. **Aggregate return rate** (1-D integral, evaluated numerically):
   `r(p) = (1/D(p)) ∫_p^∞ φ(v, p) f(v) dv`,
   where `f` is the `N(m_ν + c_σ(κ), ω²)` density. Integrand is a smooth
   logistic × normal; no elementary closed form, evaluated by quadrature on
   a fine grid (cached). `r'(p)` by finite differences on the cached grid.

6. **Kept-demand curve** (used only as the ΔCS shading boundary, not plotted):
   `D(p)(1 - r(p))`. **Aggregate return curve** (plotted): `D(p)·r(p)`.

7. **Effective margin** (no-tax baseline, from
   `draft/welfare_foundation/welfare_with_returns_no_buyer_tax.tex`):
   `μ^s(p) = (1 - r(p)) p - r(p) h`,
   `μ_p^0 = 1 - r(p) - (p + h) r'(p)`.
   With the logistic return probability the selection channel tends to make
   `r'(p) ≤ 0`, giving `μ_p^0 > 1 - r > 0`; verify numerically over the
   plotted range and adjust parameters if needed.

8. **Supply curve**: `S(μ) = (max(μ, 0)/a)^b`, upward sloping. Plotted against
   `p` as `S(μ^s(p))`, upward sloping because `μ_p^0 > 0`.

### Cost shock

A production-cost increase `c` shifts supply to `S(μ^s(p) - c)`. Equilibria
solve `D(p) = S(μ^s(p) - c)` on a price grid. Shade:
- **ΔCS**: between `p_old` and `p_new`, under `D(p)(1 - r(p))`.
- **ΔPS**: between the two supply curves, between the two equilibrium
  quantities.

## Parameter choices (baseline)

- `m_ν = 1.0`, `ω = 0.30` (valuation distribution).
- `σ = 2.0` (ex-post precision; Gumbel scale `1/σ = 0.5`).
- `κ = 0.5` (return hassle).
- `h = 0.25` (handling cost).
- Supply: `a = 0.22`, `b = 1.55`.
- Cost shock: `c = 0.06`.
- Price grid: `seq(0.04, 1.6, length.out = 600)`.

## Design decisions

- **Mean utility consistent with `welfare_with_returns_no_buyer_tax.tex`**:
  keep payoff `u - p`, return payoff `-κ`, with match quality `u = ν + ε`.
  The ex-post shock SD is a free parameter (`σ` precision → Gumbel scale
  `1/σ`, SD `π/(σ√6)`).
- **r(p) handling**: numerical 1-D integral over `v` from `p` to a high
  cutoff (`p + 10ω`), cached on the price grid.
- **Plotted curves**: `D(p)`, `D(p)r(p)`, supply, supply-after-cost only.
  `D(p)(1-r(p))` is not plotted; it is used only as the upper boundary of the
  ΔCS shading (since `CS'(p) = -D(p)(1-r(p))` per the tex).
- **Scope**: only the `μ_p > 0` panel. The `μ_p < 0` panel is dropped.
- **Output**: `figuretable/output/cs_ps_mu_sign.pdf` and `.png` (overwrite).
- **No `.tex` under `draft/` is touched**, so no LaTeX recompile is required.

## Risks / open items

- Verify `μ_p^0 > 0` across the plotted price range with the chosen
  parameters; if it flips sign, tighten `ω` or lower `h`.
- Smoothness of `r'(p)` from finite differences.
