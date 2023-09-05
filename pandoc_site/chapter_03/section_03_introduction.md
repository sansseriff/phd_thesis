## Introduction

[ The following is very rough, taken from years ago when I first started writing the manuscript ]{color="green" markdown=""}

<div>

This is my div

</div>

[ **Answer:** ]{.blue markdown=""}

This study aimed to evaluate the feasibility of transmitting high clock-rate pulse position modulated (PPM) data using a mode-locked laser and receiving it with a low jitter superconducting nanowire single-photon detector (SNSPD). The investigation was driven by recent advancements in NbN SNSPDs, which have achieved a jitter as low as 50 ps at the FW(1/100)M level, enabling the demonstration of PPM with 50 ps slot widths and a 20 GHz clock. The aim was to increase the data rate by a factor of 10, from 2 GHz to 20 GHz, in the next generation of the Deep Space Optical Communication (DSOC) project.

During the course of this study, the focus shifted towards investigating the impact of photon number resolution (PNR) on the low jitter detection of optical pulses. PNR can have an unintended impact on the demonstration of high-rate PPM, and therefore a thorough study of its effects was deemed crucial. A novel PNR cancellation technique was developed and applied to successfully demonstrate high-rate PPM. This technique is considered essential for future low-jitter applications of SNSPDs that exhibit photon-number effects.

This study aimed to evaluate the feasibility of transmitting high clock-rate pulse position modulated (PPM) data using a mode-locked laser and receiving it with a low jitter superconducting nanowire single-photon detector (SNSPD). The investigation was driven by recent advancements in NbN SNSPDs, which have achieved a jitter as low as 50 ps at the FW(1/100)M level, enabling the demonstration of PPM with 50 ps slot widths and a 20 GHz clock. The aim was to increase the data rate by a factor of 10, from 2 GHz to 20 GHz, in the next generation of the Deep Space Optical Communication (DSOC) project.

During the course of this study, the focus shifted towards investigating the impact of photon number resolution (PNR) on the low jitter detection of optical pulses. PNR can have an unintended impact on the demonstration of high-rate PPM, and therefore a thorough study of its effects was deemed crucial. A novel PNR cancellation technique was developed and applied to successfully demonstrate high-rate PPM. This technique is considered essential for future low-jitter applications of SNSPDs that exhibit photon-number effects.

### Pulse Position Modulation for Deep Space Communication

Deep Space Optical Communication has been a growing field of study in recent years, as researchers look for ways to communicate with spacecraft that are far away from Earth. In this article, we will focus on the use of Pulse Position Modulation (PPM) for deep space optical communication.

While other modulation techniques such as quadrature amplitude modulation (QAM) have been used in the past, it has been shown that in the photon-starved regime, PPM is the best approach for sending data. This is because there is not enough light to measure the phase of the signal.

PPM relies on sending one optical pulse carrying M bits of information in one of $2^M$ possible time slots. For M = 2, this corresponds to sending an early pulse to represent a 0 bit and a late pulse to represent a 1 bit.

The main challenge in deep space optical communication is the high loss and distance that the link must traverse. This limits the communication from the spacecraft, as it is limited by the power available on the spacecraft. This means that the communication protocol is limited by the number of bits that can be sent per unit of energy on the spacecraft, also known as photon information efficiency or bits per photon.

For large M, PPM achieves high photon information efficiency, allowing for the saving of power on the spacecraft and the sending of more information with fewer photons. The existing deep space optical communication project uses M up to $2^8 = 256$, meaning that 8 bits of data are carried in each optical pulse.

In this project, we aimed to demonstrate even higher photon information efficiency by using M values up to 2048, or 11 bits of data per optical pulse.

While the use of large M values increases photon information efficiency, it also decreases the data rate of the system. This is because the number of time bins needed per optical pulse scales exponentially with the amount of data in each pulse. Therefore, for a given fixed clock rate and time bin duration, the data rate decreases dramatically for higher M values.

Using M values much larger than 11 is unlikely to be practical in future deep space optical communication systems. However, the data rate of these systems can be increased linearly by increasing the clock rate or bin size of the experiment. This is possible with the use of low jitter detection systems or low jitter superconducting nanowire single-photon detectors (SNSPDs).

### Development of a modulation source

The communication signal on a spacecraft is generated by utilizing a Continuous Wave (CW) seed laser that is carved by a fast intensity modulator. The resulting low-power pulsed signal is then amplified by an Erbium Doped Fiber Amplifier (EDFA) to increase its transmission power to Earth. The majority of the power used by the spacecraft for communication scales with the number of optical pulses due to the EDFA.

In our experiment, the 20 GHz repetition rate was limited by the jitter of the Single-Photon Detectors (SNSPDs) that we intended to use. These detectors have a Full Width at Half Maximum (FW(1/100)M) jitter of approximately 50 ps. To ensure that the response function of the entire experiment had jitter of around 50 ps FW(1/100)M, we needed to build a Pulsed Phase Modulation (PPM) source with ultra-short optical pulses.

Carving a CW laser with our system would have introduced excessive timing uncertainty due to the limited ability of even the fastest lithium niobate intensity modulators to carve pulses with widths below 20 ps. The added jitter from modulated CW pulses, combined with the jitter of the detectors, would have exceeded the 20 GHz/50 ps slot width requirement.

Therefore, we chose to carve pulses from a mode-locked laser. This approach allows for extremely short pulses in time, with the modulators responsible for sufficiently reducing any surrounding unwanted pulses. The temporal width of the modulator pulse response must be extremely short and able to modulate from ‘off’ to ‘on’ within a time frame of the order of the 50 ps bin width.
