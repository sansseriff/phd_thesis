## Modelling

<!-- <span style="color: orange">stuff here about the numbers in the model. Could include the equation with the angular dependance of the lens</span> -->

The filtering of the optical stack was modeled by assuming a black-body emitter at 298 K and a field of view defined by the 18.75 mm focal length of the cryogenic lens and the 8 mm diameter of the apertures. The resulting spectrum was multiplied by the transmission of the filters and detector optical stack (see [the filter transmission spectrums](./section_03_introduction.md#fig:dcrmin_filters)). The model showed that two each of the $1.6 \ \mathrm{\upmu m}$ and $1.9 \ \mathrm{\upmu m}$ short pass filters were necessary to suppress mid-infrared light to where it was no longer the dominant source of dark counts. With the inclusion of the four shortpass filters, the dominant source of dark counts is the spectral region near 1550 nm as shown in Fig. [1](#fig:simulation_filter) a, which also illustrates the effect of the bandpass filter.

<figure markdown> 
    <a name='fig:simulation_filter'></a> 
    <img alt="fig:simulation_filter" style="width: 100%; margin: auto;" src="../figs/simulation_filter_thesis_light.svg#only-light" >
    <img alt="fig:simulation_filter" style="width: 100%; margin: auto;" src="../figs/simulation_filter_thesis_dark.svg#only-dark" > 
    <figcaption markdown> Figure 1: **Dark count rate simulation & bandpass transmission** a) Simulated photon flux at various laboratory temperatures with and without the 1550 nm bandpass filter (BP). b) Normalized transmission spectrum of the bandpass filter. Plotted at low temperature by measuring SNSPD count rate versus frequency of the illuminating laser</figcaption>
    </figure>

While the bandpass filter (FWHM = 7 nm) was found to blue-shift by about 2 nm at cryogenic temperatures, the passband was wide enough such that significant attenuation was not observed at the original target wavelength of 1550 nm. This filter is also sufficiently wide to avoid Fourier-limited broadening of ultra-short laser pulses.

Also evident in Fig. [1](#fig:simulation_filter) a is the strong dependence of DCR on the temperature of the final surface outside the cryostat emitting thermal radiation. This motivated the exterior cooling apparatus sketched in the [previous full-system figure](./section_04_design_and_use.md#fig:setup) and shown in Fig. [2](#fig:cooling) b and c. The bulkhead holding the fiber connector is cooled to around -2$^\circ$C using a Peltier element and liquid cooling block. This addition reduced the system DCR from 0.4 Hz to below 0.1 Hz. While dark counts from multiple spatial modes are present in this system — modes that would not be present in a purely fiber based approach — the external cooling technique works to minimize their effect. The external cooling approach is effective while also being cost-effective relative to any digital-control alignment system that could be fully mounted inside the cryostat.

<figure markdown> 
    <a name='fig:cooling'></a> 
    <img alt="fig:cooling" style="width: 100%; margin: auto;" src="../figs/exterior_optics_and_cooling_light.png#only-light" >
    <img alt="fig:cooling" style="width: 100%; margin: auto;" src="../figs/exterior_optics_and_cooling_dark.png#only-dark" > 
    <figcaption markdown> Figure 2: **External optics and cooling** a) The mirror and XYZ translation fiber mount used on the exterior of the cryostat during normal low-dark-count operation. b) The liquid cooling block attached over a thermoelectric element onto the XYZ translation mount. Cooling a surface as close as possible to the fiber output reduced dark counts the best. Other visible wires power thermal probes. c) Infrared image showing the cooling effect on the XYZ mount</figcaption>
    </figure>

This work used a low-jitter SNSPD of the tapered differential design[@Colangelo2023], with an active area of $22 \times 15 \ \mathrm{\upmu m}$, formed by a meander of 100 nm-wide and 5-nm-thick niobium nitride (NbN) nanowires on a 500 nm pitch. A more conventional single-ended readout SNSPD of similar area would also achieve low DCR in this coupling system, but would likely achieve a lower performance metric $H$ from correspondingly higher jitter. The nanowire is embedded in an efficiency-enhancing optical stack made of alternating layers of TiO$_2$ and SiO$_2$ and a gold mirror layer. As shown in Fig. [3](#fig:main_data) a and b, when fiber coupled (without any fiber-based filtering methods applied), this detector achieved a saturated SDE of $84\% \pm 4.4 \%$ and a DCR of 20 Hz at a bias current of $16\ \mathrm{\upmu A}$.

<figure markdown> 
    <a name='fig:main_data'></a> 
    <img alt="fig:main_data" style="width: 80%; margin: auto;" src="../figs/thesis_main_data_light.svg#only-light" >
    <img alt="fig:main_data" style="width: 80%; margin: auto;" src="../figs/thesis_main_data_dark.svg#only-dark" > 
    <figcaption markdown> Figure 3: **Main results** a) Photon count rate vs. bias current showing saturated system detection efficiency of 72%. Detector jitter is also plotted, which decreases with increasing bias current. b) dark count rate vs. bias current for fiber coupled and free space coupled setups. c) values for the H metric derived from the data above for the free space coupling configuration</figcaption>
    </figure>

## Results

As also shown in Fig. [3](#fig:main_data) a, the free-space coupling system achieves up to $72 \% \pm 3.7 \%$ SDE as measured from the fiber outside the cryostat. The reduction in efficiency is likely due to surface reflections in the free-space optics, and potential misalignment in the optical baffles. The minimum DCR ( Fig. [3](#fig:main_data) b) at $72 \%$ SDE is about 0.1 Hz, with a bias current of 16 $\mathrm{\upmu A}$. These metrics, with the jitter measurements shown in Fig. [3](#fig:main_data) a, give a maximum H value of $5 \times 10^{11}$ ( Fig. [3](#fig:main_data) c). Values as high as $1.8 \times 10^{12}$ have been reported before, but at 1.5% system detection efficiency [@Shibata2015]. Our system shows a low DCR can be achieved without severe reduction of SDE or usable target wavelength bandwidth. This is paramount for the future of terrestrial and space-to-ground quantum communication, since it increases success rate with finite statistics [@Boaron2018secure]. The same techniques can be applied to emerging SNSPD applications at longer wavelengths, such as laser ranging [@Taylor2019], where fiber filtering is impractical. Beyond single-mode applications, our work paves the way to scalable, low-DCR, multi-mode coupling to SNSPD arrays [@Wollman2019].
