## Methods

<!-- In paper -->

Prior to the PPM demosntration, we collected data with multi-photon optical pulses repeatedly impinging on the detector at the same time with respect to a clock. This way, we study how the PNR effect in isolation is manifest in the timing measurements recorded at the low and high trigger levels. We label the measurements from the low (8&#160;mV) and high (50&#160;mV) trigger levels as $t_A$ and $t_B$ respectively. As shown in

[this is a link](section_03_introduction.md#fig:waveform)

, histograms of these arrival events are multimodal due to the PNR response. We first present a method for recovering a symmetric arrival time response function using the the slope measurement $\Delta t_{BA} = t_B - t_A$.

### Slope-Based Correction

<figure markdown> 
    <a name='fig:slope_correction'></a> 
    <img alt="fig:slope_correction" style="width: 100%; margin: auto;" src="../figs_03/slope_cancellation_light.svg#only-light" >
    <img alt="fig:slope_correction" style="width: 100%; margin: auto;" src="../figs_03/slope_cancellation_dark.svg#only-dark" > 
    <figcaption markdown> Figure 1: **PNR Slope Variation Analysis and Cancellation** a) 2D histogram of RF pulse measurements. Through graphing slope $\Delta t_{BA}$ on the x-axis and arrival time $t_A$ on the y-axis, a series of groupings are visible that identify the discrete photon numbers detected.</figcaption>
    </figure>

Pairs of pulse measurements $t_A$ and $t_B$ may be graphed on a 2D plane parametrized by $\Delta t_{BA}$ on the x-axis and $t_A$. Fig. [1](#fig:slope_correction) a shows how this protection exhibits multiple groupings that correspond the the photon number character of the impinging optical mode. The 1 and 2-photon events are clearly identifiable and seperated from other events, with $|3\rangle$, $|4\rangle$, and $|5\rangle$ events also visible with less mutual separation. While Fig. [1](#fig:slope_correction) a is shown here for just one mean photon number $\mu$, these grouplings are collected for a full range of attenuations and corresponding $\mu$. Fig. [1](#fig:slope_correction) a shows histograms from projecting 3 such groupings down onto the $\Delta t_{BA}$ axis.

Thee slope correction method involves the measurement and creation of a slope-versus-arrival time line, one of which is shown in Fig. [1](#fig:slope_correction) a. This is produced by averaging all $t_A$ measurements for a given slope $\Delta t_{BA}$. That is, the values along vertical slices of the 2D density plot in Fig. [1](#fig:slope_correction) a are averaged to produce the y-coordinates of the slope-versus-arrival time line shown in black. By interpolating new $\Delta t_{BA}$ measurements on this curve and using it like a lookup table, PNR corrections $C_A$ are found. These may be subtracted off from $t_A$ producting $\tilde{t_A} = t_A - C_A(\Delta t_{BA})$ where $\tilde{t_A}$ is a constructed timing measurement that exhibits a symmetric arrival time response function and shown in Fig. [1](#fig:slope_correction) c. 

The data representation and calibration curve shown in Fig. [1](#fig:slope_correction) a may be constructed with $t_B$ on the y-axis as well. Then the PNR corrections are applied the the $t_B$ measurements instead. However, the resulting histograms $\tilde{t_B}$ are virtual identical to $\tilde{t_A}$.

### Cluster Analysis
