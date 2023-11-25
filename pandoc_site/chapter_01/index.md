# Introduction

<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![](./figs_04/high_rate_entanglement.svg) -->

<figure markdown>
<img  alt="snspdd" src="figs/snspdd_light.svg#only-light" style="margin-left: auto; margin-right: auto; width: 30%; opacity: 0.5"/>
<img  alt="snspdd" src="figs/snspdd_dark.svg#only-dark" style="margin-left: auto; margin-right: auto; width: 30%"/>
</figure>

## Abstract 

The Superconducting Nanowire Single-Photon Detector (SNSPD) is a type of high performance time-correlated photon counting detector. Usually operated at just a few degrees above absolute zero, they are made from a current biased meandered nanowire which partially transitions between a superconducting and resistive state when a photon is absorbed. This transition causes a voltage pulse to be generated across the nanowire, which is then amplified and time-tagged, giving an accurate measurement of photon arrival time. 

SNSPDs, originally developed in the 1990s [@Goltsman1996Picosecond], have been used in a wide variety of applications from deep space optical communication, to LIDAR and quantum communication [@natarajan2012superconducting; @yamashita2017recent]. These are now mature devices, some available commercially and others under continued development at national labs and universities. Much of the ongoing research into SNSPDs is centered around leveraging the device physics of the superconducting material to achieve higher performance across a number of metrics including efficiency, jitter, and count rate. However, highly effective use of more recently established SNSPD designs is not trivial [@Colangelo2023],  owing to their more complex design and readout architecture. There is still much to learn about leveraging these detectors to their full potential.

This thesis explores special optical coupling, data processing, and calibration methods to improve the performance of novel — but no longer experimental — SNSPD designs. In the process, some techniques learned from previous projects are applied to subsequent projects in an iterative fashion. Also, we arrive at certain conclusions that are broadly applicable to superior SNSPD readout for the foreseeable future, even as the complexity of these devices continues to increase. Finally, we demonstrate an entanglement distribution system that leverages the best characteristics these detectors have to offer. 
