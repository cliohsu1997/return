# Revise CS/PS supply-shift figure (μ_p > 0 case) — to-do

- [x] Verify structural-model closed forms (CS softplus, WTP shift `c_σ(κ)`, probit demand, `φ(v,p)`).
- [x] Implement `r(p)` as a numerical 1-D integral on the price grid; cache it.
- [x] Compute `r'(p)` by finite differences; verify `μ_p^0 > 0` over the plotted range.
- [x] Replace `demand_quantity`, `return_rate_*`, `effective_margin`, `quantity_supplied` in `figuretable/code/plot_cs_ps_supply_shift.R` with structural versions.
- [x] Reduce to a single `μ_p > 0` panel (drop the `μ_p < 0` panel); keep legend.
- [x] Confirm ΔCS and ΔPS shading uses `D(p)(1−r(p))` (kept demand) and the two supply curves.
- [x] Cap x-axis to the relevant quantity range so all curves are readable.
- [x] Run the script; produce `figuretable/output/cs_ps_mu_sign.pdf` and `.png`.
- [x] Sanity-check the figure: demand downward sloping, aggregate return below demand, supply upward sloping, supply-after-cost shifted up, equilibria marked.
- [x] Update task summary and progress.
