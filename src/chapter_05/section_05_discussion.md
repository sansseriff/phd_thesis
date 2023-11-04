## Discussion
<div class="latex">\begin{table}
\begin{tabular}{ |p{3.5cm}||p{2.5cm}|p{2.5cm}|p{2.5cm}|p{2.5cm}|}
 \hline
 \multicolumn{5}{|c|}{Extrapolated rates (MHz)} \\
 \hline
 \makecell[l]{rate metric \\ ($\mu$ at max)}   &  1 Channel & 8 Channels & 16 Channels & 60 Channels \label{table:max_rates}\\
 \hline
 \makecell[l]{coincidence rate, $C_{AB}$ \\(0.014)} & 0.755 & 5.41    &  11.6  &  34.9     \\
 \hline
 \makecell[l]{log negativity, $C_N$ \\(0.010)}& 0.600 & 4.30    &  9.19  &  27.7   \\
 \hline
 \makecell[l]{coherent info., $C_I$ \\(0.006)}& 0.345 & 2.47 &  5.28  &  15.9 \\
 \hline
 \makecell[l]{secret key rate, $SKR$ \\(0.007)}& 0.309 & 2.21 &  4.73  &  14.3 \\
 \hline
\end{tabular}
\caption{Per-channel predicted maximum values for the 4 rate metrics are shown in the column labeled `1 Channel'. Depending on the metric, the maxima are achieved for different pump powers $\mu$ (See supplemental note 11). The $\mu$ value that maximizes each metric is shown in parenthesis on the left.}
\label{table:maximum_rates}
\end{table}</div>




<!-- ![**short caption here** long caption here](./figs/fig_file_name.svg){#fig:fig_id short-caption='short caption here' width=100% path="chapter_05"} -->

We have demonstrated that a time-bin entanglement source based on a mode-locked laser, spectral multiplexing and low-jitter detectors produces high entangled photon rates suitable for QKD or advanced quantum networks. Still, there is potential to increase rates beyond those measured here with some straightforward changes to the setup. First, a higher power EDFA-amplified SHG module or tapered amplifier may be used. With this, we predict a single channel pair could sustain rates up to those specified in the first column of Table 1. Our measurements of 8 channel and 16 channel configurations imply the approximately multiplicative scalings in columns 2 and 3, as coincidence rates of these channels pairs are all withing 27\% of each other.  From measurements of the SPDC spectrum, it is also possible to extrapolate rates to a 60-channel 100 GHz DWDM configuration that includes channels spanning the L, C, and S ITU bands. This configuration could sustain 34.9 MHz total coincidence rate, and a distillable entanglement rate between 27.7 ($C_N$) and 15.9 Mebits/s ($C_I$).  These rates are impressive considering they are achievable with existing SNSPDs and other technology. The SPDC spectrum and extrapolation details are found in <span style="color: orange">Supplementary note 11</span>.

```{=html}
<a name='table:maximum_rates'></a>
<table style="margin: 0" markdown>
| rate metric ($\mu$ at max) | 1 Channel | 8 Channels | 16 Channels | 60 Channels |
| --- | --- | --- | --- | --- |
| coincidence rate, $C_{AB}$ (0.014) | 0.755 | 5.41 | 11.6 | 34.9 |
| log negativity, $C_N$ (0.010) | 0.600 | 4.30 | 9.19 | 27.7 |
| coherent info., $C_I$ (0.006) | 0.345 | 2.47 | 5.28 | 15.9 |
| secret key rate, $SKR$ (0.007) | 0.309 | 2.21 | 4.73 | 14.3 |
<figcaption markdown>**Extrapolated count rates** Per-channel predicted maximum values for the 4 rate metrics are shown in the column labeled `1 Channel'. Depending on the metric, the maxima are achieved for different pump powers $\mu$ <span style="color: orange">(See supplemental note 11)</span>. The $\mu$ value that maximizes each metric is shown in parenthesis on the left.</figcaption>
</table>
```

The ratio of singles rates $S_A, S_B$ to coincidence rates $C_{AB}$ are high in this system due to the relatively wide-band JSI and narrow filters. Each DWDM channel at Alice picks up a large fraction of photons that can't be matched with pairs passing though the corresponding channel passband at Bob, a feature quantified by the $\delta$ factor. The high singles rates lead to accidental coincidences from mutually incompatible spectral modes that lower visibility and load the detectors with useless counts. However, there is potential to mitigate these extra counts by embedding the nonlinear crystal undergoing SPDC in a cavity that enhances emission at the center frequencies of multiple DWDM channels~[@Pomarico2009; @Brydges2023; @slattery2019background]. Also, there are other approaches to achieving such intensity islands that require dispersion engineering~[@morrison2022frequency; @xin2022spectrally]. With such periodically enhanced emission, the resulting JSI would exhibit a series of intensity islands lying along the energy-matching anti-diagonal, easily separable with DWDMs at Alice and Bob. The photon flux for each each channel would originate primarily from these islands covered by both signal and idler DWDM passbands, resulting in a higher ratio of coincidences to singles. The probability of accidental coincidences $C_{Acc}$ would be lower, and therefore bring the decrease of visibility with $\mu$ more in line with the modeled $V_C$ data in Fig.~\ref{fig:shg_scan}. Furthermore, this would enable substantially higher maximum rate metrics than those in <span class="html">Table [1](#table:maximum_rates)</span><span class="latex"> table \ref{table:maximum_rates}</span>. 

This source is a fundamental building block for future space-to-ground and ground-based quantum networks. It leverages the strengths of the latest SNSPD developments -- namely simultaneous high count rates, low jitter and high efficiency -- and in doing so adopts interferometers and DWDM systems that are compact, stable and accessible. By elevating the system clock rate to 4.09 GHz and shrinking the time bin size to 80~ps, we have demonstrated a new state of the art in quantum communication that enables adoption of mature and extensively developed technologies from classical optical networks. Also, the spectral multiplexing methods used here are potentially compatible with those demonstrated in broadband quantum memories~\cite{Sinclair2014} and optical quantum computing~\cite{lukens2017frequency}.

<!-- % To ensure straightforward comparability with other source designs, we did not subject the photon pairs to long-distance link attenuation. The single-mode fibers in use added up to no more than 10 m length. All of the following collection efficiencies include coupling and transmission losses of WDMs and fibers, leakage from imperfect wavelength channel separation and SNSPD detection efficiencies. -->

<!-- % # summary: production of a wide bandwidth (JSI), and how the useful JSI extends beyond the spectral range of the 8-channel pairings. -->


#### Acknowledgements
Part of the research was carried out at the Jet Propulsion Laboratory, California Institute of Technology, under a contract with the National Aeronautics and Space Administration (NASA) (No. 80 NM0018D0004). Support for this work was provided in part by the Defense Advanced Research Projects Agency (DARPA) Defense Sciences Office (DSO) Invisible Headlights program, NASA SCaN, Alliance for Quantum Technologies’ (AQT) Intelligent Quantum Networks and Technologies (INQNET) program, and the Caltech/JPL PDRDF program. A. M. is supported in part by the Brinson Foundation and the Fermilab Quantum Institute. M.S. is in part supported by the Department of Energy under Grant Nos. SC0019219 and SC002376. We are grateful to Si Xie (Caltech/Fermilab) and <span class="latex">Cristi{\' a}n Pe{\~ n}a </span><span class="html">Cristián Peña (Fermilab)</span>(Fermilab) for supporting this work in terms of sharing equipment and facilities. The authors acknowledge Prathwiraj Umesh for assistance in reviewing the manuscript. 

#### Data availability
Data underlying the results presented in this paper are available in [@mueller2023code; @mueller2023data]
