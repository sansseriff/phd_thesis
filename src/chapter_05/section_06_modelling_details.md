## Phase basis readout

This section uses numbers in kets to signify time delays, such that the notation from the main text transforms as $|e\rangle, |l\rangle \longrightarrow |0\rangle, |1\rangle$. Following the creation of the bell pair $\frac{1}{\sqrt{2}}(|00\rangle + e^{i \phi}|11\rangle)$ with the source interferometer, the readout interferometers at Alice and Bob transform each member of the entangled pair according to the operation [@Marcikic2002]:

$$|k\rangle \rightarrow \frac{1}{2}\left(|k\rangle_{(A/B)+}+e^{i \phi_{s / i} \mid}|k+1\rangle_{(A/B)+}+i|k\rangle_{(A/B)-}-i e^{i \phi_{s / i}}|k+1\rangle_{(A/B)-}\right)$$
Where $(A/B)+$ and $(A/B)-$ denote the output ports of Alice ($A$) or Bob's ($B$) interferometer. The full state is a 28-term expression made of four so-called 'branches' indexed by the four combinations of interferometer output ports: $A+ B+, A+ B- A- B+$ and $A- B-$. Each branch has a term in the following form, with amplitude dependent on the phase relationship between the interferometers:

$$p\left(e^{i \phi}+qe^{i\left(\phi_s+\phi_i\right)}\right)|2\rangle_{Au}|2\rangle_{Bv} $$

Where $p, q, u, v \in \{\{+1,+1, +, +\}, \{i,-1, +, -\}, \{i,-1, -, +\}, \{-1,+1, -, -\}\}$ for the four terms. These terms define the probability amplitude of the quantum state in the so-called phase basis. The modulous squared of these terms gives the phase-dependent probability of coincidences across the center time bins, as measured at interferometer outputs of Alice and Bob. 

All the phase terms can be grouped into one variable $\theta = \phi_s + \phi_i - \phi$, and the four $|2\rangle|2\rangle$ terms can be re-expressed in terms of the the cosine function [@Marcikic2002; @Kim2022]:
$$
\begin{align}
P_{A+ B+} &= |\langle 2|2\rangle|^2_{A+ B+} = 2(1 + v \cos(\theta))  \label{cosines}\\
P_{A+ B-} &= |\langle 2|2\rangle|^2_{A+ B-} = 2(1 - v \cos(\theta)) \notag \\
P_{A- B+} &= |\langle 2|2\rangle|^2_{A- B+} = 2(1 - v \cos(\theta)) \notag \\
P_{A- B-} &= |\langle 2|2\rangle|^2_{A- B-} = 2(1 + v \cos(\theta)) \notag \\ \notag
\end{align}
$$

where $v$ was added to denote the visibility of the phase basis. Scanning the phase of the system and measuring coincidence rate across the center bins produces sinusoidal fringes as shown in @fig:fringes. 


## Coincidence Rate & Interferometer Output Ports 

As each readout interferometer has two output ports, the full output state observed at Alice and Bob cannot be fully measured with two SNSPDs. We label the output ports of Alice (A) and Bob's (B) interferometers with plus ($+$) and minus ($-$). The plus ports are used for most measurements. By measuring the relative loss between the plus and minus ports, all singles rates $S_i$ and coincidence rates $C_{ij}, i,j \in \{A+, A-, B+, B-\}$ across different detectors can be estimated. 

$R_A$ is the ratio of transmissions $t_{A-}$ over $t_{A+}$, where $t_{A-}$ is the transmission through the input to output $A-$ and $t_{A+}$ is the transmission through the input to output $A-$. $R_B$ is defined analogously. We measure values for $R_A$ and $R_B$ by sending a pulsed laser into the input and measuring the ratio of power transmitted across the output ports:

$$R_A = 0.99 \pm 0.03, ~~~~~~ R_B = 1.04 \pm 0.03$$

<!-- \begin{figure}[H]
    \centering
    \includegraphics[width=0.5\linewidth]{Interferometer_Output_Schematic_R_Eq.pdf}
    % \caption{}
    % \label{fig:branches}
\end{figure} -->

