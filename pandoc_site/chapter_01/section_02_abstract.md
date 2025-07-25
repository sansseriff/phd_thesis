<!-- <figure markdown>
<img  alt="snspdd" src="figs/snspdd_light.svg#only-light" style="margin-left: auto; margin-right: auto; width: 30%; opacity: 0.5"/>
<img  alt="snspdd" src="figs/snspdd_dark.svg#only-dark" style="margin-left: auto; margin-right: auto; width: 30%"/>
</figure> -->

## Abstract

Superconducting Nanowire Single-Photon Detectors (SNSPDs) are a type of high-performance time-correlated photon counting detector. Usually operated just a few degrees above absolute zero, they are made from a current-biased and often meandering nanowire that partially transitions between a superconducting and resistive state when a photon is absorbed. This produces a voltage pulse, which is amplified and time-tagged, providing an accurate measurement of the photon arrival time.

SNSPDs, first demonstrated in the 1990s [@Goltsman1996Picosecond], are now mature devices widely used in fields ranging from deep space optical communication to biological imaging, and quantum communication & computation [@natarajan2012superconducting; @yamashita2017recent]. They are available commercially and are under continued development at national labs and universities. Much of the ongoing research into SNSPDs is centered around leveraging the device physics of the superconducting material to achieve higher performance across a number of metrics including efficiency, jitter, and count rate. However, getting the best performance out of both novel and more conventional SNSPD designs is not trivial. This thesis explores techniques for improving count rate, dark count rate, timing resolution, and photon number resolution of both emerging and more established types of SNSPDs.

We first show a novel optical filtering technique can minimize the dark count rate of an SNSPD. Although geared towards applications that employ free space coupling, this work also demonstrates a dark count rate lower than the state of the art for fiber-coupled SNSPDs.

We then study the dynamics that usually limit the maximum count rate of SNSPDs in application, namely the advent of bias-current reset and pileup-induced distortions that degrade timing resolution. Through a calibration and in-situ software correction procedure, we show that high count rate jitter can be reduced by a factor or 2 or more without the need for additional hardware or offline processing. This technique has wide applicability to many SNSPD systems that would benefit from the ability to run at higher count rates without sacrificing timing resolution.

SNSPDs are used in the ground receiver for NASA's Deep Space Optical Communication (DSOC) project, which demonstrates high-rate optical communication with the Psyche spacecraft through a Pulse Position Modulation (PPM) scheme~[@Srinivasan2023GroundReceiver]. We demonstrate SNSPD detection of a comparable PPM protocol operating 10 times faster than DSOC, and develop a novel method for resolving and correcting the presence of photon-number dependent effects in SNSPDs.

In our final demonstration, we leverage the strengths of novel low-jitter SNSPDs~[@Colangelo2023] in a high-rate entanglement distribution system based on a fast mode-locked laser. We show these detectors enable the use of highly stable and compact interferometers as well as readily available telecom multiplexing equipment. We demonstrate entanglement visibilities up to 99.4%, distillable entanglement rate of up to 3.55 MHz across 8 frequency channels, and predict a straightforward path towards achieving an order of magnitude improvement in rates without compromising visibility.

This thesis aims to uncover and demonstrate the best performance that can be obtained from both novel and more conventional SNSPDs. As we mainly study how to optimize the use and application of these devices—as opposed to the device physics or development of new SNSPDs—the content of this thesis has broad applicability to all users of this single photon detecting technology.
