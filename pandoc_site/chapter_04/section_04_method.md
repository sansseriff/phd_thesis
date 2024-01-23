## Methods

<!-- In paper -->

We encode a 98 kilobit [image](./section_05_results.md#fig:decoding_20GHz) as the dataset for transmission in both the 10.75 and 20 Ghz demonstrations. Due to limitations of the AWG, the full dataset can not be transmitted sequentially. Instead, sequencies of 8 (10.75 Ghz) and 9 (20 GHz) pulses each are successively loaded into AWG memory, transmitted several times, then switched out for the next sequence. The 98 kbit dataset is therefore transmitted with 9832 (10.75 GHz) and 8937 (20 GHz) frames across 1229 (10.75 GHz) and 993 (20 GHz) AWG sequences. Assuming sequential transmission of all frames, the 10&#160;GHz demonstration achieves a data rate of 40.7 megabits/s, and the 20&#160;GHz demonstration achieves 43.6 megabits/s.

We begin with a preamble sequence that only consists of pulses in the $i = 0$ time slot. Before sending the rest of the dataset, we modulate this set multiple times, collecting data from low and high trigger levels for impinging optical pulses of varying mean photon number. This provides information on the detector’s photon number response without arrival time variation. We label the measurements from the low (8&#160;mV) and high (50&#160;mV) trigger levels as $t_A$ and $t_B$, respectively. As shown in [the waveform figure](section_03_introduction.md#fig:waveform), histograms of these arrival events are multimodal with distinct groupings for for each photon number detection. We first present a method for recovering a symmetric arrival time response function using the the slope measurement $\Delta t_{BA} = t_B - t_A$.

### Slope-based correction

<figure markdown> 
    <a name='fig:slope_correction'></a> 
    <img alt="fig:slope_correction" style="width: 100%; margin: auto;" src="../figs/slope_cancellation_light.svg#only-light" >
    <img alt="fig:slope_correction" style="width: 100%; margin: auto;" src="../figs/slope_cancellation_dark.svg#only-dark" > 
    <figcaption markdown> Figure 1: **PNR slope variation analysis and cancellation** a) 2D histogram of RF pulse measurements. Through graphing slope $\Delta t_{BA}$ on the x-axis and arrival time $t_A$ on the y-axis, a series of groupings are visible that identify the discrete photon numbers detected. b) Histogram of events for pulse slope $\Delta t_{BA}$ for several mean photon numbers. c) Histogram of constructed measurements $\tilde{t_A}$ from applying pulse-slope-dependent corrections $C_A$. The distribution of $\tilde{t_A}$ is symmetric, but its FWHM width varies depending on mean photon number.</figcaption>
    </figure>

