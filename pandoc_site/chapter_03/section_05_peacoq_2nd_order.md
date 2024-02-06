## Higher order correction & the PEACOQ detector

The Performance Enhanced Array for Counting Optical Quanta (PEACOQ) is a new fiber-coupled SNSPD design that achieves high count rate by spreading the photon flux across a parallel array of short niobium nitride nanowires. Each wire may achieve count rates as high as 50 MCounts/s, so the 32-wire array as a whole can handle photon rates in excess of 1 GCounts/s. The PEACOQ is described in detail in Reference [@Craiciu23].

From early tests of the PEACOQ, it became evident that jitter increased dramatically at high single wire count rates. One of the overarching goals the the PEACOQ project was to demonstrate near-100&#160;ps jitter at 1 GCount/s. Therefore, we investigated the possibility of applying time walk correction techniques to this detector. This began with collecting a calibration dataset like that discussed in the [mode locked laser calibration section](section_04_method.md#mode-locked-laser-calibration).

A 1-GHz repetition rate 1550 nm mode locked laser was used (Pritel UOC) for calibration. The 1&#160;GHz repetition rate was chosen so that uncorrected jitter even at the highest count rates (approaching 400 ps at the FW1%M), was smaller than the laser period. Then, each time tag may be matched to the timing of the original optical pulse. A dataset with a count rate of 20 MCounts/s was used for calibration. At this rate, there is a good balance of statistics available for $t'$ ranging between 5 and 150 ns.

The calibration process for the PEACOQ showed that high-rate pulse distortions are primarily due to amplifier effects and the overlap of RF pulses with the overshoot or ringing effects of previous RF pulses. This occurs because the PEACOQ was designed and fabricated to minimize the intrinsic reset time of the nanowire. The time it takes for bias current to re-saturate in the device is generally faster than the time for all amplifier effects to disappear following a previous RF pulse. Fig. [1](#fig:order_1st) b is the delay vs.&#160;$t’$ curve derived from the calibration process. Unlike the [the calibration figure](section_04_method.md#fig:jitterate_results_1) from the first demonstration, the delay vs.&#160;$t’$ curve for the PEACOQ shows features that are closely related to the falling edge of the RF pulse (Fig. [1](#fig:order_1st) a). In particular, the calibration curve shows a peak near 25 ns that aligns with an undershoot in the RF waveform caused by a reflection off a cryogenic amplifier. Future implementations of the PEACOQ will optimize the amplification chain to minimize RF reflections. Though even with such optimizations, it is likely that time-walk correction will improve high rate jitter.

<figure markdown> 
    <a name='fig:order_1st'></a> 
    <img alt="fig:order_1st" style="width: 100%; margin: auto;" src="../figs/SOM_Figure_order_1st_v2_light.svg#only-light" >
    <img alt="fig:order_1st" style="width: 100%; margin: auto;" src="../figs/SOM_Figure_order_1st_v2_dark.svg#only-dark" > 
    <figcaption markdown> Figure 1: **PEACOQ RF pulse and calibration curve** a) The RF pulse of one of the PEACOQ nanowires. The effect of an impedance mismatch reflection is visible at 25&#160;ns. b) The delay vs $t'$ curve for wire 1 of the PEACOQ. The peak at 25&#160;ns lines up in time with the RF reflection visible in (a), and works to correct for the time-walk delays it causes.</figcaption>
    </figure>

As before with the meandered SNSPD, there is no requirement that the calibration only be used in an application that is based on the same repetition rate of 1 Ghz. As interpolation between points on the delay vs.&#160;$t'$ vs lookup curve is possible, delay corrections for arbitrary $t'$ measurements may be found.

#### Second order calibration

