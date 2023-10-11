## Introduction


<!-- DSOC, high loss -->
Deep space optical communication has been a growing field of study in recent years, as researchers look for ways to communicate with spacecraft that are far away from Earth. A key challenge in the development of this technology is closing the communication link over extremely large distances and high loss. This must be done given a restricted power budget available on the spacecraft, and therefore requires the use of highly efficient optical communication protocols that optimize the number of bits sent per unit of energy.

<!-- more will be said about PIE later i guess? -->

In this article, we will focus on the use of Pulse Position Modulation (PPM) for space based optical communication.  PPM involves sending a pulse in one of $2^M$ possible time slots. The transmission of each such pulse carries M bits of information based on when it arrives in a set of bins called a frame. 

The Deep Space Optical Communicaiton (DSOC) project managed by the Jet Propulsion Laboratory (JPL) aims to demonstrate optical communication using PPM with the Psyche spacecraft from distances of up to <span style="color: orange">XX</span> Au.

For larger M, more data may be sent with a single optical pulse, thereby allowing a power limited spacecraft to send more data over a high loss optical channel back to earth. This is quantified through the photon information efficiency $c_p = C/E$ where $C$ is the link capacity and $E$ is the photon cost per optical pulse 

The existing DSOC project uses M up to $2^8 = 256$, meaning 8 bits of data may be carried in each optical pulse. M values as high as 19 have been demonstrated in the lab~[@essiambre2023record], but the number of time bins needed per frame scales exponentially with the number of bits transmitted per pulse. Therefore, for a given fixed clock rate and time bin duration, the PPM data rate decreases dramatically for higher M values. 

<!-- PPM can achieve higher photon information efficiency than coherent detection techniques [@Dolinar2011Photon] for which the need to measure phase of the incoming optical signal limits minimum transmission power.  -->

We demonstrate a high clock rate PPM protocol in the lab based on modulating a mode-locked laser and receiving pulses with a low jitter superconducting nanowire single photon detector (SNSPD) (@fig:intro (a)).We focus on demonstrating moderately large PIE, while also increasing the clock rate of the sytem by an order of magnitude relative to the DSOC platform (2~GHz). By operating at both higher clock rate and PIE than DSOC, this system exemplifies how future iterations of DSOC may send data more quickly but also over greater distances with the same power budget. 

<!-- With the increase of both clock rate and PIE, this protocol suggests a potentially attractive upgrade path DSOC-like systems, as similar implementations could offer both higher data rates and operation across greater distances.  -->

The rate increase is possible due to recent advancements in Niobium Nitride SNSPDs~[@Colangelo2023].  These acheive low jitter performance by incorporating impedance matching tapers for efficient RF coupling, resulting in higher slew rate pulses, and by enabling RF pulse readout from both ends of the nanowire. The dual-ended readout allows for the cancellation of jitter caused by the variable location of photon arrival along the meander when the differential signals are recombined with a balun. These detectors achieve jitter as low as 50 ps at the FW(1/100)M level, making them suitable for the demonstration of PPM with 50 ps slot widths and a 20 GHz clock.

