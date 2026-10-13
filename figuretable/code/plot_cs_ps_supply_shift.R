## CS/PS figure: mu_p^0 > 0 vs mu_p^0 < 0 (with supply shift / pass-through)
## Graph 1 (mu_p^0 > 0): supply S(mu^s(p)) is increasing (curved).
## Graph 2 (mu_p^0 < 0): supply is a CURVED, MONOTONE DECREASING, elastic
## line; a cost increase shifts it left and the equilibrium price FALLS
## (negative pass-through). D(p)r(p) is curved in both panels. The shaded
## CS and PS regions are the CHANGES (Delta CS, Delta PS) between the two
## equilibria. See
## conversation_cursor/202610/20261013/revise_cs_ps_supply_shift_figure.md.

script_arg <- grep("^--file=", commandArgs(trailingOnly = FALSE), value = TRUE)
script_path <- normalizePath(sub("^--file=", "", script_arg), winslash = "/")
output_dir <- file.path(dirname(dirname(script_path)), "output")
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

## ---- Parameters --------------------------------------------------------
handling_cost <- 0.25
a_supply <- 0.4
b_supply <- 2.5

## ---- Curves ------------------------------------------------------------
demand_quantity <- function(price) {
  1.5 * pmax(1 - price / 1.3, 0)^1.65
}

## Return rates: decreasing for mu_p^0 > 0 (selection dominates), increasing
## for mu_p^0 < 0 (behavioral dominates). Both give a visibly curved D(p)r(p).
return_rate_pos <- function(price) 0.45 * exp(-2.5 * price)
return_rate_neg <- function(price) 0.03 + 0.9 * price^1.2

effective_margin <- function(price, return_rate) {
  r <- return_rate(price)
  (1 - r) * price - r * handling_cost
}

quantity_supplied <- function(price, return_rate, cost = 0) {
  gap <- effective_margin(price, return_rate) - cost
  (pmax(gap, 0) / a_supply)^b_supply
}

## Curved, monotone DECREASING, elastic supply for the mu_p^0 < 0 panel:
## Q_s(p) = A * (1 - (p/B)^c), c > 1 for curvature, zero at p = B.
supply_A <- 1.7
supply_B <- 0.65
supply_c <- 1.6
supply_down <- function(price) {
  pmax(supply_A * (1 - (price / supply_B)^supply_c), 0)
}
## Cost increase shifts this supply LEFT (less Q at each price).
supply_down_after <- function(price, shift) {
  pmax(supply_down(price) - shift, 0)
}

crossing_price <- function(price_grid, supply_fn) {
  excess <- demand_quantity(price_grid) - supply_fn(price_grid)
  sign_change <- which(excess[-1] * excess[-length(excess)] <= 0)
  if (length(sign_change) < 1) return(NA)
  price_grid[sign_change[1]]
}

