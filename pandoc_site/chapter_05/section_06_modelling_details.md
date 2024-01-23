<!-- 

<span class="html">Table [1](#table:maximum_rates)</span><span class="latex"> table \ref{table:maximum_rates}</span>

 -->

<style>
mjx-container {
    overflow-y: hidden !important;
    /* overflow-x: hidden !important; */
    font-size: 105% !important;
}
</style>

## Phase basis readout

This section uses numbers in kets to signify time delays, such that the notation from the main text transforms as $|e\rangle, |l\rangle \longrightarrow |0\rangle, |1\rangle$. Following the creation of the bell pair $\frac{1}{\sqrt{2}}(|00\rangle + e^{i \phi}|11\rangle)$ with the source interferometer, the readout interferometers at Alice and Bob transform each member of the entangled pair according to the operation [@Marcikic2002]:

$$|k\rangle \rightarrow \frac{1}{2}\left(|k\rangle_{(A/B)+}+e^{i \phi_{s / i} \mid}|k+1\rangle_{(A/B)+}+i|k\rangle_{(A/B)-}-i e^{i \phi_{s / i}}|k+1\rangle_{(A/B)-}\right)$$

where $(A/B)+$ and $(A/B)-$ denote the output ports of Alice ($A$) or Bob’s ($B$) interferometer. The full state is a 28-term expression made of four so-called ‘branches’ indexed by the four combinations of interferometer output ports: $A+ B+, A+ B- A- B+$ and $A- B-$. Each branch has a term in the following form, with amplitude dependent on the phase relationship between the interferometers:

$$p\left(e^{i \phi}+qe^{i\left(\phi_s+\phi_i\right)}\right)|2\rangle_{Au}|2\rangle_{Bv} $$

where $p, q, u, v \in \{\{+1,+1, +, +\}, \{i,-1, +, -\}, \{i,-1, -, +\}, \{-1,+1, -, -\}\}$ for the four terms. These terms define the probability amplitude of the quantum state in the so-called phase basis. The modulous squared of these terms gives the phase-dependent probability of coincidences across the center time bins, as measured at interferometer outputs of Alice and Bob.

All the phase terms can be grouped into one variable $\theta = \phi_s + \phi_i - \phi$, and the four $|2\rangle|2\rangle$ terms can be re-expressed in terms of the the cosine function [@Marcikic2002; @Kim2022]:

<a name='eq:cosines'></a>

$$ 
\begin{align}
P_{A+ B+} &= |\langle 2|2\rangle|^2_{A+ B+} = 2(1 + v \cos(\theta)) \label{eq:cosines}\\
P_{A+ B-} &= |\langle 2|2\rangle|^2_{A+ B-} = 2(1 - v \cos(\theta)) \notag \\
P_{A- B+} &= |\langle 2|2\rangle|^2_{A- B+} = 2(1 - v \cos(\theta)) \notag \\
P_{A- B-} &= |\langle 2|2\rangle|^2_{A- B-} = 2(1 + v \cos(\theta)) \notag \\ \notag
\end{align}
\tag{1}$$

where $v$ was added to denote the visibility of the phase basis. Scanning the phase of the system and measuring coincidence rate across the center bins produces sinusoidal fringes as shown in Fig. [5](#fig:fringes).

## Coincidence rate & interferometer output ports

As each readout interferometer has two output ports, the full output state observed at Alice and Bob cannot be fully measured with two SNSPDs. We label the output ports of Alice (A) and Bob’s (B) interferometers with plus ($+$) and minus ($-$). The plus ports are used for most measurements. By measuring the relative loss between the plus and minus ports, all singles rates $S_i$ and coincidence rates $C_{ij}, i,j \in \{A+, A-, B+, B-\}$ across different detectors can be estimated.

$R_A$ is the ratio of transmissions $t_{A-}$ over $t_{A+}$, where $t_{A-}$ is the transmission through the input to output $A-$ and $t_{A+}$ is the transmission through the input to output $A-$. $R_B$ is defined analogously. We measure values for $R_A$ and $R_B$ by sending a pulsed laser into the input and measuring the ratio of power transmitted across the output ports:

$$R_A = 0.99 \pm 0.03, ~~~~~~ R_B = 1.04 \pm 0.03.$$

<!-- \begin{figure}[H]
    \centering
    \includegraphics[width=0.5\linewidth]{Interferometer_Output_Schematic_R_Eq.pdf}
    % \caption{}
    % \label{fig:branches}
\end{figure} -->

<figure markdown> 
    <a name='fig:branches'></a> 
    <img alt="fig:branches" style="width: 70%; margin: auto;" src="../figs/branches_light.svg#only-light" >
    <img alt="fig:branches" style="width: 70%; margin: auto;" src="../figs/branches_dark.svg#only-dark" > 
    <figcaption markdown> Figure 1: **Wavefunction branches** Different pairings of interferometer output ports collect different wavefunction branches.</figcaption>
    </figure>

The coincidence rates for all wavefunction branches are the same if $\theta$ in Eq. [1](#eq:cosines) is set to zero. With this phase state rate $C_{A+ B+, \theta=0}$ measured directly (labeled B in Fig. [5](#fig:fringes)), it’s straightforward to estimate the full wavefunction coincidence rate across all interferometer outputs. As shown in table [1](#table:branches), the rate is $C_{A+ B+}(1 + R_A + R_B + R_AR_B)$. This estimate is used to express a full coincidence rate for Figures [system:2](./section_04_system_results.md/#fig:shg_scan) and [system:3](./section_04_system_results.md/#fig:channel_data).

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

For Figure [system:1](./section_04_system_results.md#fig:figure_2nd_1) in particular, coincidences were measured with the center bin rate tuned to a minimum $\theta=-\frac{\pi}{2}$ (grey solid line in main-text Fig. [system:1](./section_04_system_results.md#fig:figure_2nd_1)c). The rate therefore captures the contribution from the 6 phase-independent terms for the $A\!\!+\!\!B\!+\!$ wavefunction branch. This can be extrapolated to the $\theta=0$ state by multiplying by $\frac{4}{3}$. For the rate displayed to be consistent with the measures of coupling efficiency $\eta$ (and so the interferometers aren’t thought of as a source of $\sim$ 50% loss), this rate is multiplied again by $(1 + R_AR_B)$ to represent two wavefunction branches. This results in a total scaling of:

$$C_{fig. 2} = \frac{4}{3}(1 + R_AR_B)C_{measured}$$

## Joint spectral intensity analysis

This entanglement source is potentially useful for future quantum communication systems that make use of two-photon interference, such as teleportation or entanglement swapping. These require the generation of highly pure and indistinguishable photons. The type-0 SPDC crystal used in this source shows strong spectral correlations that make it inappropriate for two-photon interference demonstrations by itself. However, with the application of the DWDM filtering, we create a series of spectral channel pairings that are potentially good individual sources of fairly pure single mode photons. To investigate this, we model the joint spectral intensity function (JSI) produced by the SPDC and fit it to data. Then we and apply a Schmidt decomposition to the spectral modes produced when pairs of DWDM filter channels are applied to the modeled JSI. We derive an inverse Shmidt number which is equal to single photon purity $P$ as well as visibility $V$ of Hong-Ou-Mandel (HOM) interference. An inverse Schmidt number approaching 1 indicates that the source is effective for two-photon interference measurements like HOM and Bell State measurements.

### JSI modelling

We follow an analysis for co-linear quasi-phase matching inside a waveguide packaged SPDC crystal [@Davis2022; @ZielnickiKwiat2018SPDCmodel]. The joint spectral intensity $|f(\omega_s, \omega_i)|^2$ is modelled as a product of phase matching and pump envelope intensities \|$\psi_{\mathrm{ph}}\left(\omega_s, \omega_i\right)|^2$ and $|\psi_p\left(\omega_s, \omega_i\right)|^2$, where $\omega_s$ and $\omega_i$ are the frequencies of the signal and idler models respectively. The phase matching envelope intensity takes the form:

$$
\left|\psi_{\mathrm{ph}}\left(\omega_s, \omega_i\right)\right|^2=\operatorname{sinc}^2\left(\frac{\Delta k L}{2}\right),\;\;\;\;\;\; \Delta k=2 \pi\left(\frac{n\left(\lambda_p\right)}{\lambda_p}-\frac{n\left(\lambda_s\right)}{\lambda_s}-\frac{n\left(\lambda_i\right)}{\lambda_i}-\Gamma\right)
$$

where $L$ is the length of the crystal, $\Delta K$ is a wave-vector mismatch term, and $n_{p(s)(i)}$ is the refractive index of the crystal at the wavelengths of pump $\lambda_p$, signal $\lambda_s$ and idler $\lambda_i$. $\Gamma = 1/\Lambda$ where $\Lambda$ is the polling period of the crystal. The refractive indices $n(\{\lambda_p, \lambda_s, \lambda_i\})$ are computed from an MgO-doped PPLN Sellmeier equation [@Gayer2008]. In the expression for $\Delta K$, $\lambda_p$ is the function of $\lambda_s$ and $\lambda_i$ that imposes energy conservation: $1/\lambda_p = 1/\lambda_s + 1/\lambda_i$.

The pump envelope intensity is modeled as

$$|\psi_p\left(\omega_s, \omega_i\right)|^2=\exp \left(-\frac{\left(\omega_p-\omega_s-\omega_i\right)^2}{\sigma_p^2}\right)$$

where $\omega_p$ and $\sigma_p$ are the center frequency and bandwidth of the pump signal out of the EDFA/SHG module. Unlike $\lambda_p$ in the phase matching expression above, $\omega_p$ and $\sigma_p$ are fixed to known values or chosen as floating fitting parameters.

### JSI fitting

The JSI model is fitted to the the 8x8 DWDM data from Fig.&#160;2a in the main text. The transmission spectrum of one DWDM channel was measured and used to estimate the transmission properties for all pairs of 8 channels. For each measurement of coincidence rate from Fig.&#160;2a we define an integration over the joint spectral intensity and the corresponding filter passbands:

<a name='eq:c_uv'></a>

$$
\begin{align}
    C_{u,v} = \int_{s}\int_{i}T_u(\lambda_s)T_v(\lambda_i)|f(\omega_s, \omega_i)|^2 d\lambda_s d\lambda_i \label{eq:c_uv}
\end{align}
\tag{2}$$

where $T_{u(v)}$ is the transmission spectrum for filter with ITU channel $u (v)$, and the integrations are over the signal and idler wavelengths. Efficiency parameters $\eta_i$ scale the DWDM filter spectrums, and are used to model all loss between pair generation in the SPDC crystal and detection in the SNSPDs. To fit the $\eta_i$ values, the singles rates from Fig.&#160;2a were also included, and fitted to single-filter integrations:

$$S_{u} = \int_{s}\int_{i}T_{u}(\lambda_a)|f(\omega_s, \omega_i)|^2 d\lambda_s d\lambda_i$$

Where $a \in \{i, s\}$. Parameters of model for $|f(\omega_s, \omega_i)|^2$ were optimized to minimize the error between estimates $C_{u,v}$ and $S_u$ and the measured coincidence and singles rates. The following parameters were either set explicitly based on measurements and known constants (black), or optimized in the fitting process (blue):

<figure markdown> 
    <a name='fig:parameters'></a> 
    <img alt="fig:parameters" style="width: 100%; margin: auto;" src="../figs/fitting_parameters_light.svg#only-light" >
    <img alt="fig:parameters" style="width: 100%; margin: auto;" src="../figs/fitting_parameters_dark.svg#only-dark" > 
    <figcaption markdown> Figure 2: **JSI fitting parameters** Pump laser $\lambda$ and $sigma$ were found by measuring the output of the SHG module with a spectrum analyzer.</figcaption>
    </figure>

Varying MgO doping percentage and varying crystal temperature affect the Sellmeier equations in similar ways [@Gayer2008; @Jundt1997]. Therefore, crystal temperature $T$ was used as a fitting parameter, to stand in the unknown MgO doping percentage. The true crystal temperature during all measurements was $50.0^{\circ}~\mathrm{C}$, which was optimized to maximize coincidence rates.

<!-- %  The waveguide/crystal used was 10 mm long, but we allow the effective length $L_g$ to converge to a shorter value. This is because we expect non-negligible group velocity mismatch $GVM = 1/n(\omega_p) - 1/n(\omega_{s(i)})$ that with the short (2 ps) pump pulse results in a shorter effective interaction length $L_g$ [@SchoberThesis2005]. We therefore accept some temporal broadening of the down-converted pulses in exchange for the higher conversion efficiency of a 10 mm crystal -->

<figure markdown> 
    <a name='fig:jsi_sim'></a> 
    <img alt="fig:jsi_sim" style="width: 100%; margin: auto;" src="../figs/JSI_sim_results_light.svg#only-light" >
    <img alt="fig:jsi_sim" style="width: 100%; margin: auto;" src="../figs/JSI_sim_results_dark.svg#only-dark" > 
    <figcaption markdown> Figure 3: **JSI simulation results** a) & b) For type-0 SPDC, the relationship between refractive indices of pump and down-converted wavelengths produces an intensity profile roughly parallel with the pump envelope. This is responsible for the broad output spectrum of these crystals. c) the coincidence rates in Kcounts/s that are fit to filter-defined integrations of the JSI. d) Joint spectral distributions of coincidences expected from the filter pairings that correspond to the main diagonal. Here the joint spectrums of 8 DWDM channels pairs are shown summed together, where each component of the sum is an expression like the integrand of $C_{u,v}$ above.</figcaption>
    </figure>

