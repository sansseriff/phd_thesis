#### Background

Superconducting nanowire single photon detectors are high sensitive devices. Any stray photons from a laboratory environment can make their way into these devices and produce a detection called a dark count or false count. Dark counts can be present in any situation where the detector is coupled to some experiment or apparatus outside the cryogenic environment. This coupling may be through windows inside the cryostat housing and radiations shields, or through optical fibers that carry single-mode signals directly to detectors.

Visible, near-infrared, and mid-infrared photons are often the main sources of dark counts, because they are ubiquitous in a laboratory environment and are transmitted through common types of fibers and windows. Assuming visible light can be blocked from entering the detector system, the blackbody emission of the room temperature laboratory environment presents is the primary source of dark counts. The spectrum of blackbody photons, defined by Planck’s law, is peaked at about $10~\mathrm{\upmu m}$, though it can contribute dark counts at significant rates up through near-infrared wavelengths.

Without filtering in fiber or free space, dark counts from blackbody emission will overload most SNSPDs and overpower the extremely faint signal of interest. In this work we investigate minimize dark counts through the use of cryogenic free space filtering.

<!-- ![**short caption here** long caption here](./figs/fig_file_name.svg){#fig:fig_id short-caption='short caption here' width=100% path="chapter_02"} -->

## Introduction

<!-- Time-resolved photon detection with low dark counts is a vital technology in fields such as quantum information processing, classical communication, quantum communication, and laser ranging. Increasingly, research in these fields employs superconducting nanowire single photon detectors (SNSPDs), which have been demonstrated with system detection efficiency ($\eta$) of more than 90% [@Reddy2020], timing jitter ($\Delta t$) as low as 2.6 ps [@Korzh2020] and intrinsic dark count rates ($D$) in the milli- to  micro-hertz range [@Hochberg2019]. However, -->

Quantum communication applications require detection systems with performance optimized across 3 metrics: system detector efficiency, timing jitter and dark count rate. The dimensionless figure of merit $H$ specifies this application-specific performance as $H = \frac{\eta}{(\Delta t D)}$&#160;[@Hadfield2009].

Here, we focused on lowering the Dark Count Rate (DCR) of a telecom-band SNSPD system by filtering thermal photons, without sacrificing efficiency or jitter. We demonstrated a free-space coupled SNSPD with sub-0.1 Hz DCR, 14 ps timing jitter, and 72% total system detection efficiency (SDE) by using a differential single-pixel SNSPD [@Colangelo2021] to image a single-mode fiber through an optimized free-space filter stack.

<!-- \begin{figure}[htbp]
\centering\includegraphics[width=\linewidth]{Hardware and Filters Squashed 2.pdf}
\caption{\small a) System hardware. ASPH: aspheric lens, %(Edmund Optics \#47-729)
SP1 \& SP2: custom short-pass filters, BP: band-pass filter, %(Semrock NIR01-1550/3-25),
BK7: glass windows, SMF: Single-mode fiber, PEL: Peltier element, LC: Liquid cooling block. b) Transmission spectra for the three filters utilized. c) Absorption spectrum for the SNSPD efficiency-enhancing optical stack.}
\label{fig:setup}
\end{figure} -->

<!-- <span style="color: orange">picture of the filters here?</span> -->

<figure markdown> 
    <a name='fig:dcrmin_filters'></a> 
    <img alt="fig:dcrmin_filters" style="width: 100%; margin: auto;" src="../figs/dcrmin_filters_light.svg#only-light" >
    <img alt="fig:dcrmin_filters" style="width: 100%; margin: auto;" src="../figs/dcrmin_filters_dark.svg#only-dark" > 
    <figcaption markdown> Figure 1: **Filters and transmission spectra** a) various optics and hardward used for free space coupling inside the cryostat, including one of the semrock bandpass filters (purple)</figcaption>
    </figure>

The highest system detection efficiencies have been achieved using self-aligned fiber coupling where dark counts can be reduced using cryogenic fiber looping [@Cohen2015] or spliced narrow-band filters [@Boaron2018secure]. But it is difficult to achieve strong filtering without losses at the target wavelength. Low-loss, high-rejection filters are typically available as free-space components, so some of the highest reported H-values were achieved with cryogenic, fiber to free-space to fiber coupling, but exhibit an SDE of only a few percent [@Shibata2015]. The filtering method presented here takes advantage of commercially-available filters, achieves a high free-space coupling efficiency using a cryogenic lens, and is compatible with both fiber and free-space optical inputs.

The system was designed around the use of two each of two types of ultra-high rejection custom short-pass filters (semrock) with pass-bands below $1.6 \mathrm{\upmu m}$ and $1.9 \mathrm{\upmu m}$ (Andover Corp.). As shown in Fig. [1](#fig:dcrmin_filters) b, any mid-IR passbands of one filter compliment a high rejection spectral region of the other. They reject wavelengths shorter than $3 \ \mathrm{\upmu m}$ through reflective optical coatings, and attenuate longer wavelengths through material absorption in the N-BK7 glass substrate. Since the filtering depends on the attenuation of the glass itself, the filters are unusually thick – 12.7 mm.

As initial modelling showed that 4 filters in series were required to sufficiently block mid-IR light, the cryostat design had to accommodate a several-inch thick set of filters. This thickness, and the desire to couple to a single-model fiber compatible detector with low jitter, also necessitated the use of a cryogenic lens. A 1-inch diameter lens, if mounted outside the cryostat with a focal length surpassing the filter-stack thickness, couldn’t have focused to a sufficiently small spot.
