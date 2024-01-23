## Introduction

<!-- DSOC, high loss -->

Deep space optical communication has been a growing field of study in recent years, as space agencies look for ways to increase data rates to and from deep space missions. A key challenge in this work is closing a communication link over extremely large distances and high loss. For data transmission from a power-limited spacecraft to earth, this must be done with a restricted power budge, and therefore requires the use of photon efficient communication protocols that optimize the number of bits sent per unit of energy.

<!-- more will be said about PIE later i guess? -->

In this article, we demonstrate high rate Pulse Position Modulation (PPM) applicable to future deep space communication. A transmitter sends an optical pulse in one of $2^M$ possible time slots measured with respect to a clock. At a receiver, the arrival time of this pulse is measured to recover $M$ bits of encoded data. Each successive set of $2^M$ time slots following by a dead time constitute a PPM frame.

<!-- maybe hold off on ppm frame stuff till later... -->

The Deep Space Optical Communicaiton (DSOC) project managed by the Jet Propulsion Laboratory (JPL) demonstrates optical communication using PPM with the Psyche spacecraft from distances of 0.06 to 2.7 Au [@Srinivasan2023GroundReceiver].

For larger M, more data may be sent with a single optical pulse or given spacecraft power budge. This is quantified through the photon information efficiency $c_p = C/E$ where $C$ is the link capacity

$$
C=\left(1-e^{-E}\right) \log _2 M,
$$

and $E$ is the photon cost per optical pulse. DSOC relies on modulation of a CW seed laser to generate the communication signal on the spacecraft. This signal is then amplified by an Erbium Doped Fiber Amplifier (EDFA) which dominates the power budget of the spacecraft optical transmission system. Therefore, power consumption scales with the number of optical pulses sent.

The DSOC project uses PPM with maximum M values of at least 5, meaning 5 bits of data are sent using 32 time slots per frame. M values as high as 19 have been demonstrated in the lab&#160;[@essiambre2023record], but the number of time bins needed per frame scales exponentially with the number of bits transmitted per pulse. Therefore, for a given fixed clock rate and time bin duration, the PPM data rate decreases dramatically for higher M values.

<!-- PPM can achieve higher photon information efficiency than coherent detection techniques [@Dolinar2011Photon] for which the need to measure phase of the incoming optical signal limits minimum transmission power.  -->

