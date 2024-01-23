## Modulation extinction ratio

We use two modulators in series for this experiment in order to achieve a sufficiently high probability that a certain large number of pulses from the seed laser will be blocked without transmission of even a single photon. 

The extinction ratio of the modulator(s) needed is then a function of the number of pulses that must be blocked, and the number of photons per pulse. Say we want to keep the probability of single-photon leakage below 1% for 2047 successive pulses with mean photon number of 3. This would give an error rate per frame of 1% for the 2048-bin 20~GHz demonstration, if the correct pulse always fell into the last bin. We solve the equation $((1 - 10^{-ER/10})^{2047})^3 = 0.99$ for extinction ratio $ER$ and find it is approximately $58$~dB.

Since $\mu=3$ is at the upper range of the mean photon number we expect to use in this experiment, we opt for two 30~dB modulators in series for a total of 60~dB extinction ratio. PPM with M as high as 11 is unlikely to be practical for deep space communication due to these stringent extinction ratio requirements and the dramatic increase in frame length. However, we demonstrate them here to bring the word length on par with the single pixel detector dead time. Also, the demonstration shows that M above 8 (256 bins) is possible and perhaps a valid option for extremely high loss and power-starved scenarios. 

## Computing GMM intersection boundaries

The shape or boundary of the GMM-defined probability distributions is a curve made of x,y coordinates where one distribution is just as probable as a neighboring $i+1$ distribution. The boundary is an x,y projection of a 3d curve, which parametrizes the intersection of the 3d surface probability distributions. There are different approaches to computing such a curve including analytic methods and marching methods [@Bajaj1988; @Shankar1997]. With the boundaries defined, photon arrival time attribution becomes a point-in-polygon problem for which a computationally efficient algorithm could be developed. 

## Independent component analysis

![**Photon number discrimination from independent component analysis** Source data with axes defined from ICA. Projecting along the purple line (perpendicular to the larger black vector) produces a distribution of high Gaussianity. Whereas projecting along the red line (smaller vector) produces a distribution with high non-Gaussianity. b) Whitened feature space and it's projection (c) on the x-axis. ](./figs/ICA_component_analysis_light.svg){#fig:ica_pnr short-caption='Photon number discrimination from independent component analysis' width=100% path="chapter_04"}

We observe that the photon groupings may be most separable in a whitened feature space based on non-orthogonal vectors in the original feature space. For this reason, we use independent component analysis (ICA) instead of principal component analysis (PCA). 

Identifying photon number based on the ICA projection is likely just as effective as the GMM-based method described above. It can be used with the slope-based method for pulse arrival time attribution. The GMM-based method may just have certain advantages for more complex attribution problems that go beyond the scope of this work.


<!-- ## Synchronization with a Software Phase Locked Loop (PLL)

**Todo**
*This will be the first place in the thesis that I introduce the use of my software based phase locked loop (PLL). The software PLL has been useful in several later projects. I will either fully explain the PLL here, or I will only introduce and motivate it here. And a full description will go in an appendix. *
1. For sending many PPM symbols, I needed a synchronization clock that was (A) always running, and (B) extremely low jitter. 
2. Sending an output from the AWG to the Swabian timetagger in another room resulted in a less-than-ideal clock source. The signal was low amplitude, and triggering on it's rising edge did not make for a very low jitter clock signal. 
3. I had some sense that that should be a way of 'averaging' past clock cycles in some way to cancel jitter. After some research and failed tests toward developing my own averaging method, I learned a software based Phase Locked Loop is just what I needed. 
4. Initial version was adapted from a Matlab code on the Phase Locked Loop wikipedia page. That code was written for a sampled sign wave, but I adapted to take in just one data point per period. For our non-coherent and time-resolved types of measurements with SNSPDs, we typically only have clocks of this type. Where the clock is expressed by some type of optical or RF pulse that arrives on a regular period. 
5. More recently Rahaf Youssef and I have worked on updating our software PLL tools so that its easier to understand and reason about, and easier to lock to a given signal.  -->