# Time Walk and Jitter Correction

## Time-walk and jitter correction in SNSPDs at high count rates

<figure markdown>
<img  alt="sizzle_time_walk" src="figs/time_walk_image_light.svg#only-light" style="margin-left: auto; margin-right: auto; width: 70%; opacity: 0.5"/>
<img  alt="sizzle_time_walk" src="figs/time_walk_image_dark.svg#only-dark" style="margin-left: auto; margin-right: auto; width: 70%"/>
</figure>

<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![](./figs_02/pnr_and_pulses.png) -->
A version of this chapter is currently published as:

Andrew Mueller, Emma E. Wollman, Boris Korzh, Andrew D. Beyer, Lautaro Narvaez, Ryan Rogalin, Maria Spiropulu, Matthew D. Shaw; [Time-walk and jitter correction in SNSPDs at high count rates](https://pubs.aip.org/aip/apl/article/122/4/044001/2870246/Time-walk-and-jitter-correction-in-SNSPDs-at-high). Appl. Phys. Lett. 23 January 2023; 122 (4): 044001.

Portions of this chapter appear in:

Ioana Craiciu, Boris Korzh, Andrew D. Beyer, Andrew Mueller, Jason P. Allmaras, Lautaro Narváez, Maria Spiropulu, Bruce Bumble, Thomas Lehner, Emma E. Wollman, & Matthew D. Shaw (2023). [High-speed detection of 1550 nm single photons with superconducting nanowire detectors](https://opg.optica.org/optica/fulltext.cfm?uri=optica-10-2-183&id=525546). Optica, 10(2), 183–190.
## Abstract

     

Superconducting nanowire single-photon detectors (SNSPDs) are a leading detector type for time correlated single photon counting, especially in the near-infrared. When operated at high count rates, SNSPDs exhibit increased timing jitter caused by internal device properties and features of the RF amplification chain. Variations in RF pulse height and shape lead to variations in the latency of timing measurements. To compensate for this, we demonstrate a calibration method that correlates delays in detection events with the time elapsed between pulses. The increase in jitter at high rates can be largely canceled in software by applying corrections derived from the calibration process. We demonstrate our method with a single-pixel tungsten silicide SNSPD and show it decreases high count rate jitter. The technique is especially effective at removing a long tail that appears in the instrument response function at high count rates. At a count rate of 11.4 MCounts/s, we reduce the full width at 1% maximum level (FW1%M) by 45%. The method, therefore, enables certain quantum communication protocols that are rate-limited by the FW1%M metric to operate almost twice as fast.