An ideal photon pair source for scalable optical quantum information processing would not exhibit joint spectral correlations between the signal and idler photons. The Schmidt decomposition, which is equivalent to the singular value decomposition in our computational model, can be used to quantify these correlations [@ZielnickiKwiat2018SPDCmodel]. We apply the Schmidt decomposition to the filtered JSIs for filter pairings along the main diagonal in Fig.&#160;2a in the main text, and derive the inverse Schmidt number for these modes

$$1/K = \sum_i \lambda_i^2$$

where $\lambda_i$ are the Schmidt coefficients [@ZielnickiKwiat2018SPDCmodel]. The inverse Schmidt numbers for all 8 channel pairs are similar, and are not expected for vary due to any phenomena beyond inaccuracies of the model. Therefore, we quote single values for $1/K$ in the main text.

## Consequences of narroband filtering

### Calculation of mean photon number per pulse μ

<figure markdown> 
    <a name='fig:narroband'></a> 
    <img alt="fig:narroband" style="width: 100%; margin: auto;" src="../figs/filter_considerations_light.svg#only-light" >
    <img alt="fig:narroband" style="width: 100%; margin: auto;" src="../figs/filter_considerations_dark.svg#only-dark" > 
    <figcaption markdown> Figure 4: **JSI filtering considerations** a) Two filters with bandwidth approximately 0.04 nm are applied to the JSI model. True coincidences are expected only from the region inside the small red square. b) The shape of the JSI with one 100 GHz DWDM filter applied c) the JSI a 100 GHz DWDM filter applied on both signal and idler arms.</figcaption>
    </figure>

