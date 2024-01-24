## Time-walk correction

SNSPD jitter increases with count rate due to properties of the nanowire reset process and features of the readout circuit. A threshold timing measurement set at a specific trigger level will ‘walk’ along the rising edge of SNSPD pulses by varying amounts if those pulses vary in amplitude and slew rate. At low count rates, SNSPDs exhibit very uniform pulse heights and shapes. However, at high counts rates where the inter-arrival time is on the order of the reset time of the detector, current-reset and amplifier effects lead to smaller and distorted pulses in a form of pulse ‘pile-up’&#160;[@Mueller2023].

<!-- \begin{figure}[H]
    \centering
    \includegraphics[width=0.7\linewidth]{time_walk_comparison_light.pdf}
    \caption{a) Adding 200~ns dead time (DT) to avoid high-rate jitter significantly reduces count rates at higher $\mu$. With time walk correction (TWC), the full available count rate is preserved while keeping the timing jitter low. b) The reduction in count rate for coincidences is more dramatic, because the lost efficiency at both detectors contrinbutes. }
    \label{fig:time_walk_vs_dead_time}
\end{figure} -->

<figure markdown> 
    <a name='fig:time_walk_vs_dead_time'></a> 
    <img alt="fig:time_walk_vs_dead_time" style="width: 70%; margin: auto;" src="../figs/time_walk_comparison_light.svg#only-light" >
    <img alt="fig:time_walk_vs_dead_time" style="width: 70%; margin: auto;" src="../figs/time_walk_comparison_dark.svg#only-dark" > 
    <figcaption markdown> Figure 1: **Time walk effect vs dead time rejection** a) Adding 200&#160;ns dead time (DT) to avoid high-rate jitter significantly reduces count rates at higher $\mu$. With time walk correction (TWC), the full available count rate is preserved while keeping the timing jitter low. b) The reduction in count rate for coincidences is more dramatic, because the lost efficiency at both detectors contributes.</figcaption>
    </figure>

