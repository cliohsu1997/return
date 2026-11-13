# Rewrite: "First-order effect on joint surplus and ex-ante ex-post decomposition"

Date: 2026-10-25. Companion to `restructure_joint_surplus_section.md` (same folder).
Target: `draft/welfare_foundation/welfare_with_returns_no_buyer_tax.tex`, subsection `sec:private-surplus`.
Status: proposed prose for review. Not yet applied to the `.tex`.

## What changed relative to the current draft

1. Opening writes the raw first-order effect first; $\Lambda$ is defined only after the cancellation, at `eq:Lambda`.
2. Wrong gloss fixed: the $1$ in $\Lambda$ is the drain on units that continue to sell, not "units no longer sold".
3. Reason for $\rho_c>0$ fixed in the offset case: $r'<0 \Rightarrow \mu_p^0>0 \Rightarrow$ positive pass-through.
4. Offset / amplify / reverse paragraphs now share one skeleton and each ends with a magnitude clause.
5. Duplicate ending of the offset paragraph deleted.
6. Ex-ante / ex-post labels stated once, in the lead-in; Result `res:EA-EP` keeps only the displays.
7. Prose re-listing of the three bias cases deleted; two-sentence hinge into Result `res:welfare-bias`.
8. Platform-revenue paragraph: gain/loss cases now named in parallel with the three regimes.
9. Everything else unchanged: displays, Results `res:EA-EP` and `res:welfare-bias`, and the proof.

## Full rewritten subsection

