#### Background

Superconducting nanowire single photon detectors are highly sensitive devices. Any stray photons from a laboratory environment can be coupled to these devices and produce a detection called a dark count or false count. Dark counts may be present in any situation where the detector is coupled to some experiment or apparatus outside the cryogenic environment. This coupling may be through windows inside the cryostat housing and radiation shields, or through optical fibers that carry single-mode signals directly to detectors.

Visible, near-infrared, and mid-infrared photons are often the main sources of dark counts, because they are ubiquitous in a laboratory environment and are transmitted through common types of fibers and windows. Assuming visible light can be blocked from entering the detector system, the blackbody emission of the room temperature laboratory environment presents is the primary source of dark counts. The spectrum of blackbody photons, defined by Planck’s law, is peaked at about $10~\mathrm{\upmu m}$, though it can contribute dark counts at significant rates up through near-infrared wavelengths.

Without filtering in fiber or free-space, dark counts from blackbody emission will overload most SNSPDs and overpower the extremely faint signal of interest. In this work we investigate minimizing dark counts through the use of cryogenic free-space filtering.

## Introduction

Quantum communication applications require detection systems with performance optimized across 3 metrics: system detector efficiency, timing jitter and dark count rate. The dimensionless figure of merit $H$ specifies this application-specific performance as $H = \frac{\eta}{(\Delta t D)}$&#160;[@Hadfield2009].

Here, we focused on lowering the Dark Count Rate (DCR) of a telecom-band SNSPD system by filtering thermal photons, without sacrificing efficiency or jitter. We demonstrated a free-space coupled SNSPD with sub-0.1 Hz DCR, 14 ps timing jitter, and 72% total system detection efficiency (SDE) by using a differential single-pixel SNSPD [@Colangelo2021] to image a single-mode fiber through an optimized free-space filter stack.

<figure markdown> 
    <a name='fig:dcrmin_filters'></a> 
    <img alt="fig:dcrmin_filters" style="width: 100%; margin: auto;" src="../figs/dcrmin_filters_light.svg#only-light" >
    <img alt="fig:dcrmin_filters" style="width: 100%; margin: auto;" src="../figs/dcrmin_filters_dark.svg#only-dark" > 
    <figcaption markdown> Figure 1: **Filters and transmission spectra** a) various optics and hardware used for free-space coupling inside the cryostat, including one of the Semrock bandpass filters (purple)</figcaption>
    </figure>

The highest system detection efficiencies have been achieved using self-aligned fiber coupling where dark counts can be reduced using cryogenic fiber looping [@Cohen2015] or spliced narrow-band filters [@Boaron2018secure]. But it is difficult to achieve strong filtering without losses at the target wavelength. Low-loss, high-rejection filters are typically available as free-space components, so some of the highest reported H-values were achieved with cryogenic, fiber to free-space to fiber coupling, but exhibit an SDE of only a few percent [@Shibata2015]. The filtering method presented here takes advantage of commercially-available filters, achieves a high free-space coupling efficiency using a cryogenic lens, and is compatible with both fiber and free-space optical inputs.

The system was designed around the use of two types of ultra-high rejection custom short-pass filters, two each with pass-bands below $1.6 \mathrm{\upmu m}$ and $1.9 \mathrm{\upmu m}$ (Andover Corp.). As shown in Fig. [1](#fig:dcrmin_filters) b, any mid-IR passbands of one filter complement a high rejection spectral region of the other. They reject wavelengths shorter than $3 \ \mathrm{\upmu m}$ through reflective optical coatings, and attenuate longer wavelengths through material absorption in the N-BK7 glass substrate. Since the filtering depends on the attenuation of the glass itself, the filters are unusually thick, measuring 12.7 mm.

As initial modelling showed that 4 filters in series were required to sufficiently block mid-IR light, the cryostat design had to accommodate a set of filters several inches thick. This thickness, and the desire to couple to a single-mode fiber-compatible detector with low jitter, also necessitated the use of a cryogenic lens. A 1-inch diameter lens, if mounted outside the cryostat with a focal length surpassing the filter-stack thickness, could not have focused to a sufficiently small spot.