The effects of time walk can be filtered out by imposing a dead time following each detection. The length of the dead time is tuned so that SNSPD events arriving within it are expected to have distorted timing, and are thrown out. However, as shown in Fig. [1](#fig:time_walk_vs_dead_time), this method can severely limit count and coincidence rates for detector types that exhibit long periods of undershoot or ringing on the falling edge of the RF pulse. For the differential SNSPDs used here, a 200&#160;ns dead time would be necessary to filter out all time-walk effects.

As detailed in [@Mueller2023; @Craiciu23], a calibration and correction process may be used to cancel out the effects of time walk without losing count rate. It relies on adding timing corrections $\tilde{d}$ to time-distorted SNSPD time tags based on the inter-arrival $t'$ time that precedes each tag. Building a lookup table for $\tilde{d}$ as a function of $t'$ is the objective of the calibration process. With this, real-time running software may largely cancel the increase in jitter from time-walk.

Here we introduce a simplification of the calibration process from [@Mueller2023] that makes use of the pulse sequence already impinging on the detectors from the entanglement source. With the calibration routine written directly into our coincidence analysis software, recomputing the ideal $t'-vs-\tilde{d}$ curve takes no more than a few seconds whenever the detector bias currents or trigger levels are changed.

We have previously shown how the $t'-vs-\tilde{d}$ curve can be found by illuminating the detector with photons from a pulsed laser source [@Mueller2023]. We imposed the requirement that the period $p$ of the pulses sequence be larger that the largest expected jitter observed due to time walk. This way, any time-tag can be unambiguously associated with the timing of the laser pulse that created it, thereby inferring the relation between $t'$ and $\tilde{d}$ for that event.

Here we rely on a 2D histogram ( Fig. [2](#fig:time_walk) a) that plots $t'$ on the y-axis and the usual clock-referenced arrival time on the x-axis. Here, any single $t'$ and absolute arrival time measurement does not imply a correction $\tilde{d}$ when considered in isolation. This is because the time-distribution is an irregular pattern of histogram peaks of varying height, as opposed to a more uniform sequence. Also, delays $\tilde{d}$ can surpass the experiment’s fundamental period (244.5&#160;ps from the laser’s 4.09&#160;GHz rep rate), initially complicating the matching of trigger events to originating photon timing. But despite these nuances, the 2D histogram structure implies a method for extracting the $t'-vs-\tilde{d}$ calibration curve through a special analysis.

Slices at the bottom of the 2D histogram ( Fig. [2](#fig:time_walk) a ) for large $t'$ are essentially identical to the low-count-rate 3-peak singles histograms like from Fig. [system:1](./section_04_system_results.md#fig:figure_2nd_1)c. As $t'$ decreases from here, the slice as a whole develops some linear offset or rollover (periodic every 244.5&#160;ps). This offset is the $\tilde{d}$ offset of interest. Therefore, $t'-vs-\tilde{d}$ may be extracted by running a template matching algorithm on each horizontal slice, using the large-$t'$ slice as the template. We opt for a absolute differences algorithm ( Fig. [2](#fig:time_walk) b ). As the algorithm progress to smaller and smaller $t'$, the offset may approach the fundamental period length and ‘roll over’ causing a jump-discontinuity. But this can be detected and corrected for, meaning the method may produce a $t'-vs-\tilde{d}$ curve ( Fig. [2](#fig:time_walk) c ) with some $\tilde{d}$ larger than the fundamental period.

<!-- \begin{figure}[H]
    \centering
    \includegraphics[width=0.8\linewidth]{time_walk_analysis.pdf}
    \caption{a) The 2d histogram with clock-referenced histograms on the x-axis and inter-pulse arrival time $t'$ on the y-axis. The effect of time walk is evident in the horizontal translations of the 3-peak structure as $t'$ decreases. Slices of the 2D histogram indicated by the red and blue horizontal line are plotted as regular histograms in the lower figure. b) After applying the Sum Absolute Differences filter to horizontal slices of the 2D histogram. The $t'-vs-\tilde{d}$ delay curve (c) is extracted from this by using the index of each row with minimum mismatch value as the $\tilde{d}$ value for that row.}
    \label{fig:time_walk}
\end{figure} -->

<figure markdown> 
    <a name='fig:time_walk'></a> 
    <img alt="fig:time_walk" style="width: 100%; margin: auto;" src="../figs/time_walk_analysis_light.svg#only-light" >
    <img alt="fig:time_walk" style="width: 100%; margin: auto;" src="../figs/time_walk_analysis_dark.svg#only-dark" > 
    <figcaption markdown> Figure 2: **In situ time walk analysis** a) The 2d histogram with clock-referenced histograms on the x-axis and inter-pulse arrival time $t'$ on the y-axis. The effect of time walk is evident in the horizontal translations of the 3-peak structure as $t'$ decreases. Slices of the 2D histogram indicated by the red and blue horizontal line are plotted as regular histograms in the lower figure. b) After applying the Sum Absolute Differences filter to horizontal slices of the 2D histogram. The $t'-vs-\tilde{d}$ delay curve (c) is extracted from this by using the index of each row with minimum mismatch value as the $\tilde{d}$ value for that row.</figcaption>
    </figure>

Overall, time-walk analysis based on the 2D histogram construction is straightforward to implement and user friendly because it may be applied *in situ* as part of software that already creates histograms and records coincidences.

## Filter bandwidths

<!-- \begin{figure}[H]
    \centering
    \includegraphics[width=0.7\linewidth]{filter_comparison_light.pdf}
    \caption{Spectrums for a single DWDM channel and narroband filter, with the center wavelengths set to zero. The narroband filter is used at Bob with the 16-channel DWDM at Alice to measure coincidence rates in the main text Fig. 2b. For the 100~GHz spec. DWDM filters, 100~GHz refers to the filter spacing. The FWHM passband for each is about 82~GHz.}
\end{figure} -->

<figure markdown> 
    <a name='fig:bandwidths'></a> 
    <img alt="fig:bandwidths" style="width: 80%; margin: auto;" src="../figs/filter_comparison_light.svg#only-light" >
    <img alt="fig:bandwidths" style="width: 80%; margin: auto;" src="../figs/filter_comparison_dark.svg#only-dark" > 
    <figcaption markdown> Figure 3: **DWDM and tunable narroband filter bandwidths** Spectrums for a single DWDM channel and narroband filter, with the center wavelengths set to zero. The narroband filter is used at Bob with the 16-channel DWDM at Alice to measure coincidence rates in Fig. [system:1](./section_04_system_results.md#fig:figure_2nd_1)b. For the 100&#160;GHz spec. DWDM filters, 100&#160;GHz refers to the filter spacing. The FWHM passband for each is about 82&#160;GHz.</figcaption>
    </figure>

## Guard regions

The width $x$ of the guard regions centered at 80 and 160 ps were set to 10&#160;ps. As shown in Fig. [4](#fig:guard_scan), this width increase fidelities slightly without significantly impacting coincidence rates. 10&#160;ps was not chosen based on rigorous analysis, though it would be possible to optimize the width to maximize some metric, like secret key rate.

<!-- \begin{figure}[h]
    \centering
    \includegraphics[width=1\linewidth]{guard_scan_light.pdf}
    \caption{Charts on the right show phase basis fidelities and total coincidence rates as a function of width $x$, where both guard regions stay centered at 80 \& 160~ps.}
    \label{fig:guard_scan}
\end{figure} -->

<figure markdown> 
    <a name='fig:guard_scan'></a> 
    <img alt="fig:guard_scan" style="width: 100%; margin: auto;" src="../figs/guard_scan_light.svg#only-light" >
    <img alt="fig:guard_scan" style="width: 100%; margin: auto;" src="../figs/guard_scan_dark.svg#only-dark" > 
    <figcaption markdown> Figure 4: **Effect of guard regions on visibilities** Charts on the right show phase basis fidelities and total coincidence rates as a function of width $x$, where both guard regions stay centered at 80 & 160&#160;ps.</figcaption>
    </figure>

## Incompatible bases & accidental coincidence rate

An entangled pair can be called ‘spectrally compatible’ with a given DWDM channel pairing if –given no losses– it would be detected 100% of the time across that channel pair. In the case where signal and idler modes are perfectly spectrally compatible, it has been shown that accidental coincidences still negatively impact visibilities [@Kim2022]. In this case and assuming negligible dark counts, visibility is reduced as:

$$
\begin{aligned}
V = \frac{1}{1+\mu}V_0
\end{aligned}
$$

where $V_0$ is a nominal interferometer-limited visibility [@Kim2022] and $\mu$ is the mean photon number per pulse (classically defined like with [the usual $\mu$ formula](./section_06_modelling_details.md#eq:colorless) ). The accidental coincidence rate $C_{Acc}$ — discussed in the [system & results](./section_04_system_results.md) section — is only partially related to this, as it specifically takes into account only accidental coincidences due to incompatible spectral modes. Such coincidences can arise from two situations, and can be assigned their own coincidence rates

-   $C_{ee}$: two photons both from mutually incompatible spectral regions, like the red regions in [modelling:3](./section_06_modelling_details.md#fig:narroband).
-   $C_{em}$ and $C_{me}$: one photon from the central overlapping filter region and one from an incompatible spectral region.

Say one member of a spectrally compatible entanglemed pair reaches Alice, but not Bob due to loss. The photon received at Alice could form a coincidence with a spectrally incompatible photon that arrives at Bob. These are the $C_{em}$ and $C_{me}$ type coincidences. $C_{Acc}$ in the [system & results](./section_04_system_results.md) section is the sum of $C_{ee}$, $C_{em}$ and $C_{me}$:

$$
\begin{align}
    C_{Acc} &= C_{ee} + C_{em} + C_{me} \\
    C_{ee}/R &= (1 - \delta)\frac{S_A}{R} * (1 - \delta)\frac{S_B}{R} \\
    C_{em}/R &= (1 - \delta)\frac{S_A}{R} * \delta (1-\eta_A) \frac{S_B}{R} \\
    C_{me}/R &= (1 - \delta)\frac{S_B}{R} * \delta (1-\eta_B) \frac{S_A}{R} \\
\end{align}
$$

$$
\begin{align}
C_{Acc} = \frac{1}{R}(1 - \delta) S_A S_B \left(\delta \left(1-\eta _A\right)+\delta \left(1-\eta _B\right)+1-\delta\right)
\end{align}
$$

## Maximum entangled photon source throughput

We observe in the small $\mu$ limit that the metrics $V$, $E_N = C_N/C_{AB}$, $E_I = C_I/C_{AB}$, and $E_S = SKR/C_{AB}$ scale linearly with $\mu$, where $E_S$ is the secret key fraction. Raw coincidence rate is not linear with $\mu$ due to the count rate dependent efficiency of the SNSPDs. As count rate increases, the detector spends a larger fraction of time in a partially reset state where photo-detection is less efficient or not possible. We separately collect measurements of detector efficiency versus count rate extending past 10&#160;Mcps, and use this to extrapolate coincidence rate to higher powers. Then, the metrics $E_N$, $E_I$, and $E_S$ are multiplied by the extrapolated rate to define extrapolated $C_N$, $C_I$, and $SKR$ as shown in Fig. [5](#fig:scan_extrapolate) b. Maximum values of these metrics are highlighted by colored circular markers.

In this work we primarily study the capability of 8 DWDM channel pairs, with some analysis of 16-pair performance. However, the spectrum of entangled photon pairs produced by the type-0 SPDC is quite broad, meaning spectral multiplexing across many more channels is possible. In Fig. [5](#fig:scan_extrapolate) the spectrum of the SPDC is overlayed with sixty 100&#160;GHz DWDM channel pairs spanning the L, C, and S ITU bands \[L-29 (1592.1&#160;nm) through C-20 (1543.73) and C-10 (1535.82) through S-1 (1490.76)\]. The coincidence rate through these added channels can be estimated from this spectrum and the known performance of the central 8 channel pairs. Table [discussion:1](./section_05_discussion.md#table:maximum_rates) specifies estimates for the total rate from the 60 multiplexed spectral channels.

<!-- \begin{figure}[H]
    \centering
    \includegraphics[width=1\linewidth]{scan_extrapolate_light.pdf}
    \caption{a) and b) include data from main text Figure 3, and extrapolate it to higher $\mu$. It is notable that $C_I$ and $SRK$ reach their maximum values for only marginally higher pump powers than those used for our measurements. c) Spectrum of entangled photon pairs out of the SPDC, measured with an Anritsu MS9740B spectrum analyzer in High Dynamic Range mode. As the signal was near the instrument noise floor, many repeated spectrum measurements were point-averaged.}
    \label{fig:scan_extrapolate}
\end{figure} -->

<figure markdown> 
    <a name='fig:scan_extrapolate'></a> 
    <img alt="fig:scan_extrapolate" style="width: 100%; margin: auto;" src="../figs/scan_extrapolate_light.svg#only-light" >
    <img alt="fig:scan_extrapolate" style="width: 100%; margin: auto;" src="../figs/scan_extrapolate_dark.svg#only-dark" > 
    <figcaption markdown> Figure 5: **Rates with extrapolated mean photon number** a) and b) include data from [system:2](./section_04_system_results.md#fig:shg_scan), and extrapolate it to higher $\mu$. It is notable that $C_I$ and $SRK$ reach their maximum values for only marginally higher pump powers than those used for our measurements. c) Spectrum of entangled photon pairs out of the SPDC, measured with an Anritsu MS9740B spectrum analyzer in High Dynamic Range mode. As the signal was near the instrument noise floor, many repeated spectrum measurements were point-averaged.</figcaption>
    </figure>
