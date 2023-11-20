## Detector Figure of Merit
The work here highlights the application of low jitter single-photon detectors for optical communication, which is impactful for deep-space optical communication as well as classical communication in quantum networks. Although single-photon counting is well estanblished for deep-space optical communication~[@Srinivasan2023GroundReceiver] so far it has not been utilized in quantum networks, which have so far relied on off-the-shelf SFP modules and DWDMs. However, when quantum channels are frequency multiplexed with much higher power classical channels, Raman scattered photons from the classical channel pollute the quantum channel~[@EraerdsRaman]. 

Attenuating classical communication to near the single photon level would solve this issue and require minimal added resources, as single photon detectors are already required at quantum nodes. DSOC demonstrates a promising approach to low-power classical communication based on phon counting and PPM which can be adapted for terrestrial quantum networks. 

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

In the future, the performance of the optical communication system could be improved by using high count rate SNSPD arrays. Recently published high-count rate arrays have figures of merit of <span style="color:orange">$FoM_T$ for Peacoq and Resta2023 results</span>. This would result in a proportinal increase in the data rate.
<span style="color:orange">$FoM_T$ for fastest InGaAs/InP gated detector</span>
These devices are ideal for fiber-based optical communication. In free-space, the active area is especially important, whithout the use of an adaptive optics system.
<span style="color:orange">$FoM_T$ for DSOC array</span>