We demonstrate a high clock rate PPM protocol in the lab based on modulating a mode-locked laser and receiving pulses with a low jitter superconducting nanowire single photon detector (SNSPD) (Fig. [1](#fig:intro) (a)). We focus on demonstrating moderately high PIE, while also increasing the clock rate of the sytem by an order of magnitude relative to the DSOC platform (from 2&#160;GHz to 20&#160;GHz). By operating at both higher clock rate and PIE than DSOC, this system exemplifies how future iterations of DSOC may send data more quickly but also over greater distances with the same power budget.

<!-- With the increase of both clock rate and PIE, this protocol suggests a potentially attractive upgrade path DSOC-like systems, as similar implementations could offer both higher data rates and operation across greater distances.  -->

The rate increase is possible due to recent advancements in Niobium Nitride SNSPDs&#160;[@Colangelo2023]. These achieve low jitter performance by incorporating impedance matching tapers for efficient RF coupling, resulting in higher slew rate pulses, and by enabling RF pulse readout from both ends of the nanowire. The dual-ended readout allows for the cancellation of jitter caused by the variable location of photon arrival along the meander when the differential signals are recombined with a balun. These detectors achieve jitter as low as 50 ps at the FW(1/100)M level, making them suitable for the demonstration of PPM with 50 ps slot widths and a 20 GHz clock.

<figure markdown> 
    <a name='fig:intro'></a> 
    <img alt="fig:intro" style="width: 100%; margin: auto;" src="../figs/fig_intro_2_light.svg#only-light" >
    <img alt="fig:intro" style="width: 100%; margin: auto;" src="../figs/fig_intro_2_dark.svg#only-dark" > 
    <figcaption markdown> Figure 1: **PPM modulation and experiment setup** a) Diagram of the expiremental setup. WG: wave generator, CD: clock divider board, AWG: Arbitrary Waveform Generator, MLL: Mode Locked Laser (Pritel UAC), IM: Intensity Modulator, BC: Bias Controller, FSC: Free Space Coupling System, DCA: DC Coupled Cryo-amp b) How bits are transmitted in M=16 PPM modulation. An optical pulse is transmitted with a clock-referenced integer delay which encodes 4 bits of data. c) Scope trace of the RF pulse produced by the differential-readout tapered SNSPD. Fig. [2](#fig:waveform) zooms in on the rising edge outlined in red here.</figcaption>
    </figure>

However, these detectors exhibit a photon number dependent response that affects the time-correlated measurements needed for high-rate PPM. This behavior, shown in Fig. [2](#fig:waveform) also gives the detector photon number resolution (PNR) — a property that is desirable in certain applications including quantum communication and quantum computing. The SNSPD generates RF pulses with greater amplitude and slew rate when detecting optical pulses with multiple photons. Photon number effects are especially evident in this lower jitter variety of SNSPD due to the use of impedance matching tapers which more efficiently couple energy out of the nanowire and into the readout circuit. With high resolution time tagging equipment, photon number dependent effects have even been observed in SNSPDs not necessarily designed to exhibit it [@schapeler2023superconducting; @sauer2023resolving] like those without tapers [@Cahall2017SlewRatePNR]. Therefore it is increasingly likely that future research involving low-jitter SNSPDs and multiphoton pulsed sources will have to explicitly manage the PNR response for accurate time-correlated measurements – whether the effect it is desired or not.

For the tapered differential detectors, the PNR response affects timing of fixed threshold timetaggs at any trigger level (Fig. [2](#fig:waveform)). However, at lower trigger levels the PNR response is less pronounced and the timing measurements are less affected. Therefore, we divide a single SNSPD readout line using an RF splitter and trigger on the RF pulse at a high and low level as shown by the red lines in Fig. [2](#fig:waveform). This gives partially conjugate information on optical pulse arrival time and photon number. From these measurements we study the PNR response in detail and present two methods for managing it. We demonstrate how the photon number information may be deconvolved from the arrival time information, and how both de-correlated degrees of freedom can be extracted simultaneously. This enables the original goal of high rate PPM, but also informs how low-jitter photon number resolving SNSPDs can be used in other classical communication and quantum applications.

<figure markdown> 
    <a name='fig:waveform'></a> 
    <img alt="fig:waveform" style="width: 80%; margin: auto;" src="../figs/waveform_light.svg#only-light" >
    <img alt="fig:waveform" style="width: 80%; margin: auto;" src="../figs/waveform_dark.svg#only-dark" > 
    <figcaption markdown> Figure 2: **PNR-sensitive pulse waveform** The rising edge of the differential SNSPD’s RF pulses exhibit variations in height, slew rate, and arrival time due to photon-number dependent dynamics. The slopes of the 1-photon and 2-photon pulses significantly differ, and as the photon number increases, the alterations to the pulse shape become progressively smaller. Trigger levels A (8 mV) and B (50 mV) were used to extract as much information about pulse slope and arrival time as possible.</figcaption>
    </figure>

### Development of a modulation source

We produce our PPM signal signal by carving a 1550&#160;nm high rate mode locked laser with lithium niobate modulators. Each mode locked laser pulse has duration on the order of 0.5&#160;ps. By modulating a mode-locked laser, the optical pulses do not incur timing jitter from the limited slew rate of the modulators or the RF signal that drives them. Two modulators are used in series to achieve the high extinction ratio needed to successively block up to 2047 laser pulses in a row.

We do two PPM demonstrations, with the source mode locked laser operating at 10.75 and 20 GHz. THe 10.75 GHz demonstration uses a M value of 10, thereby making frames with 1024 time slots of 93 ps width each. The 20 GHz demonstration uses M=11, giving 2048 time slots per frame of 50 ps width. Each frame ends with a dead time of approximately 150 ns to allow the SNSPD to fully recover before the next frame.

<!-- Therefore, we chose to carve pulses from a mode-locked laser. This approach allows for extremely short pulses in time, with the modulators responsible for sufficiently reducing any surrounding unwanted pulses. The temporal width of the modulator pulse response must be extremely short and able to modulate from 'off' to 'on' within a time frame of the order of the 50 ps bin width. -->

<!-- Extras -->

Several modern free running time taggers support the averaging of multiple input channels to create fewer higher resolution channels. This implies a tradeoff between jitter or timing resolution and number of channels for a given time tagging device. Therefore, it is important to consider readout methods like that presented here that make use of 2 lower-resolution channels in place of a single higher resolution channel, as these two configurations are similarly resource efficient.

<!-- ```{=html}
*[SNSPD]: Superconducting Nanowire Single Photon Detector
*[SNSPDs]: Superconducting Nanowire Single Photon Detector
*[DCR]: Dark Count Rate
*[PPM]: Pulse Position Modulation
``` -->