![**PPM modulation and experiment setup** a) Diagram of the expiremental setup. WG: wave generator, CD: clock divider board, AWG: Arbitrary Waveform Generator, MLL: Mode Locked Laser (Pritel UAC), IM: Intensity Modulator, BC: Bias Controller, FSC: Free Space Coupling System, DCA: DC Coupled Cryo-amp b) How bits are transmitted in M=16 PPM modulation. An optical pulse is transmitted with a clock-referenced integer delay which encodes 4 bits of data. c) <span style="color: orange">XXXXXXXX</span>](./figs_03/fig_intro_2_light.svg){#fig:intro short-caption="PPM modulation and experiment setup" width=100%}

<!-- flip to rising edge pulse!!! -->

However, the photon number number dependent response of these detectors is shown to affect the time-correlated measurements needed for high-rate PPM. This response, shown in @Fig:waveform is also known as photon number resolution (PNR) -- a property that is desirable in certain applications including quantum communication and quantum computing. 
The SNSPD generates RF pulses with greater amplitude and slew rate when detecting optical pulses with multiple photons. Photon number effects manifest in this lower jitter variety of SNSPD due to the more efficient coupling of the nanowire to the readout circuit through the impedance matching tapers. It is likely that these effects will be present in other new SNSPD types engineered for low jitter, whether the PNR resolution is desired or not. 

As the PNR response affects the timing of fixed threashold timetaggs at any trigger level, it has a significant effect of the timing measurements used for the PPM demonstration. Any other applications illumnate these detectors with optical pulses of non-vanishing mean photon numbers will have to content with these effects as well. For this reason, we study the PNR response in detail and present two methods for managing it. We show how the photon number information can be deconvolved from the arrival time information, and how both de-correlated degrees of freedom can be measured simultaneously. This is applicable to certain types of high-rate quantum communication and computing systems. 

![**PNR-sensitive Pulse Waveform** The rising edge of the differential SNSPD's RF pulses exibit variations in height, slew rate, and arrival time due to photon-number dependent dynamics. The slopes of the 1-photon and 2-photon pulses significantly differ, and as the photon number increases, the alterations to the pulse shape become progressively smaller. Trigger levels A (8\ mV) and B (50\ mV) were used to extract as much information about pulse slope and arrival time as possible](./figs_03/waveform_light.svg){#fig:waveform short-caption="PNR-sensitive Pulse Waveform" width=80%}



## Detector Figure of Merit
The work here highlights the application of low jitter single-photon detectors for optical communication, which is impactful for deep-space optical communication as well as classical communication in quantum networks. Although single-photon counting is well estanblished for deep-space optical communication~\cite{Laser lunar, DSOC} so far it has not been ulitized in quantum networks, mainly due to the use of SFP modules and DWDMs. However, with the eachievement of high data rates recently achieved with photon-counting classical communication, these approaches can now be seriously considered for quantum networks. The main driver is would be the deduction of optical power in neighbouring DWDM channels, which ultimately lowers the Raman scattered photons into the quantum channel [@EraerdsRaman]
<span style="color:orange">Calculate reduction in power from state of the art SFP modules</span>

To access the applicability of different detectors, here we compare some of the recent near infrared detectors. 


A useful figure of merit that includes all of the revelant detector metrics for photon timing was introduced by Bronzi and co-authors [@Bronzi2016]

$$FoM_T = \frac{\eta  (1 - P_{ap})\Phi_{-3 \text{dB}}}{J} \sqrt{\frac{A}{D}},$$

where $\eta$ is the single photon detection efficiency, $\Phi_{-3 \text{dB}}$ is the photon flux at which the system detection efficiency drops by 3~dB, $P_{ap}$ is the afterpulsing probability, $J$ is the detector jitter evaluated as the FWHM, $T_d$ is the deadtime, $A$ is the active area and $D$ is the dark count rate. Here we have defined the maximum photon flux as the 3~dB point, for ease of standardization.

In this work:

 - Efficiency = 0.84
 - Afterpulsing = 0 \%
 - Jitter = 15 ps
 - Deadtime = 30 ns <span style="color:orange">measure 3dB flux</span>
 - Area = 330 $\mu m^2$
 - Dark count rate = 20\ Hz

$FoM_T = 7.58 \times 10^{12}$ at 1550 nm.


The deadtime is calculated as the 1/MCR, which is the 3 dB point of the nominal efficiency. This is only a factor of 3.7 less than the state of the art visible Silicon SPADs (peak efficiency at 480\ nm) [@Gramuglia2022]

In the future, the performance of the optical communication system could be improved by using, high count rate SNSPD arrays. Recently published high-count rate arrays have figures of merit of <span style="color:orange">$FoM_T$ for Peacoq and Resta2023 results</span>. This would result in a proportinal increase in the data rate.
<span style="color:orange">$FoM_T$ for fastest InGaAs/InP gated detector</span>
These devices are ideal for fiber-based optical communication. In free-space, the active area is especially important, whithout the use of an adaptive optics system.
<span style="color:orange">$FoM_T$ for DSOC array</span>

### Development of a modulation source

DSOC relies on modulation of a CW seed laser to generate the communication signal on the spacecraft. This signal is then amplified by an Erbium Doped Fiber Amplifier (EDFA) to increase its transmission power to Earth. As the EDFA amplifies the pre-generated pulses and uses most of the power of the spacecraft optical transmission system, power consumption scales with the number of optical pulses.

We produce our modulated singal by carving a series of mode locked laser pulses with lithium niobate modulators. This way, the jitter of the optical pulses themselves are not limited by the modulators or thew slew rate of the RF signal that drives them. 




Therefore, we chose to carve pulses from a mode-locked laser. This approach allows for extremely short pulses in time, with the modulators responsible for sufficiently reducing any surrounding unwanted pulses. The temporal width of the modulator pulse response must be extremely short and able to modulate from 'off' to 'on' within a time frame of the order of the 50 ps bin width.