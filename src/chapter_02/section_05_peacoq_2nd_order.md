## Higher order correction & the PEACOQ detector

The Performance Enhanced Array for Counting Optical Quanta (PEACOQ) is a new fiber-coupled SNSPD design that achieves high count rate by spreading the photon flux across a parallel array of short niobium nitride nanowires. Each wire may acheive count rates as high as 50 MCounts/s, so the 32-wire array as a whole can handle photon rates in excess of 1 GCounts/s. The PEACOQ is described in detail in Reference [@Craiciu23].

From early tests of the PEACOQ, it became evident that jitter increased dramatically at high single wire count rates. One of the overaching goals the the PEACOQ project was to demonstrate near-100~ps jitter at 1 GCount/s. Therefore, we investigated the possibility of applying time walk correction techniques to this detector. This began with collecting a calibration dataset like that discussed in <span class="html">the [mode locked laser calibration section](section_04_method.md#mode-locked-laser-calibration)</span><span class="latex">section \ref{mode-locked-laser-calibration}</span>.

A 1-GHz repetition rate 1550 nm mode locked laser was used (Pritel UOC) for calibration. The 1~GHz repetition rate was chosen so that uncorrected jitter even at the highest count rates (approaching 400 ps at the FW1\%M), was smaller than the laser period. Then, each time tag may be matched to the timing of the original optical pulse. A dataset with a count rate of 20 MCounts/s was used for calibration. At this rate, there is a good balance of statistics available for $t'$ ranging between 5 and 150 ns. 

The calibration process for the PEACOQ showed that high-rate pulse distortions are primarily due to amplifier effects and the overlap of RF pulses with the overshoot or ringing effects of previous RF pulses. This is because the nanowire design and fabrication of the PEACOQ seeks to minimize the intrinsic reset time of the nanowire. The time it takes for bias current to re-saturate in the device is generally faster than the time for all amplifier effects to disappear following a previous RF pulse. @fig:order_1st b is the delay vs.~$t’$ curve derived from the calibration process. Unlike the <span class="html">[the calibration figure](section_04_method.md#fig:jitterate_results_1) from the first demonstration</span><span class="latex">in Fig. \ref{fig:jitterate_results_1}</span>, the delay vs.~$t’$ curve for the PEACOQ shows features that are closely related to the falling edge of the RF pulse (@fig:order_1st a). In particular, the calibration curve shows a peak near 25 ns that aligns with an undershoot in the RF waveform caused by a reflection off a cryogenic amplifier. Future implementations of the PEACOQ will optimize the amplification chain to minimize RF reflections. Though even with such optimizations, it is likely that time-walk correction will improve high rate jitter. 

![**PEACOQ RF pulse and calibration curve** a) The RF pulse of one of the PEACOQ nanowires. The effect of an impedance mismatch reflection is visible at 25~ns. b) The delay vs $t'$ curve for wire 1 of the PEACOQ. The peak at 25~ns lines up in time with the RF reflection visible in (a), and works to correct for the time-walk delays it causes.](./figs_02/SOM_Figure_order_1st_v2_light.svg){#fig:order_1st short-caption="PEACOQ RF pulse and calibration curve" width=100%}

As before with the meandered SNSPD, there is no requirement that the calibration only be used in an application that's based on the same repetition rate of 1 Ghz. As interpolation between points on the delay vs.~$t'$ vslookup curve is possible, delay corrections for arbitrary $t'$ measurements may be found. 


#### Second Order Calibration

The 2nd order time-walk correction is a new technique that builds on the methods previously introduced in this chapter.  The intrinsic reset time of the PEACOQ nanowires is considerably shorter than the time it takes an RF pulse to return to a steady zero voltage. So multiple pulses can arrive in the time it takes one RF pulse to fully decay as seen by the timing electronics. Therefore, a given RF pulse can be level shifted not only by the presence of a previous pulse a few nanoseconds earlier, but even by the presence of two previous pulses. The calibration and correction process was extended to correct a given pulse timing measurement based on two inter-pulse time measurements $t'$ and $t''$ as shown in @fig:order_2nd a. The calibration process uses the same mode-locked laser derived pulse train as the 1st order calibration. For each $t'$ there is a full range of possible $t''$ times and vice versa, so the result of calibration becomes a 2D grid of delay corrections indexed by $t'$ and $t''$. $t'$ is always less than $t''$ for the parameterization chosen, where both are measured from the latest or ‘current’ time tag (@fig:order_2nd a). Therefore, the space of valid measurements is triangular as shown in @fig:order_2nd b.

![**PEACOQ 2D calibration parameterization & results** a) A diagram showing how RF pulse waveforms can interfere additively, and how $t'$ and $t''$ are parameterized. For illustrative purposes only. b) The result of 2nd order calibration, a grid of delay measurements indexed by $t'$ and $t''$. The blue/red slices and corresponding graphs show how the the effect of varying $t''$ for a given $t'$ is similar to varying $t'$ for a given $t''$. ](./figs_02/SOM_Figure_order_2nd_v1_light.svg){#fig:order_2nd short-caption="PEACOQ 2D calibration parameterization & results" width=100%}


Predominant features of the 2d calibration grid seem to be orthogonal and aligned to the axes. This is a result of the parametrization chosen for $t'$ and $t''$. Features of the calibration that arise due to additive mixing of overlapped RF pulse waveforms which manifest as orthogonal structures in the 2d-calibration grid.

<!-- which supports the assumption that the distortion effects arise from the additive mixing of overlapped RF pulse waveforms.  -->

<!-- (This is the most nuanced statement. Elaborate or gloss over it?) -->


In the limit of large $t''$, a slice of the calibration grid bears close resemblance to the $t'$ vs delay curve used for 1D calibration and correction (@fig:order_1st b).  Like in the 1D correction method, a delay correction can be found during real-time acquisition and processing by interpolating on a lookup table. Only now, the lookup table has an extra dependent variable $t''$, and the interpolation is two dimensional. 

Proper handling of inter-pulse arrival measurements that fall outside the 2D grid is necessary for good correction performance.  When both $t'$ and $t''$ fall outside the 2D grid, no correction is applied. When $t''$ falls outside the grid but $t'$ does not, a 1st order correction is applied to determine what delay must be subtracted to the current tag to correct its distortion. When both $t''$ and $t'$ fall within the 2d grid, a full 2d spline interpolation on the grid in @fig:order_2nd b is applied to find the necessary delay correction. 

Like the 1st-order correction, the 2nd-order method makes the assumption that the delays to be corrected are small relative to the inter-pulse times $t’$ and $t’’$. 

The codebase supporting our findings with the 1st and 2nd order correction is 
available at [SNSPD-time-walk-and-jitter-correction](https://github.com/sansseriff/SNSPD-time-walk-and-jitter-correction).




<span class="bokeh" path="../code/test_1"></span>