It is common in the literature to calculate signal and idler arm efficiencies with equations of the form:

<a name='eq:regular_eff'></a>

$$
\begin{align}
\eta_{s(i)}=\frac{C_{s i}}{S_{i(s)}} \label{eq:regular_eff}
\end{align}
\tag{3}$$

Where $\eta_{s(i)}$ is coupling efficiency of the signal (idler) arm, $C_{s i}$ is the coincidence rate, and $S_{i(s)}$ is the singles rate on the idler (signal) arm. $\mu$, the mean pair rate per period or cycle, may also be defined in terms of the repetition rate $R$ as $R \mu \eta_{s(i)}=S_{s(i)}$. With these, one can define $\mu$ in terms of coincidence rate $C_{s i}$ and singles rates $S_s$ and $S_i$:

<a name='eq:colorless'></a>

$$
\begin{align}
    \mu=\frac{S_s S_i}{C_{s i} R} \label{eq:colorless}
\end{align}
\tag{4}$$

However, this definition breaks down in the limit of narroband filtering, or when the losses on the signal and ider arm cannot be thought of as ‘colorless’. Consider the situation of two very-narroband filters, as illustrated in figure Fig. [4](#fig:narroband) a. This situation can be simulated using the JSI model. We set signal and idler filter bandwidth to 5% of the 100 GHz DWDM bandwidths. Pump power is scaled by 200x. Transmission of the filters at their maximum is set to 100%. This results in $S_s = 58.0~\mathrm{MHz}$, $S_i = 57.6~\mathrm{MHz}$, and $C_{s i} = 567~\mathrm{KHz}$. With these values, Eq. [4](#eq:colorless) suggests a $\mu$ value of 1.47. This is misleading because it’s unreasonable to expect the red outlined region at the intersection of the filters in Fig. [4](#fig:narroband) a –which is responsible for all true detections of entangled pairs– to be the source of more than one entangled pair per pulse. Rather, the high singles rates $S_s$ and $S_i$ are having an adverse effect on the $\mu$ calculation. Most of the singles detections are from mutually incompatible spectral modes – the 4 regions that form a cross shape above, below, and to the sides of the red outlined square.

We propose a definition of $\mu$ similar to the form of Eq. [2](#eq:c_uv):

<a name='eq:newmu'></a>

$$
\begin{align}
    \mu_{u,v} = \frac{1}{R}\int_{s}\int_{i}W_u(\lambda_s)W_v(\lambda_i)|f(\omega_s, \omega_i)|^2 d\lambda_s d\lambda_i \label{eq:newmu}
\end{align}
\tag{5}$$

where $W_u$ and $W_v$ have the spectrums of filters $T_u$ and $T_v$ but maximum transmissions of 100%. This is an integration of $|f(\omega_s, \omega_i)|^2$ over the bipartite spectral region where filter transmission is non-negligible. As the JSI model is defined, $|f(\omega_s, \omega_i)|^2$ has units of entangled pairs per $\mathrm{nm}^2$.

Going forward, we use the Eq. [5](#eq:newmu) definition of $\mu$ in the main text, and do a separate analysis of the effect of the mutually incompatible spectral modes when necessary. Note that in the main text, Alice receives idler photons and Bob receives signal photons, so variables transform as $C_{is} \rightarrow C_{AB}$, $S_{i} \rightarrow S_{A}$, and $S_{s} \rightarrow S_{B}$

### Estimating μ from coincidence and singles rates

As Eq. [4](#eq:colorless) is problematic for the narroband filtering regime, a conversion is needed that maps this type of expression to the more implicitly defined Eq. [5](#eq:newmu). Luckily, the influence of narroband filtering as a sort of pseudo-loss can be rolled into a new geometric factor $\delta$. This is the ratio of the JSI captured by two narroband spectral filters $W_u(\lambda_s)*W_v(\lambda_i)$ to that captured by one $W_v(\lambda_i)$, as illustrated in Fig. [4](#fig:narroband) b and c. Consider an expression for $\delta$ in terms of measured and fitted quantities:

<a name='eq:new_eff'></a>

$$
\begin{align} 
\delta_{i(s)} = \frac{C_{is}}{\eta_{i(s)}S_{s(i)}} \label{eq:new_eff}
\end{align}
\tag{6}$$

Here, $S_{s(i)}$ is the singles rate through a signal (idler) narrowband filter. $\eta_{i(s)}S_{s(i)}$ would be the coincidence rate if the idler (signal) filter was wide-band (or just colorless loss), but maintained the same efficiency as measured ($\eta_{i(s)}$). Therefore the fraction can be thought of as the ratio of a coincidence rate measurement with two narroband filters $[C_{is}]$ to a coincidence rate measurement with one narro-band and one wide-band filter $[\eta_{i(s)}S_{s(i)}]$. As we use the same bandwidth filters on the signal and idler arms, the $\delta_i$ and $\delta_s$ calculated from the measured data and JSI fitting results are similar. We use an averaged single $\delta$ value for all further analysis, unique to our JSI bandwidth and 100 GHz DWDM filters.

$$\delta = 0.393 \pm 0.012$$

This is averaged from 8 $\delta_i$ and 8 $\delta_s$ values, for the 8 DWDM channel pairs along the main diagonal of the JSI.

We see Eq. [6](#eq:new_eff) is a modified form of Eq. [3](#eq:regular_eff) that includes $\delta$. With $R \mu \eta_{s(i)}=S_{s(i)}$ again, we can define a new expression for $\mu$ using singles $S_{s(i)}$ and coincidence $C_{is}$ rates.

<a name='eq:new_mu'></a>

$$
\begin{align}
    \mu = \frac{\delta S_s S_i }{R C_{is}} \label{new_mu}
\end{align}
\tag{7}$$

This is used to compute $\mu$ in the main text.

## Quantum state tomography

We perform quantum state tomography of individual channel pairs in order to resolve the full density matrix and calculate bounding terms for the distillable entanglement rate.

Established methods for tomography of time-bin entangled photon pairs involve independent phase control of the two readout interferometers. However, the center bin coincidence rate depends on an overall phase which is the sum of source and readout interferometer phases (see Eq. [1](#eq:cosines)). By manipulating the overall phase through control of only one interferometer, we assume that the full phase-dependent behavior of the system is captured. The data for the tomography is captured with Alice’s interferometer in 3 phase settings. That which minimizes coincidence rate of the center bin (labelled A in Fig. [5](#fig:fringes)), that which maximizes coincidences in the center bin (C), and a state halfway between in phase (B). The (B) state is chosen by setting the interferometer power to a value halfway between the power settings for states A and C. We therefore assume phase scales linearly with power, which is supported by the good agreement in Fig. [5](#fig:fringes) between the phase fringes and a cosine fit.

<figure markdown> 
    <a name='fig:fringes'></a> 
    <img alt="fig:fringes" style="width: 90%; margin: auto;" src="../figs/fringes_light.svg#only-light" >
    <img alt="fig:fringes" style="width: 90%; margin: auto;" src="../figs/fringes_dark.svg#only-dark" > 
    <figcaption markdown> Figure 5: **Center bin fringe measurement** Coincidence rate across center time bin with respect to interferometer power. The fringe data was measured for the two output ports of Alice’s interferometer. The output port 1 data was fitted to a cosine curve using linear least squares.</figcaption>
    </figure>

Multiple measurements involving all three time bins are performed with the phase set in these 3 states. The columns labeled A, B, and C in Fig. [6](#fig:counts_chart) correspond to these 3 measurement conditions, where the measurements for the 90 degree phase measurements are repeated in columns 2 and 3. We organize the coincidence data in this format to show how it relates to more canonical constructions of tomography data where the phases of the two readout stations are controlled independently [@Zhang2021Tomography; @Takesue09Tomography]. Summing the counts in each row yeilds a 16-element vector which is sufficient to calculate a density matrix using a maximum likelyhood method [@tomography2023].

<figure markdown> 
    <a name='fig:counts_chart'></a> 
    <img alt="fig:counts_chart" style="width: 100%; margin: auto;" src="../figs/chart_1_light.svg#only-light" >
    <img alt="fig:counts_chart" style="width: 100%; margin: auto;" src="../figs/chart_1_dark.svg#only-dark" > 
    <figcaption markdown> Figure 6: **Quantum state tomography measurements** Quantum state tomography data for one low-power (SHG at 1.2 Amps) measurement of channels 35 and 59. The numbers are coincidences per second. Dashes (-) indicate projections that cannot be measured for the particular pairing of time-bin choice (row) and interferometer phase setting (column).</figcaption>
    </figure>

We use a density matrix to calculate bounds on $E_D$, the distillable entanglement rate. $E_D$ quantifies the rate of maximally entangled Bell pairs which may be created from the received state with local operations and classical communication. $E_D$ is bounded above by log-negativity $E_N$ and below by coherent information ($E_I = \mathrm{max}\{I_{A\rightarrow B}$, $I_{B\rightarrow A}\}$) [@Alshowkan2022; @Eisert2000] both of which may be calculated from the density matrix:

$$E_N = \mathrm{log_2}||\rho^{A}|| \quad\quad\quad I_{A\rightarrow B} = H\left(\rho^\mathrm{B}\right)-H\left(\rho^{\mathrm{AB}}\right)$$

Where $||\rho^{T_A}||$ is the trace norm of the partial transpose of $\rho$, the calculated bipartite density matrix. $H$ is the base-2 von Neumann entropy [@Vidal2002negativity; @Devetak2004coherent].

The entanglement rate of the experiment in ebits/s is the coincidence rate $C_{AB}$ times $E_D$. We therefore plot $C_{AB}E_N = C_N$ and $C_{AB}E_I = C_I$ in the main text as the upper and lower bounds on entangled bit rate $C_{AB}E_D = C_D$. Multiple integrations are performed at each phase and power setting, so that multiple density matrices and multiple measures of coherent information and log-negativity may be derived. The averages and standard deviations of these sets of measurements are used to define the values and error bars for figures 3 and 4 in the main text.

Figure 3 in the main text also shows a lower bound on secret key rate (SKR) given reasonable assumptions for a slightly different implementation of the entanglement source. This is calculated with a key generation rate formula [@ma2007quantum]:

$$
\begin{align}
C_{SKR} &= C_{AB} E_S \\
C_{SKR} &= q C_{AB}[1-f(\mathcal{E}) H_2(\mathcal{E})-H_2(\mathcal{E})]
\end{align}
$$

Where $E_S$ is the secret key fraction, $C_{AB}$ is the raw coincidence rate, $q$ is a basis reconciliation factor, $\mathcal{E}$ is the quantum bit error rate, and $f(x)$ is the bidirectional error correction efficiency. Quantum bit error rate $\mathcal{E}$ is $(1-V)/2$ where $V$ is visibility&#160;[@Kim2022]. We choose a constant realistic value for $f(\mathcal{E})$ of 1.1 [@ElkoussReconciliation2010]. $H_2(x)$ is the binary entropy formula defined as

$$\mathrm{H}_2(x)=-x \log _2(x)-(1-x) \log _2(1-x).$$

We use a basis reconciliation factor of 0.81, thereby assuming a readout configuration at both Alice and Bob where 90% of each channel’s flux is directed to a z-basis measurement and may be used to build the shared key. The other 10% is used for phase-basis measurements with the interferometers.

<!-- \begin{figure}[H]
    \centering
    \includegraphics[width=0.7\linewidth]{density_matrix.pdf}
    \caption{Density matrix data from channels 35 and 59 at 1.2 A SHG pump power. The $|ee\rangle$ state is higher than all other states due to the interferometer imbalances. For the matrix shown here, $E_N = 0.971$ and $I_{A\rightarrow B} = 0.904$}
    \label{fig:density_matrix}
\end{figure} -->

<figure markdown> 
    <a name='fig:density_matrix'></a> 
    <img alt="fig:density_matrix" style="width: 90%; margin: auto;" src="../figs/density_matrix_light.svg#only-light" >
    <img alt="fig:density_matrix" style="width: 90%; margin: auto;" src="../figs/density_matrix_dark.svg#only-dark" > 
    <figcaption markdown> Figure 7: **Density matrix at low $\mu$** Density matrix data from channels 35 and 59 at 1.2 A SHG pump power. The $|ee\rangle$ state is higher than all other states due to the interferometer imbalances. For the matrix shown here, $E_N = 0.971$ and $I_{A\rightarrow B} = 0.904$</figcaption>
    </figure>

## Interferometer imbalance analysis

It is not trivially clear how much the interferometer early/late imbalances should negatively impact entanglement visibility. The 2nd author of this paper, Samantha Davis, does a theoretical analysis to help answer this question in the supplemental of the manuscript[here](https://arxiv.org/abs/2310.01804)&#160;[@Mueller2023].

!!! note
    **The interferometer imbalance analysis section is not part of this thesis** (and not part of the thesis .pdf), as it does not primarily represent my work. However, it is included [as a supplemental](../removed_chapter_09/index.md) on this site for convenience and completeness.
