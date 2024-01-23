## Discussion

<!-- you need a conceptual understanding of what a given data grouping means.

Mutliple other groups have demonstrated the use of principle component analysis for photon number descrimination with SNSPDs. It's been shown it is handy for observing photon number when optical pulses always arrive at the same time with respect to a clock. 

At this time there isn't a clear path towards extending PCA to situations where photon arrival time and photon number are a priori unknown. 

We have shown that a photon number of few-photon optical pulses may be determined by measuring the slew rate or slope of the pulse -->

We have shown that measurement of the slew rate or slope of SNSPD RF pulses may be useful for both photon number and arrival time discrimination. This is a fairly practical method that limited assumptions about the underlying modulation pattern of the optical signal. We show it allows for the measurement of pulse position modulation signals based on 10 and 20 Ghz clocks for which each optical pulse contains anywhere from 1 to 5 or more photons. 

We also present a 2-dimensional Gaussian mixture model of the SNSPD response to the two trigger levels in an effort to model the available data as accurately and faithfully as possible. This may be used for photon number and arrival time discrimination as well. Assigning SNSPD detection events to photon number or PPM bins generalizes to assigning points in a 2-dimensional space to probability distributions built from Gaussian mixtures. We show the Gaussian mixture method moderately improves the accuracy of arrival time discrimination relative to the slope-based method. 

The full 2D treatment of photon number discrimination based on community detection of Gaussian mixture groups is undeniably more complex than principle component analysis methods demonstrated in previous research [@sauer2023resolving; @schapeler2023superconducting]. However, its generality may be advantageous for future SNSPD systems that gather added data about the transient state of the SNSPD and readout circuitry.  For example, more than two timing measurements from each SNSPD pulse may prove to be useful. Recent research has demonstrated that photon number information is present in the falling edge of the pulse [@sauer2023resolving; @schapeler2023superconducting], and, as shown here, timing measurements from two trigger levels on the rising edge are useful. Therefore, the use of three or more unique time-correlated measurements may be advantageous. Digitizing the RF pulse with a high speed ADC or oscilloscope extends this thinking to many more measurements. Ultimately, photon number discrimination becomes a higher dimensional problem, for which Gaussian mixture methods may outperform principle component analysis.

Finally, higher dimensional analysis may be necessary when pulse overlap or time walk effects [@Mueller2023] complicate the nuanced photon number response characteristics of each SNSPD pulse. This is important in future SNSPD systems that are designed to exhibit both high maximum count rates [@Craiciu23] and photon number resolution. 


<!-- Bro. The 5 paragraph essay structure is literally just two stories slapped on top of each other. One with short contenxt, one with longer context.  -->