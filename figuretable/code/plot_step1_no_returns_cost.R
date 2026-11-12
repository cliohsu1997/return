## Step 1, no returns. A unit rise in production cost.
## Buyers bear Q * rho_c. Sellers bear Q * (1 - rho_c).
## The two pieces sum to the joint-surplus loss Q.

script_arg <- grep(
  "^--file=",
  commandArgs(trailingOnly = FALSE),
  value = TRUE
)
script_path <- normalizePath(
  sub("^--file=", "", script_arg),
  winslash = "/"
)
output_dir <- file.path(
  dirname(dirname(script_path)),
  "output"
)
dir.create(
  output_dir,
  recursive = TRUE,
  showWarnings = FALSE
)

## Inverse demand p = a_d - b_d q. Inverse supply p = c + b_s q.
a_d <- 6
b_d <- 0.4
b_s <- 0.4
c0 <- 1
dc <- 1

quantity_at <- function(
  cost
) {
  (
    a_d -
      cost
  ) /
    (
      b_d +
        b_s
    )
}

price_demand <- function(
  quantity
) {
  a_d -
    b_d *
      quantity
}

price_supply <- function(
  quantity,
  cost
) {
  cost +
    b_s *
      quantity
}

q0 <- quantity_at(c0)
p0 <- price_demand(q0)
q1 <- quantity_at(c0 + dc)
p1 <- price_demand(q1)
rho_c <- p1 - p0

q_demand <- seq(
  0,
  a_d / b_d,
  length.out = 400
)
q_supply <- seq(
  0,
  9,
  length.out = 400
)

png(
  file = file.path(
    output_dir,
    "step1_no_returns_cost.png"
  ),
  width = 8.2,
  height = 6.4,
  units = "in",
  res = 180
)
par(
  mar = c(5.6, 5.4, 3.2, 1.2),
  family = "sans",
  las = 1
)
plot(
  x = NA,
  xlim = c(0, 9.2),
  ylim = c(0, 6.4),
  xlab = "Quantity",
  ylab = "Price",
  bty = "l",
  xaxt = "n",
  yaxt = "n"
)

lines(
  x = q_demand,
  y = price_demand(q_demand),
  lwd = 2.4
)
lines(
  x = q_supply,
  y = price_supply(q_supply, c0),
  lwd = 2.4,
  col = "dodgerblue3"
)
lines(
  x = q_supply,
  y = price_supply(q_supply, c0 + dc),
  lwd = 2.4,
  lty = 2,
  col = "firebrick"
)

segments(
  x0 = 0,
  x1 = q0,
  y0 = p0,
  y1 = p0,
  lty = 3,
  col = gray(0.45)
)
segments(
  x0 = 0,
  x1 = q1,
  y0 = p1,
  y1 = p1,
  lty = 3,
  col = gray(0.45)
)
segments(
  x0 = q0,
  x1 = q0,
  y0 = 0,
  y1 = p0,
  lty = 3,
  col = gray(0.45)
)
segments(
  x0 = q1,
  x1 = q1,
  y0 = 0,
  y1 = p1,
  lty = 3,
  col = gray(0.45)
)
points(
  x = c(q0, q1),
  y = c(p0, p1),
  pch = 16,
  cex = 0.95
)

axis(
  1,
  at = c(q1, q0),
  labels = c(
    expression(Q * "'"),
    expression(Q)
  ),
  cex.axis = 1.15
)
axis(
  2,
  at = c(p0, p1),
  labels = c(
    expression(p),
    expression(p + rho[c])
  ),
  las = 1,
  cex.axis = 1.05
)

legend(
  x = "topright",
  legend = c(
    "Demand",
    "Supply",
    "Supply, cost + 1"
  ),
  lty = c(1, 1, 2),
  lwd = c(2.4, 2.4, 2.4),
  col = c(
    "black",
    "dodgerblue3",
    "firebrick"
  ),
  bty = "n",
  cex = 0.95
)

title(
  main = "No returns: the price transfer cancels",
  cex.main = 1.15
)
mtext(
  side = 1,
  line = 4.2,
  cex = 0.9,
  text = expression(
    "Buyers bear " * Q * rho[c] *
      ".   Sellers bear " * Q * (1 - rho[c]) *
      ".   Joint surplus falls by " * Q * "."
  )
)
dev.off()
