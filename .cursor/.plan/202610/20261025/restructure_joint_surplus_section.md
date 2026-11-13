# Restructure "First-order effect on joint surplus and ex-ante ex-post decomposition"

Date: 2026-10-25.

File: `draft/welfare_foundation/welfare_with_returns_no_buyer_tax.tex`, subsection at lines 460–615.

## Section's question (framing)

Is a small shock ($c$, $h$, or $\tau$) socially costly, and does the first-order effect come from the purchase margin (ex-ante) or the keep-or-return margin (ex-post)?

## Key points and intuition, in the order they should appear

1. **Raw first-order effect.** $dW/dc$ is the sum of the consumer and producer rows of Table `tab:incidence_components`: $-Q(1-r)\rho_c + Q(\mu_p^0\rho_c-1)$ (display `eq:dW-c-raw`). No $\Lambda$ yet.
2. **Cancellation, then define $\Lambda$.** Substitute $\mu_p^0 = 1-r-(p+h)r'$; the kept-unit pieces $(1-r)\rho_c$ cancel; what remains is $dW/dc=-Q\Lambda$ with $\Lambda\equiv 1+r'(p+h)\rho_c$ (display `eq:Lambda`). Only now interpret the pieces:
   - The $1$ is the direct resource drain on the $Q$ units that continue to sell (the rectangle; price-mediated CS/PS changes are transfers and cancel). **Corrects the current gloss "loss from units that are no longer sold," which is wrong** — lost units are second-order by the envelope theorem.
   - The $r'(p+h)\rho_c$ term is the keep-or-return switch: the price moves the return rate by $r'\rho_c$, and each switched unit costs $p+h$ because the buyer at the keep margin is indifferent and the seller loses the price $p$ and pays $h$. It is zero without returns, so it is what the classical formula misses (one sentence, hinge to the decomposition).
3. **Scaling.** Both table rows for $h$ and $\tau$ are the production-cost rows times $r$ and $\theta$, so $dW/dh=-Qr\Lambda$ and $dW/d\tau=-Q\theta\Lambda$ (display `eq:dW-shocks`).
4. **Ex-ante vs ex-post.** Freeze the return rate: only the rectangle survives ($-Q$, $-Qr$, $-Q\theta$), the ex-ante term on the purchase margin. The gap between $-Q\Lambda$ and the rectangle is the ex-post return-rate term. State Result `res:EA-EP` (three-line display); say the labels once, in the lead-in, not again after the display.
5. **Regimes and sign link.** Define offset ($0<\Lambda<1$), amplification ($\Lambda>1$), reversal ($\Lambda<0$). Since CS and PS move together (Result `res:incidence-ratio`) and both fall iff $\rho_c>0$, $\Lambda$ has the sign of $\rho_c$.
6. **Three parallel case paragraphs**, each with the same skeleton: sign conditions on $r'$ and $\rho_c$ → price direction → return-rate direction → sign of the ex-post term → implication for $\Lambda$ and $W$ → magnitude comparative static.
   - Selection dominates ($r'<0$): offset. $\mu_p^0>0$, so $\rho_c>0$ (**fix**: replace "strictly increasing marginal cost gives $\rho_c>0$"). Price rises, screens out frequent returners, ex-post term is a gain that cuts the loss to $Q\Lambda$. Delete the duplicate ending "Both surpluses still fall..." (topic sentence already says it cannot reverse); end with the magnitude clause to match the other two paragraphs.
   - Behavioral dominates and $\rho_c>0$: amplification. Keep as is.
   - Negative pass-through ($\rho_c<0$): reversal. Keep as is.
7. **No-return bias.** Compress the current prose (lines 559–567) to a two-sentence hinge: the no-return formula keeps the rectangle and omits the ex-post term, so its entire error is that omission, and the three regimes map to overestimate / underestimate / wrong sign. The Result `res:welfare-bias` then states the cases formally (delete the prose re-listing, which repeats the Result). Proof unchanged.
8. **Social surplus with platform revenue.** $G=\tau\theta Q$, $V=W+G$; at a zero tax the marginal revenue $\theta Q$ cancels the ex-ante rectangle, leaving $dV/d\tau=-Q\theta\,r'(p+h)\rho_c$ (display `eq:dV`). Without returns this is zero (pure transfer). Society gains exactly in the offset and reversal cases (tax lowers the return rate) and loses in the amplification case — make this parallel with point 6 explicit in one clause. $\beta$ scales $\theta$ and never changes the sign; keep at the end.

## Math checks (all verified)

- Cancellation $-Q(1-r)\rho_c+Q(\mu_p^0\rho_c-1)=-Q\Lambda$: correct.
- $\mathrm{sign}(\Lambda)=\mathrm{sign}(\rho_c)$ via `res:incidence-ratio`: correct.
- $dG/d\tau|_{\tau=0}=\theta Q$ and $dV/d\tau=-Q\theta r'(p+h)\rho_c$: correct; $\theta>0$ argument in the proof: correct.

## Delete list (no added value)

- Advance statement of $-Q\Lambda$ and the gloss "adjusts quantity sold for the return rate's response to price" (lines 464–466) — reordered per point 2.
- "The one in $\Lambda$ is the loss from units that are no longer sold" — incorrect gloss, replaced.
- Duplicate closer in the offset paragraph (lines 544–545).
- Prose re-listing of the three bias cases (lines 561–566) — repeats Result `res:welfare-bias`.
- One of the two "first term is the ex-ante rectangle" labelings (lead-in vs. after the display).

## Paragraph map after revision (10 paragraphs, same components)

1. Topic: joint surplus changes by the sum of its two pieces → `eq:dW-c-raw`.
2. Topic: kept-unit pieces cancel → `eq:Lambda` + $\Lambda$ pieces + no-return hinge sentence.
3. Topic: $h$ and $\tau$ are scalings → `eq:dW-shocks`.
4. Topic: freezing $r$ separates ex-ante rectangle from ex-post term → Result `res:EA-EP`.
5. Topic: three regimes and the sign of $\Lambda$.
6–8. Offset / amplification / reversal (parallel skeleton).
9. Hinge into Result `res:welfare-bias` + proof.
10. Platform revenue → `eq:dV`, gain/loss parallel, role of $\beta$.

## After approval

- Apply the edits in `draft/welfare_foundation/welfare_with_returns_no_buyer_tax.tex`, then recompile `welfare_with_returns_no_buyer_tax.pdf` (one `pdflatex` pass, run separately, from `draft/welfare_foundation/`) per the workspace LaTeX rule.
