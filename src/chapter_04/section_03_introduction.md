## Introduction


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

Entangled photons play a vital role in the development of quantum information processing and communication systems. The ability to generate entangled photon pairs at a high rate is essential for establishing reliable and scalable quantum networks, as well as for implementing entanglement-based quantum key distribution (QKD) systems. Unlike QKD systems that rely on attenuated lasers, entanglement distribution systems may fulfill the objectives of QKD while also serving as the foundation for advanced quantum networks that heavily rely on entanglement as a fundamental resource.


<!-- prior entanglement dist. work -->
Entanglement-distribution and entanglement-based QKD systems have been demonstrated with impressive performance across a number of metrics. These include 40 Kbps data rates in a QKD system deployed over 50 km of fiber [@Pelet2022], as well as multiple polarization entangled sources that leverage spectral multiplexing. These polarization sources include a demonstration of 181 kebits/s across 150 ITU channel pairs, and a high-power source potentially capable of  gigabit rates with many added channels and detectors [@Alshowkan2022; @Neumann2022Entanglement]. Multiple works have highlighted the need to  leverage high total brightness, spectral brightness, collection efficiency, and high visibility from pair generating non-linear crystals in order to realize practical high-rate entanglement distribution [@Neumann2022Entanglement]. 

<!-- less existing focus on polarization entanglement -->
<!-- % There has been less community focus on the use of time-bin entanglement to achieve these goals. 
A time-bin entangled photon source has certain advantages over a polarization-based system. Time-bin entanglement can be measured with no moving hardware and does not require precise polarization tracking to maximise visibility\cite{something}.
% As opposed to polarization entanglement, a time-bin approach does not require precise polarization tracking to maximise visibility\cite{something}.  -->
Also, with suitable equipment, robust time-bin modulation is possible over free space links with turbulence [@Jin2019]. Therefore, the possibility of simplified fiber-free space interconnects and larger quantum networks based on a shared time-bin protocol motivates development of improved time-bin sources. 

<!--  Short system overview -->
We employ a 4.0 GHz mode locked laser source with 80-ps delay interferometers to realize a high-rate source. Wavelength multiplexing is used for reading out energy-time entangled photon pairs, thereby realizing multiple high fidelity channels pairings which together sum to a high coincidence rate. Each of the 8 pairs can be considered an independent carrier of photonic entanglement [@Wengerowsky2018] and therefore the system as a whole is applicable to flex-grid architectures through the use of wavelength selective switching [@Appas2021; @Alshowkan22Switching]. However, we focus here on maximizing the rate between two receiving stations, Alice and Bob (Fig. \ref{fig:system}a). Each station is equipped with DWDMs that receive multiplexed channels, and may include multiple detectors to read out the full rate. 

![**System Drawing & DWDM Channels** a) Pulses from a 1539.47 nm mode locked laser (Pritel UOC) are doubled by an 80 ps delay interferometer before up-conversion and amplification in a SHG \& EDFA module (Pritel). A short PM fiber from the SHG connects to the SPDC where photon pairs are created. The CWDM module separates the SPDC spectrum into multiple ~13 nm wide bands spaced by 20 nm. The 1530 and 1550 nm bands are sent to the Bob and Alice stations respectively. The readout interferometers have the same time delay as the source interferometer.  Polarization controllers are used to maximize the coincidence rates, as the detection efficiencies of the SNSPDs is polarization sensitive ($\pm20\%$). Entanglement fidelity is unaffected by readout polarization. The two SNSPDs are connected to each channel pair in succession to resolve full system performance. b) ITU channels involved with the experiment. Pairs of channels highlighted with the same color obey the SPDC \& pump energy matching condition, and can be directly read out through DWDM channel outputs. To asses the full 16 channels (27-42) of Alice's DWDM multiplexer, Bob's 8-channel DWDM is switched out for a tunable narroband filter.](./figs_04/sys_drawing_light.svg){#fig:sys_drawing short-caption="System Drawing & DWDM Channels." width=100%}

<!-- ![**Cryostat free space coupling options.**](./figs_05/fig1b_light.svg){#fig:cryostat_concept short-caption="Cryostat optical coupling"} -->

<!-- %## Overview of data we collect -->
We quantify per-channel brightness and fidelity as a function of pump power, as well as collection efficiencies, coincidence rates across 8 channel pairs, and expected performance of a partially realized 16-channel pair configuration. We show that the 8 channel system achieves low-power fidelities that average to 99.76\%. At a higher power, we demonstrate a total coincidence rate of 0.51 MHz with fidelities that average to 99.22\%. Through quantum state tomography we bound the distillable entanglement rate of the system to between 80\% and 95\% of the high-power coincidence rate (0.41 - 0.48 Mebits/s). 

<!-- %## witch Schmidt we get HOM prediction -->
Quantifying a source's spectral mode purity is important for gauging its utility in advanced quantum networks that rely on 2-photon interference measurements like Bell State Measurements. 
<!-- % But for most sources in the literature, spectral mode purity is not studied or optimized for.  -->
With Schmidt decomposition we quantify the modal purity of single DWDM channel pairs and derive the inverse Shmidt number which serves as an estimate for two-photon HOM visibility between two such sources. Ultimately, we demonstrate that an entanglement generation source of this design makes for a robust and powerful building block for future high rate quantum networks. 