```latex
\subsection{First-order effect on joint surplus and ex-ante ex-post decomposition}
\label{sec:private-surplus}

Joint surplus is the sum of consumer and producer surplus, $W\equiv CS+PS$.
Its first-order response to a production-cost increase is the sum of the
consumer and producer responses in Table~\ref{tab:incidence_components},
namely $-Q(1-r)\rho_c$ and $Q(\mu_p^0\rho_c-1)$. Adding them gives
\begin{equation}
  \frac{dW}{dc}
  =
  -Q(1-r)\rho_c+Q(\mu_p^0\rho_c-1).
  \label{eq:dW-c-raw}
\end{equation}
The kept-unit pieces $(1-r)\rho_c$ cancel. At a zero tax,
$\mu_p^0=1-r(p)-(p+h)r'(p)$, and substituting it into \eqref{eq:dW-c-raw}
leaves
\begin{equation}
  \frac{dW}{dc}=-Q\Lambda,
  \qquad
  \Lambda\equiv 1+r'(p)(p+h)\rho_c.
  \label{eq:Lambda}
\end{equation}
The one in $\Lambda$ is the direct resource drain of the cost increase on
the $Q$ units that continue to sell. The price changes in consumer and
producer surplus cancel, and the units that stop selling contribute only a
second-order loss. The term $r'(p)(p+h)\rho_c$ is the further change from
units that switch between keep and return. The induced change in the return
rate is $r'(p)\rho_c$, and each switched unit costs $p+h$, because the buyer
at the keep margin is indifferent and the seller loses the price $p$ and pays
the handling cost $h$. Without returns this term is zero, so it is exactly the
first-order effect that the classical formula misses.

Handling cost and the tax scale this change by $r$ and by $\theta$. In
Table~\ref{tab:incidence_components}, their consumer and producer changes are
the production-cost changes multiplied by those factors. Both pieces of
$\Lambda$ therefore scale, and
\begin{equation}
  \frac{dW}{dh}=-Qr\Lambda,
  \qquad
  \frac{dW}{d\tau}=-Q\theta\Lambda.
  \label{eq:dW-shocks}
\end{equation}

Freezing the return rate separates an ex-ante rectangle on the purchase margin
from an ex-post term on the keep-or-return margin. With $r'(p)=0$, the factor
$\Lambda$ equals one. A unit production-cost increase then shifts supply up by
one dollar at every quantity. The price changes in consumer and producer
surplus cancel, and joint surplus falls by the rectangle of height one and
width $Q$. Handling cost leaves the rectangle $Qr$, and the tax leaves the
rectangle $Q\theta$. These rectangles are the ex-ante term, what the change
would be if returns did not respond to the price. The gap between the actual
change $-Q\Lambda$ and this rectangle is the ex-post term
$-Q\,r'(p)(p+h)\rho_c$, scaled by $r$ or by $\theta$ for the other two shocks.
\begin{result}[Ex-ante and ex-post decomposition]
\label{res:EA-EP}
\begin{align}
  \frac{dW}{dc}
  &=
  -Q-Q\,r'(p)(p+h)\rho_c,
  \label{eq:dW-decomp} \\
  \frac{dW}{dh}
  &=
  -Qr-Qr\,r'(p)(p+h)\rho_c, \\
  \frac{dW}{d\tau}
  &=
  -Q\theta-Q\theta\,r'(p)(p+h)\rho_c.
\end{align}
\end{result}

The ex-post term offsets, amplifies, or reverses the rectangle, and these
cases line up with the sign of pass-through. Offsetting means
$0<\Lambda<1$, amplification means $\Lambda>1$, and reversal means
$\Lambda<0$. Because $dW/dc=-Q\Lambda$, joint surplus falls when $\Lambda$ is
positive and rises when $\Lambda$ is negative.
Result~\ref{res:incidence-ratio} says that the two surpluses move together.
They fall when $\rho_c>0$ and rise when $\rho_c<0$, so $\Lambda$ has the same
sign as $\rho_c$.

When the selection channel dominates, the ex-post term offsets part of the
rectangle and cannot reverse the loss. Then $r'(p)<0$, so $\mu_p^0>0$ and
pass-through is positive. The list price rises and screens out frequent
returners, so the return rate falls. The product $r'(p)\rho_c$ is therefore
negative, and the ex-post term $-Q\,r'(p)(p+h)\rho_c$ is a gain that cuts the
loss from $Q$ to $Q\Lambda$ with $0<\Lambda<1$. The offset is larger when
$|r'(p)|$ or $h$ is larger.

When the behavioral channel dominates and pass-through is positive, the
ex-post term amplifies the rectangle. Then $r'(p)>0$ and $\rho_c>0$. The list
price rises and the return rate rises with it, so $r'(p)(p+h)\rho_c$ is
positive, $\Lambda>1$, and $-Q\,r'(p)(p+h)\rho_c$ is a further loss. The added
loss is larger when $r'(p)$ or $h$ is larger.

When pass-through is negative, the ex-post term reverses the rectangle and
joint surplus rises. Result~\ref{res:negative-pt} requires $\mu_p^0<0$ and
therefore $r'(p)>0$. The list price falls and the return rate falls with it,
so $-Q\,r'(p)(p+h)\rho_c$ is again a gain. Because $\Lambda<0$, the gain is
larger than the rectangle $Q$, and joint surplus rises by $Q|\Lambda|$. The
rise is larger when $r'(p)(p+h)|\rho_c|$ is larger.

The no-return formula keeps the rectangle and omits the ex-post term, so its
entire error is that omission. For a production-cost increase it reports a
loss of $Q$ against the true change $-Q\Lambda$, and the three regimes above
translate directly into the direction of the error.
\begin{result}[No-return joint-surplus bias]
\label{res:welfare-bias}
Consider a unit production-cost increase. Relative to the returns-adjusted
change $dW/dc=-Q\Lambda$, the ex-ante formula $dW/dc=-Q$
\begin{enumerate}
\item[(i)] overestimates the joint-surplus loss if and only if $r'(p)<0$,
in which case $0<\Lambda<1$;
\item[(ii)] underestimates the joint-surplus loss if and only if
$r'(p)>0$ and $\rho_c>0$, in which case $\Lambda>1$;
\item[(iii)] overestimates the joint-surplus loss with the wrong sign if
and only if $r'(p)>0$ and $\rho_c<0$. It reports a loss of $Q$ when joint
surplus rises by $Q|\Lambda|$.
\end{enumerate}
For a handling-cost shock the same cuts compare $-Qr\Lambda$ with $-Qr$. For
the tax they compare $-Q\theta\Lambda$ with $-Q\theta$.
\end{result}
\begin{proof}
The three cases above give the direct statements. For the converses, suppose
$0<\Lambda<1$. Then $\rho_c>0$ and $r'(p)\rho_c<0$, so $r'(p)<0$. This is
(i). Suppose $\Lambda>1$. Then $r'(p)\rho_c>0$, and $\Lambda>0$ forces
$\rho_c>0$, so $r'(p)>0$. This is (ii). Suppose $\Lambda<0$. Then
$\rho_c<0$ and therefore $r'(p)>0$. This is (iii). The tax multiplies the
true change and the benchmark by $\theta$. This factor is positive because
$\theta=p[1-(1-\beta)r]\geq p(1-r)$ and $1-r>0$. The handling-cost comparison
is unchanged when $r>0$.
\end{proof}

For the tax, adding platform revenue cancels the ex-ante rectangle and leaves
the ex-post term as the social effect. The platform receives $\tau p$ on a
kept sale and $\beta\tau p$ on a return, so revenue is $G=\tau\theta Q$.
Social surplus is $V\equiv W+G$. At a zero tax, marginal revenue equals the
rectangle $\theta Q$. Adding it to $dW/d\tau=-Q\theta\Lambda$ gives
\begin{equation}
  \frac{dV}{d\tau}
  =
  -Q\theta\Lambda+\theta Q
  =
  -Q\theta\,r'(p)(p+h)\rho_c.
  \label{eq:dV}
\end{equation}
The surviving term is $\theta$ times the ex-post term. Without returns,
$r'(p)=0$ and $\theta=p$, so an infinitesimal tax only transfers $pQ$ to the
platform and social surplus does not change. With returns, society gains when
the tax lowers the return rate and loses when the tax raises it. The gain
occurs in the offsetting and reversal cases, when selection dominates or
pass-through is negative. The loss occurs in the amplification case, when the
behavioral channel dominates and pass-through is positive. At a zero tax,
$\beta$ does not enter $\rho_c$, because the retained share multiplies $\tau$
in the effective margin. A larger $\beta$ raises $\theta$ and scales the
social effect. The sign does not change.
```

## After prose approval

- Apply the rewrite to `draft/welfare_foundation/welfare_with_returns_no_buyer_tax.tex` (requires leaving plan mode).
- Recompile `welfare_with_returns_no_buyer_tax.pdf` from `draft/welfare_foundation/` with one `pdflatex -interaction=nonstopmode` pass, run separately.