Pairs of pulse measurements $t_A$ and $t_B$ may be graphed on a 2D plane parametrized by $\Delta t_{BA}$ on the x-axis and $t_A$. Fig. [1](#fig:slope_correction) a shows how this protection exhibits multiple groupings that correspond the the photon number character of the impinging optical mode. The 1 and 2-photon events are clearly identifiable and seperated from other events, with $|3\rangle$, $|4\rangle$, and $|5\rangle$ events also visible with less mutual separation. While Fig. [1](#fig:slope_correction) a is shown here for just one mean photon number $\mu$, this response is collected for a full range of attenuations and corresponding $\mu$. Fig. [1](#fig:slope_correction) a shows histograms from projecting 3 such measurements down onto the $\Delta t_{BA}$ axis.

The slope-correction method involves the measurement and creation of a slope-versus-arrival time line, one of which is shown in black on Fig. [1](#fig:slope_correction) a. This is produced by averaging all $t_A$ measurements for a given slope $\Delta t_{BA}$, or equivalently averaging across rows for each column in the 2D plotted data in Fig. [1](#fig:slope_correction) a . By interpolating new $\Delta t_{BA}$ measurements on this curve and using it like a lookup table, PNR corrections $C_A$ are found. These may be subtracted off from $t_A$ producing $\tilde{t_A} = t_A - C_A(\Delta t_{BA})$ where $\tilde{t_A}$ is a constructed timing measurement that exhibits a symmetric arrival time response function and shown in Fig. [1](#fig:slope_correction) c. 

The data representation and calibration curve shown in Fig. [1](#fig:slope_correction) a may be constructed with $t_B$ on the y-axis as well. Then the PNR corrections are applied the the $t_B$ measurements instead. However, the resulting histograms $\tilde{t_B}$ are virtually identical to $\tilde{t_A}$ as they are ultimately constructed from the same data.

### Cluster analysis

The photon-number dependent effects shown in [the waveform figure](section_03_introduction.md#fig:waveform) are uniquely separable in terms of photon number due to the inherently pulsed nature of the source.

Given the pulsed nature of the modulation source, there is not necessarily a need to define a continuous variable like $\tilde{t_A}$ as an intermediate step before binning. Instead, PPM decoding can be generalized to the operation of matching a pair of timing measurements $t_A, t_B$ to one of multiple probability distributions in the $t_A, t_B$ space, each of which corresponds to a different time bin and models the photon number dynamics for that bin. The shape of the distributions is dependent on the mean photon number $\mu$, and they may overlap for shorter time bin lengths.

<!-- For a light pulse arriving at a given time with respect to a clock, the detector has a certain response function in the 2D $t_A, t_B$ space that may be thought of as a probability distribution (see the 2D histogram in the 1st Gaussian figure). Given there is a model for this distribution in the 2D space, the problem of PPM decoding becomes one of identifying which modeled distribution a given 2D point belongs to, for the set of distributions seperated by the time-bin length along the $t_A$ and $t_B$ axes (Fig. XXc).  -->

We opt to use a Gaussian mixture model (GMM) to model the detector response for a given time bin. This is a statistical model that represents the probability distribution of a set of data as a weighted sum of Gaussian distributions. It is effective for modelling the multi-model shape of the photon number dependent detector response with a minimal number of parameters. The ellipses in Fig. [2](#fig:gmm_model) a & b represent Gaussians used to fit the histogrammed data. We use an off-the-shelf GMM algorithm, and do not impose any limit on how many Gaussians are used to faithfully model each one of the photon clusters.

<figure markdown> 
    <a name='fig:gmm_model'></a> 
    <img alt="fig:gmm_model" style="width: 100%; margin: auto;" src="../figs/gmm_intro_analysis_t_light.svg#only-light" >
    <img alt="fig:gmm_model" style="width: 100%; margin: auto;" src="../figs/gmm_intro_analysis_t_dark.svg#only-dark" > 
    <figcaption markdown> Figure 2: **Initial Gaussian mixture model analysis** a) & b) 2D histogram of multi-photon SNSPD detections parametrized by timing measurements $t_A$ and $t_B$. The shape of the data and modelled distributions depends on mean photon number $\mu$. The ellipses denote the location and shape of the Gaussian components used to model the data. c) Shaded regions and overlayed contour plots for GMM-modeled detector response seperated by 50&#160;ps, corresponding to the 20&#160;GHz PPM demonstration. Identifying which bin a detector measurement corresponds to is equivalent to identifying which colored region a $t_A, t_B$ point should belong to. For the 20&#160;GHz demonstration, discrimination cannot be perfect because the distributions overlap.</figcaption>
    </figure>

It can be hard to get a sense of how the Gaussian mixture model fits to the 2D data in @fig:gmm_model a & b. The following interactive plot shows slices of the data and fitted model on the right, and the full 2D data on the left. 

<figure markdown> 
<a name='fig:interactive_gmm'></a> 
<span class="bokeh" id="../code/pnr_gmm"></span>
<figcaption markdown>Data in the $t_A, t_B$ plane for $\mu = 3.48$. The red line indicates where the slice at a particular $t_A$ value is made. The right-hand plot shows data counts and scaled amplitude of the GMM model at that $t_A$ slice. </figcaption>
</figure>

Previous work has used principle component analysis (PCA) for modelling the photon-number dependent response of SNSPDs. As shown in [an extra section](./section_07_extra.md#independent-component-analysis), Independent Component Analysis (ICA) — a method related to PCA — is still useful for photon-number attribution for our detector and setup, and could be used in concert withe the slope-correction method above. However, as described in more detail in the discussion section, we believe the generality of the GMM approach has certain benefits, especially for future extensions to the analysis that must contend with pulse distortion effects like pile-up and time-walk&#160;[@Mueller2023]. Ultimately, both GMM methods and PCA/ICA analysis methods hold promise for SNSPD further response modelling.

As shown in Fig. [2](#fig:gmm_model) c, there exist regions in the $t_A, t_B$ plane for which a given GMM model for pulse $i$ is most probable. The exact shape of this boundary could be computed as detailed in [a later section](./section_07_extra.md#computing-gmm-intersection-boundaries) for computationally efficient binning in the $t_A, t_B$ plane. But for this demonstration computational overhead this is not a major concern, so we compute the probability of a $[t_A, t_B]$ point for a few nearest distributions and pick the one with largest probability.

???+ info
    A 3D representation of the overlapping Gaussian mixture models is shown here. This is acts as an alternative to Fig. [2](#fig:gmm_model) c. The 3D plot is interactive, and can be rotated and zoomed.
    <script>
                function resizeIframe(iframe) {
                    iframe.style.height = iframe.contentWindow.document.documentElement.scrollHeight + 'px';
                    iframe.style.width = iframe.contentWindow.document.documentElement.scrollWidth + 'px';
                }
    </script>

    <style>
    iframe {
                display: block;
                width: 100%;
                border: none;
            }
    </style>
    <figure markdown>
    <a name='fig:interactive_gmm_overlap'></a> 
    <iframe src="../code/3_high_mfn.html" onload="resizeIframe(this)" scrolling="no"></iframe>
    <figcaption markdown>With the 20 GHz repetition rate, some overlap of the detector probability distributions is expected. Here, surfaces of different colors represent different time bins spaced by 50 ps. The way the surfaces overlap explains why it can be ambiguous if some events are 2-photon events in time slot $i$, or 3-photon events in time slot $i+1$. </figcaption>
    </figure>