## ---- Drawing ----------------------------------------------------------
draw_panel <- function(return_rate, panel_title, supply_type = "up",
                       cost_shift = 0.08, shift_qty = 0.15, label = "") {
  price_grid <- seq(0.02, 1.45, length.out = 1500)

  if (supply_type == "up") {
    supply_fn  <- function(p) quantity_supplied(p, return_rate)
    supply_new <- function(p) quantity_supplied(p, return_rate, cost = cost_shift)
  } else {
    supply_fn  <- supply_down
    supply_new <- function(p) supply_down_after(p, shift_qty)
  }

  price_eq  <- crossing_price(price_grid, supply_fn)
  price_new <- crossing_price(price_grid, supply_new)
  cat("  ", label, " equilibrium: p* =", round(price_eq, 3),
      " Q* =", round(demand_quantity(price_eq), 3), "\n")
  cat("  ", label, " after-cost equilibrium: p* =", round(price_new, 3),
      " Q* =", round(demand_quantity(price_new), 3), "\n")

  quantity_demand    <- demand_quantity(price_grid)
  quantity_returned   <- quantity_demand * return_rate(price_grid)
  quantity_supply     <- supply_fn(price_grid)
  quantity_supply_new <- supply_new(price_grid)

  q_max <- 2.6
  plot(x = NA, xlim = c(0, q_max), ylim = c(0, 1.5), xlab = "", ylab = "", bty = "l",
       xaxt = "n", yaxt = "n")

  q_eq  <- demand_quantity(price_eq)
  q_new <- demand_quantity(price_new)
  rQ_eq <- quantity_returned[which.min(abs(price_grid - price_eq))]

  ## Absolute CS: area between D(p) and D(p)r(p) ABOVE the baseline price p*.
  above <- price_grid >= price_eq
  polygon(
    x = c(quantity_demand[above], rev(quantity_returned[above])),
    y = c(price_grid[above], rev(price_grid[above])),
    col = gray(0.82), border = NA
  )

  ## Absolute PS: area between the baseline supply curve and the price line p*.
  if (supply_type == "up") {
    ps_idx <- which(quantity_supply > 0 & price_grid <= price_eq)
  } else {
    ps_idx <- which(quantity_supply > 0 & price_grid >= price_eq)
  }
  polygon(
    x = c(quantity_supply[ps_idx], 0),
    y = c(price_grid[ps_idx], price_eq),
    col = gray(0.55), border = NA
  )

  ## Supply curves (blue solid, red dashed after cost), where Q > 0.
  pos <- quantity_supply > 0
  pos_new <- quantity_supply_new > 0
  lines(x = quantity_supply[pos], y = price_grid[pos], lwd = 2.5, col = "dodgerblue3")
  lines(x = quantity_supply_new[pos_new], y = price_grid[pos_new], lwd = 2.5, lty = 2, col = "red")

  lines(x = quantity_demand, y = price_grid, lwd = 2.5)
  lines(x = quantity_returned, y = price_grid, lwd = 2, lty = 4, col = gray(0.4))

  ## Equilibrium points and price lines.
  segments(x0 = 0, x1 = q_eq,  y0 = price_eq,  y1 = price_eq,  lty = 3, col = gray(0.5))
  segments(x0 = 0, x1 = q_new, y0 = price_new, y1 = price_new, lty = 3, col = gray(0.7))
  segments(x0 = q_eq,  x1 = q_eq,  y0 = 0, y1 = price_eq, lty = 3, col = gray(0.5))
  segments(x0 = rQ_eq, x1 = rQ_eq, y0 = 0, y1 = price_eq, lty = 3, col = gray(0.5))
  points(x = c(q_eq, q_new), y = c(price_eq, price_new), pch = 16, cex = 0.9)

  ## Axis labels: only Q, rQ (x) and p (y) at the baseline equilibrium.
  axis(1, at = c(rQ_eq, q_eq), labels = c(expression(r * Q), expression(Q)), cex.axis = 1.3)
  axis(2, at = price_eq, labels = expression(p), las = 1, cex.axis = 1.3)

  title(main = panel_title, cex.main = 1.4)
  title(xlab = "Quantity", ylab = "List price")
  box(bty = "u")
}

draw_legend <- function() {
  legend(
    x = "topright",
    legend = c(
      expression(D(p)),
      expression(D(p) * r(p)),
      "Supply",
      "Supply (c \U2191)",
      "CS",
      "PS"
    ),
    lty = c(1, 4, 1, 2, NA, NA),
    lwd = c(2.5, 2, 2.5, 2.5, NA, NA),
    pch = c(NA, NA, NA, NA, 15, 15),
    pt.cex = c(NA, NA, NA, NA, 1.8, 1.8),
    col = c("black", gray(0.4), "dodgerblue3", "red", gray(0.82), gray(0.55)),
    bty = "n", cex = 1.25
  )
}

mu_p_diagnostic <- function(return_rate, label) {
  pg <- seq(0.04, 1.45, length.out = 200)
  r_vals <- return_rate(pg)
  r_prime <- c(diff(r_vals) / diff(pg), tail(diff(r_vals) / diff(pg), 1))
  mu_p <- 1 - r_vals - (pg + handling_cost) * r_prime
  cat(label, "mu_p^0 range on [0.04, 1.45]:", range(mu_p), "\n")
}

save_figure <- function() {
  layout(mat = matrix(c(1, 2), nrow = 1), widths = c(1, 1))
  par(mar = c(4.2, 4.2, 4.2, 1), family = "sans", las = 1)

  mu_p_diagnostic(return_rate_pos, "mu_p^0 > 0 panel:")
  draw_panel(return_rate = return_rate_pos,
             panel_title = expression(mu[p]^0 > 0 ~ "(strong selection channel)"),
             supply_type = "up", cost_shift = 0.08, label = "mu_p>0")

  mu_p_diagnostic(return_rate_neg, "mu_p^0 < 0 panel:")
  draw_panel(return_rate = return_rate_neg,
             panel_title = expression(mu[p]^0 < 0 ~ "(strong behavioral channel)"),
             supply_type = "down", shift_qty = 0.15, label = "mu_p<0")
  draw_legend()
}

png(file = file.path(output_dir, "cs_ps_mu_sign.png"), width = 10.5, height = 5, units = "in", res = 180)
save_figure()
dev.off()
