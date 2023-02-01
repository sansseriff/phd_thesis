## Abstract 
Entangled photons are a crucial component in the development of quantum information processing and secure quantum communications. Previous studies have demonstrated high-rate entanglement distribution, which is crucial for the implementation of future quantum networks and entanglement-based quantum key distribution (QKD). In this study, we focus on time-bin based entanglement distribution, which is ideal for fiber-based communication and does not require precise polarization tracking. Furthermore, time-bin implementations have potential for use in feed-forward protocols and larger quantum networks that require indistinguishable entangled photons. 

Past entanglement distribution systems have faced limitations such as low coupling efficiencies from bright sources and limited count rate detectors. In this article, we present a multiplexed entanglement distribution experiment that resolves these limitations by running at a high repetition rate, and by reading out energy-time entangled pairs using wavelength multiplexing. This allows for distribution of several high-fidelity channels of entangled photons through the same fiber which together make for a high-throughput system. 

\section{System}
Figure 1a shows the experiment setup. Pulses from a mode locked laser (Pritel UOC) with a center wavelength at 1540 nm and operating at 4 GHz are sent through an 80 ps delay Michelson interferometer. This generates pairs of pulses separated by 80 ps for each pulse of the laser.

The signal is then sent into a Second Harmonic Generation (SHG) and Erbium Doped Fiber Amplifier (EDFA) unit manufactured by Pritel. The upconverted light from the SHG goes into a type-0 SPDC crystal (cohesion). As a result, entangled states of the following form are created:

$$|\psi\rangle=\frac{1}{\sqrt{2}}\left(|1\rangle_{s}|1\rangle_{i}+e^{i \phi}|2\rangle_{s}|2\rangle_{i}\right)$$

The entangled pairs are separated by a Coarse Wavelength Division Multiplexer and sent to the two receiving stations labeled Alice and Bob. Readout interferometers at Alice and Bob, also with 80 ps delay, transform the state of the entangled pair. The operation of these interferometers may be expressed as:

$$|k\rangle \rightarrow \frac{1}{2}\left(|k\rangle_{A+}+e^{i \phi_{s / i} \mid}|k+1\rangle_{A+}+i|k\rangle_{A-}-i e^{i \phi_{s / i}}|k+1\rangle_{A-}\right)$$

Applying the readout interferometer operation on the original entangled state yields a 24 term expression.Four of these have this form, with amplitude dependent on the phase relationship between the interferometers:

$$p\left(e^{i \phi}+e^{i\left(\phi_s+q\phi_i\right)}\right)|2\rangle_{Au}|2\rangle_{Bv} $$

Where $p, q, u, v \in \{\{+1,+1, +, +\}, \{i,-1, +, -\}, \{i,-1, -, +\}, \{-1,+1, -, -\}\}$ for the four terms, and $\{+, -\}$ denote the output ports of Alice and Bob's interferometers. The interferometer outputs are sent into Dense Wavelength Division Multiplexers (DWDMs). We pair up output channels from these from Alice and Bob that obey the energy matching condition implied by the SPDC downconversion. This results in wavelength division multiplexing with high entanglement fidelity and high total coincidence rates.

The outputs of Alice and Bob's interferometers are sent to differential readout Niobium Nitride Superconducting Nanowire Single Photon Detectors (SNSPDs). These measure the arrival time of photons with respect to a clock signal derived from the mode locked laser. We use two SNSPDs for this demonstration, but a full implementation of this system that achieves the highest total entanglement rates would require 8-16 detectors operating in parallel at both Alice and Bob. Depending on the intended use of the system, reading out both outputs of the readout interferometers would increase rates as well.

Signals from the SNSPDs are read out with a free running time tagger (Swabian) and processed with custom software. The periods of the original laser are about 250 ps, and the three peaks from the source and readout interferometers are clearly visible as shown in figure 1a. 