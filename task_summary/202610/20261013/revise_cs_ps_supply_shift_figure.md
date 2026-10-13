# Revise CS/PS figure (mu_p > 0 vs mu_p < 0) — task summary

## Objective

Re-derive the CS/PS figure from a returns model, contrasting the `mu_p^0 > 0`
and `mu_p^0 < 0` regimes, with demand `D(p)`, aggregate returns `D(p)r(p)`,
and seller supply `S(mu^s(p))`, shading CS and PS at equilibrium, and
illustrating the supply-curve shift under a cost shock with **positive vs
negative pass-through**.

## Status

Done. Two-panel figure regenerated with supply shift, distinct colors, and
legend in the top-right corner of the right panel.

## Structural logic

- Gross demand: `D(p) = 1.5 * max(1 - p/1.3, 0)^1.65` (classical, downward sloping).
- Return rate:
  - `mu_p^0 > 0` panel: `r(p) = 0.70 exp(-3.0 p)` (decreasing, fast decay so
    `D(p)r(p)` is visibly curved; selection channel dominates, so
    `mu_p^0 = 1 - r - (p+h)r' > 1 - r > 0`).
  - `mu_p^0 < 0` panel: `r(p) = 0.03 + 0.9 p^1.2` (increasing; behavioral
    channel dominates, so `(p+h)r' > 1 - r` and `mu_p^0 < 0` at high p).
- Effective margin: `mu^s(p) = (1 - r(p)) p - r(p) h`, `h = 0.25`.
- Supply:
  - `mu_p^0 > 0` panel: model supply `S(mu) = (max(mu, 0)/0.22)^2.0` via the
    effective margin (upward sloping, curved, because `mu_p^0 > 0`). Supply
    after cost uses `S(mu - c)` with `c = 0.08` (shifts up/left -> higher
    equilibrium price, positive pass-through).
  - `mu_p^0 < 0` panel: curved, MONOTONE DECREASING, elastic supply
    `Q_s(p) = 1.8 * (1 - (p/0.7)^1.5)`, zero at `p = 0.7`. A cost increase
    shifts it LEFT (less Q at each price, `Q_s - 0.15`) -> LOWER equilibrium
    price (negative pass-through). Not backward-bending/hump-shaped.

## Why supply is non-monotone in the model (mu_p^0 < 0 regime)

Supply is `S(mu^s(p))`, increasing in the effective margin. Its slope w.r.t.
price is `S'(mu) * mu_p^0` where `mu_p^0 = 1 - r(p) - (p + h) r'(p)`:
- Low p: `r`, `r'` small, `mu_p^0 ~ 1 - r > 0` -> supply rises.
- High p: `r`, `r'` large (behavioral channel dominates), `(p+h)r' > 1 - r`,
  `mu_p^0 < 0` -> supply falls.
The supply curve peaks where `mu_p^0 = 0` and bends back. This is the
negative-pass-through region. (The figure uses a simple downward-sloping
line for visual clarity rather than the full backward-bending curve.)

## Surplus shading (ABSOLUTE levels, not changes)

- **CS**: area between `D(p)` and `D(p)r(p)` ABOVE the baseline equilibrium
  price `p*` (the area under kept demand `D(p)(1-r(p))`), matching
  `CS'(p) = -D(p)(1-r(p))`. Light gray solid fill.
- **PS**: area between the baseline supply curve and the equilibrium price
  line `p*` (producer surplus at the baseline equilibrium). Hatched fill.

## Colors and legend

- `D(p)`: solid black.
- `D(p)r(p)`: dash-dotted gray.
- Supply (original): solid **dodgerblue3** (bright blue, distinct from black demand).
- Supply after cost: dashed **red**, labeled "Supply after production cost increase".
- Legend in top-right of the right panel, `cex=1.25`; CS/PS as solid
  squares (`pt.cex=1.8`), lines for the four curves.
- Axis tick labels at the baseline equilibrium: `p` on the y-axis at
  `p*`, `Q` on the x-axis at `Q*`, `rQ` on the x-axis at `r(p*)Q*`.

## Inclusion in the paper

- Added `\usepackage{graphicx}` to the preamble of
  `draft/welfare_foundation/welfare_with_returns_no_buyer_tax.tex`.
- Inserted the figure in the **Local incidence** section, right after the
  `Q\equiv D(p)` and `r\equiv r(p)` definition, with a caption explaining
  CS, PS, `Q`, `rQ`, `p`, and the two regimes (`mu_p^0 > 0` vs `mu_p^0 < 0`).
  Label: `fig:cs_ps_mu_sign`.

## Supply shift direction (mu_p^0 < 0 panel)

The illustrative supply is the flat (elastic) downward-sloping line
`Q_s(p) = 2.0 * (1 - p/0.7)`. A cost **increase** shifts it **left**
(less Q at each price, `supply_after = supply - 0.30`). Because supply is
flatter (more elastic) than demand near the crossing, the leftward shift
moves the equilibrium to a **lower** price -- negative pass-through, the
signature of the `mu_p^0 < 0` regime.

## Equilibria (final parameters)

- `mu_p^0 > 0`: baseline `p* = 0.353`, `Q* = 0.889`; after cost `p* = 0.411`,
  `Q* = 0.801` (positive pass-through). `mu_p^0 in [0.91, 1.20]`.
- `mu_p^0 < 0`: baseline `p* = 0.521`, `Q* = 0.645`; after cost `p* = 0.436`,
  `Q* = 0.765` (negative pass-through, price falls). Model `mu_p^0 in [-2.41, 0.78]`.

## Deliverables

- `figuretable/code/plot_cs_ps_supply_shift.R` (revised).
- `figuretable/output/cs_ps_mu_sign.pdf`, `.png` (regenerated).
- `conversation_cursor/202610/20261013/revise_cs_ps_supply_shift_figure.md`.

## Related files

- `draft/welfare_foundation/welfare_with_returns_no_buyer_tax.tex` (model source; not modified).