The 2nd order time-walk correction is a new technique that builds on the methods previously introduced in this chapter. The intrinsic reset time of the PEACOQ nanowires is considerably shorter than the time it takes an RF pulse to return to a steady zero voltage. So multiple pulses can arrive in the time it takes one RF pulse to fully decay as seen by the timing electronics. Therefore, a given RF pulse can be level shifted not only by the presence of one pulse before, but even two or three before. The calibration and correction process was extended to correct a given pulse timing measurement based on two inter-pulse time measurements $t'$ and $t''$ as shown in Fig. [2](#fig:order_2nd) a. The calibration process uses the same mode-locked laser derived pulse train as the 1st order calibration. For each $t'$ there is a full range of possible $t''$ times and vice versa, so the result of calibration becomes a 2D grid of delay corrections indexed by $t'$ and $t''$. $t'$ is always less than $t''$ for the parameterization chosen, where both are measured from the latest or ‘current’ time tag (Fig. [2](#fig:order_2nd) a). Therefore, the space of valid measurements is triangular as shown in Fig. [2](#fig:order_2nd) b.

<figure markdown> 
    <a name='fig:order_2nd'></a> 
    <img alt="fig:order_2nd" style="width: 100%; margin: auto;" src="../figs/SOM_Figure_order_2nd_v1_light.png#only-light" >
    <img alt="fig:order_2nd" style="width: 100%; margin: auto;" src="../figs/SOM_Figure_order_2nd_v1_dark.png#only-dark" > 
    <figcaption markdown> Figure 2: **PEACOQ 2D calibration parameterization & results** a) A diagram showing how RF pulse waveforms can interfere additively, and how $t'$ and $t''$ are parameterized. For illustrative purposes only. b) The result of 2nd order calibration, a grid of delay measurements indexed by $t'$ and $t''$. The blue/red slices and corresponding graphs show how the the effect of varying $t''$ for a given $t'$ is similar to varying $t'$ for a given $t''$.</figcaption>
    </figure>

Predominant features of the 2d calibration grid seem to be orthogonal and aligned to the axes. This is a result of the parametrization chosen for $t'$ and $t''$. Features of the calibration that arise due to additive mixing of overlapped RF pulse waveforms manifest as orthogonal structures in the 2d-calibration grid.

<!-- which supports the assumption that the distortion effects arise from the additive mixing of overlapped RF pulse waveforms.  -->

<!-- (This is the most nuanced statement. Elaborate or gloss over it?) -->

In the limit of large $t''$, a slice of the calibration grid bears close resemblance to the $t'$ vs delay curve used for 1D calibration and correction (Fig. [1](#fig:order_1st) b). Like in the 1D correction method, a delay correction can be found during real-time acquisition and processing by interpolating on a lookup table. Only now, the lookup table has an extra dependent variable $t''$, and the interpolation is two dimensional.

Proper handling of inter-pulse arrival measurements that fall outside the 2D grid is necessary for good correction performance. When both $t'$ and $t''$ fall outside the 2D grid, no correction is applied. When $t''$ falls outside the grid but $t'$ does not, a 1st order correction is applied to determine what delay must be subtracted to the current tag to correct its distortion. When both $t''$ and $t'$ fall within the 2d grid, a full 2d spline interpolation on the grid in Fig. [2](#fig:order_2nd) b is applied to find the necessary delay correction.

Like the 1st-order correction, the 2nd-order method makes the assumption that the delays to be corrected are small relative to the inter-pulse times $t’$ and $t’’$.

<figure markdown> 
    <a name='fig:single_wire_correction'></a> 
    <img alt="fig:single_wire_correction" style="width: 100%; margin: auto;" src="../figs/single_wire_results_light.svg#only-light" >
    <img alt="fig:single_wire_correction" style="width: 100%; margin: auto;" src="../figs/single_wire_results_dark.svg#only-dark" > 
    <figcaption markdown> Figure 3: **PEACOQ single wire time-walk correction** Jitter response functions for 3 count rates from one wire of the PEACOQ detector.</figcaption>
    </figure>

Fig. [3](#fig:single_wire_correction) shows how the 1st and 2nd order corrections improve jitter of the one wire of the PEACOQ detector tested. Each of these response functions have full width at half maximum (FWHM), full width at one tenth maximum (FW1/10M) and full width at one hundredth maximum (FW1/100M) metrics. The FW1/100M width is relevant for quantum communication applications that design the fundamental experiment repetition rate or bin size based on this metric. We plot how these metrics scale with count rate for the single nanowire as shown in Fig. [4](#fig:single_wire_width_metrics).

<figure markdown> 
    <a name='fig:single_wire_width_metrics'></a> 
    <img alt="fig:single_wire_width_metrics" style="width: 100%; margin: auto;" src="../figs/width_metrics_single_wire_light.svg#only-light" >
    <img alt="fig:single_wire_width_metrics" style="width: 100%; margin: auto;" src="../figs/width_metrics_single_wire_dark.svg#only-dark" > 
    <figcaption markdown> Figure 4: **PEACOQ single wire width metrics** Width metrics versus count rate. The FW1/100M metric benefits greatly from both the 1st and 2nd order time-walk correction. Only when count rate is sufficiently high and pulses are very close together does it become more likely that any one pulse can be corrupted by its previous-previous pulse.</figcaption>
    </figure>

With data available over a wide range of single-wire count rates, and the correction method, we simulate the performance of the whole PEACOQ detector with time walk correction. This is based on matching count rate measurements ( Fig. [5](#fig:matching) ) from the full array to count rates available in the single-wire dataset used for calibration and correction. The full-array rate measurements are from another cryostat and time tagger setup that supports full-readout of the PEACOQ

<figure markdown> 
    <a name='fig:matching'></a> 
    <img alt="fig:matching" style="width: 90%; margin: auto;" src="../figs/peacoq_array_sim_light.svg#only-light" >
    <img alt="fig:matching" style="width: 90%; margin: auto;" src="../figs/peacoq_array_sim_dark.svg#only-dark" > 
    <figcaption markdown> Figure 5: **Matching PEACOQ wire count rates to calibration dataset** Blue bars represent count rates of data files for which the time-walk correction can be performed. Grey bars represent unique wire count rates from an integrated full-array measurement of the PEACOQ in another experiment setup. The count rates have a Gaussian shape with respect to wire number as the coupled optical fiber has a lateral intensity profile that is roughly Gaussian.</figcaption>
    </figure>

Fig. [6](#fig:simulation_results) a shows simulated full-array jitter response functions for 3 choice count rates, normalized from their peaks. The FWHM, FW1/10M, and FW1/100M width metrics are indicated with continuous, dashed, and dotted lines, respectively.

<figure markdown> 
    <a name='fig:simulation_results'></a> 
    <img alt="fig:simulation_results" style="width: 100%; margin: auto;" src="../figs/array_simulation_results_light.svg#only-light" >
    <img alt="fig:simulation_results" style="width: 100%; margin: auto;" src="../figs/array_simulation_results_dark.svg#only-dark" > 
    <figcaption markdown> Figure 6: **Simulated full PEACOQ array jitter performance with time-walk correction** Each simulated jitter histogram (2D corrected, 1D corrected, or uncorrected) is a weighted sum of 32 response functions for the 32 wires, each with count rate representative of a certain wire in the array ( Fig. [5](#fig:matching) ).</figcaption>
    </figure>

<!-- The codebase supporting our findings with the 1st and 2nd order correction is 
available at [SNSPD-time-walk-and-jitter-correction](https://github.com/sansseriff/SNSPD-time-walk-and-jitter-correction). -->

<!-- <span class="bokeh" path="../code/test_1"></span> -->