![**Wavefunction branches** Different pairings of interferometer output ports collect different wavefunction branches](./figs/branches_light.svg){#fig:branches short-caption='Wavefunction branches' width=70% path="chapter_05"}

The coincidence rates for all wavefunction branches are the same if $\theta$ in \ref{cosines} is set to zero. With this phase state rate $C_{A+ B+, \theta=0}$ measured directly (labeled B in \ref{fig:fringes}), it's straightforward to estimate the full wavefunction coincidence rate across all interferometer outputs. As shown in table @table:rates, the rate is $C_{A+ B+}(1 + R_A + R_B + R_AR_B)$. This estimate is used to express a full coincidence rate for figures 3 and 4 in the main text. 

```{=latex}
\being{table}
\definecolor{color1}{HTML}{38A5BA}
\definecolor{color2}{HTML}{6275CE}
\definecolor{color3}{HTML}{D088BF}
\definecolor{color4}{HTML}{F4A596}
\begin{tabular}{ |p{2.5cm}||p{1.3cm}|p{2.9cm}|p{2.9cm}|p{3.4cm}|  }
\hline
\multicolumn{5}{|c|}{Predicted Singles and Coincidence Rates for Full Wavefunction} \\
\hline
rate metrics     &  Branch 1 & Branch 2 & Branch 3 & Branch 4 \label{table:rates}\\
\hline
singles rate 1  & $S_{A+}$ &$S_{A-}=R_A S_{A+}$    &$S_{A+}$               &$S_{A-}=R_A S_{A+}$        \\
singles rate 2  & $S_{B+}$ &$S_{B+}$               &$S_{B-} = R_B S_{B+}$  &$S_{B-} = R_B S_{B+}$      \\
coincidence rate&\textcolor{color1}{$C_{A+B+}$}&\textcolor{color3}{$C_{A-B+}=R_A C_{A+B+}$}&\textcolor{color2}{$C_{A+B-}=R_B C_{A+B+}$}&\textcolor{color4}{$C_{A-B-}=R_B R_A C_{A+B+}$}\\
\hline
\end{tabular}
\caption[{Rates for wavefunction branches}]{Singles and coincidence rates for wavefunction branches. The $A+, B+$ branch was measured, and the rates of other branches are predicted using relative transmission factors $R_A, R_B$}
\label{table:branches}
\end{table}
```
```{=html}
$$
\definecolor{color1}{RGB}{56, 165, 186}
\definecolor{color2}{RGB}{98, 117, 206}
\definecolor{color3}{RGB}{208, 136, 191}
\definecolor{color4}{RGB}{244, 165, 150}
$$
<div style="text-align: center;">
<a name='table:branches'></a>
<span style="font-size: 17px;">Predicted Singles and Coincidence Rates for Full Wavefunction</span>
</div>
<table style="margin: 0" markdown>
| rate metrics | Branch 1 | Branch 2 | Branch 3 | Branch 4 |
| --- | --- | --- | --- | --- |
| singles rate 1 | $\small{S_{A+}}$ | $\small{S_{A-}=R_A S_{A+}}$ | $\small{S_{A+}}$ | $\small{S_{A-}=R_A S_{A+}}$ |
| singles rate 2 | $\small{S_{B+}}$ | $\small{S_{B+}}$ | $\small{S_{B-} = R_B S_{B+}}$ | $\small{S_{B-} = R_B S_{B+}}$ |
| coincidence rate | ${\color{color1}\small{C_{A+B+}}}$ | ${\color{color3}\small{C_{A-B+}=R_A C_{A+B+}}}$ | ${\color{color2}\small{C_{A+B-}=R_B C_{A+B+}}}$ | ${\color{color4}\small{C_{A-B-}=R_B R_A C_{A+B+}}}$ |
<figcaption markdown>**Rates for wavefunction branches** Singles and coincidence rates for wavefunction branches. The $A+, B+$ branch was measured, and the rates of other branches are predicted using relative transmission factors $R_A, R_B$ </figcaption>
</table>
```

For main-text figure 2 in particular, coincidences were measured with the center bin rate tuned to a minimum $\theta=-\frac{\pi}{2}$ (grey solid line in main-text figure 2c). The rate therefore captures the contribution from the 6 phase-independent terms for the $A\!\!+\!\!B\!+\!$ wavefunction branch. This can be extrapolated to the $\theta=0$ state by multiplying by $\frac{4}{3}$. For the rate displayed to be consistent with the measures of coupling efficiency $\eta$ (and so the interferometers aren't thought of as a source of $\sim$50\% loss), this rate is multiplied again by $(1 + R_AR_B)$ to represent two wavefunction branches. This results in a total scaling of: 

$$C_{fig. 2} = \frac{4}{3}(1 + R_AR_B)C_{measured}$$