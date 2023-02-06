## PNR Characterization

**Todo:**
    - [ ] This is where I'll show the first scans of the rising edge of the NbN nanowire pulse
    - [ ] Convey how triggering at any level results in weird multi-modal histograms because of the PNR effect
    - [ ] State that initially the idea was to fully characterize the PNR component, as in identify each pulse as $|1\rangle$, $|2\rangle$, $|3\rangle$ or so on. Then, apply a fixed correction value to the arrival time the cancel out the effect
    - [ ] That approach didn't work out because in the 3 photons per pulse range, the true photon number gets harder to identify. It's not clear if a pulse is a $|3\rangle$ or a $|4\rangle$, and the arrival time of the optical pulse is correspondingly uncertain. 

Just testing out some math features here...

$$
\begin{align}
    \langle \psi | \Pi_{\text {binary}} | \psi \rangle &= (1- \gamma^2) \sum_{\tilde{n}=0}^{\infty} \langle \tilde{n}_s \tilde{n}_i | \gamma^{\tilde{n}} \sum_{n=0}^{\infty}[1 - (1-\eta)^{n}] \gamma^n | n_s n_i \rangle
    \\
    \langle \psi | \Pi_{\text {binary}} | \psi \rangle &= p_{binary}(\gamma, \eta) =  \boxed{(1-\gamma^2) \sum_{n_s=0}^{\infty} \gamma^{2n_s} [1 - (1 - \eta)^{n_s}]}
\end{align}
$$

For $\gamma << 1$, $p \sim (1 - \gamma^2)[\cancel{\gamma^0[1 - (1 - \eta)^0]} + \gamma^{2}\eta ] \sim (1 - \gamma^2)\gamma^{2}\eta$\\
\\
To lowest order in $\gamma$, $p \sim \gamma^{2}\eta$. The single photon fock state dominates for $\gamma << 1$. 