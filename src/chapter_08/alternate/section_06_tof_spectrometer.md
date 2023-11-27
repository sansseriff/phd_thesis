## Time-of-flight Spectrometer for SPDC Frequency Heralding

Dispersion can be used to create a ‘time of flight’ spectrometer to measure the frequency of heralded idler photons from an SPDC crystal. Using this kind of spectrometer for characterization of SPDC emission has been done, notably by Gerrits at NIST. 

This kind of spectrometer could replace the discrete frequency splitting methods used previously for frequency multiplexing single photon sources, like the diffraction gratings and multiple SNSPDs of the Tittel paper or the reflecting bragg grating of the Gaeta paper. Both of these approaches require multiple detectors and so involve more complexity. 

Superficially it seems that the time-of-flight spectrometer method would limit the protocol by its maximum count rate. Although it would allow for many frequency bins to be detectable, it might only accommodate a mean photon number per pulse rate over all bins that is comparable to a simple heralding detector with no multiplexing. 

The idea seems more promising when considering how the time-of-flight spectrometer might function in the presence of a high mean photon number per pulse: 

**figure**

Consider a SPDC pumped hard enough so that some pulses have two (or even more) idler photons sent to the TOF spectrometer. That means the time-domain spectrum produced at the detector by the dispersive element will have one or more photons in it, as shown in the figure with photons circled 1 and 2. Each of these corresponds to some frequency identifiable from their time delay induced by dispersion. Since the frequency multiplexing essentially forms many frequency bins, the mean photon number per bin is still very low despite the high pump power. 
 Say the dispersion is such that idler photon 1 is higher frequency. If efficiency of SNSPD is high, it will detect the first photon that comes in, photon 1. The presence of photon 2 may make a weird shaped pulse because the two photons arrive within quick succession, faster than the relax time of the detector. But only the fast rising edge caused by the first photon matters. Because with that, the frequency of that first idler photon is determined and the frequency shifting ramped phase modulator can be adjusted accordingly to tailor the corresponding signal photon to the correct frequency. The other signal photon in the pulse will also be frequency shifted. But if following the phase modulator you have a narrowband filter centered around the frequency you are shifting all heralded single photons to, then the only photon that will go through is the signal of idler 1. The signal photon corresponding to idler 2 will be shifted out of band and be filtered out. 

So the TOF spectrometer has this PNR-like capability where it can ignore the presence of extra photons in the pulse once it gets information about a single idler that it can use. 

### Dispersion, Bin Number, and Frequency Shifting Limits:

If one could achieve arbitrarily strong dispersion of the idler photons, then the natural choice would be to spread the SPDC pulse over several nanoseconds. With current low jitter SNSPD and TCSPC card, we may determine photon arrival over a time window of about 10ns with 14ps FWHM precision. If the precision of the frequency splitting was comparable to the jitter of the SNSPD, then one could in principle have hundreds of discernible frequency bins. However, other practical limits in the protocol make things more complicated. 


### Choice of Pump Bandwidth
The use of a TOF spectrometer for the identification of idler frequencies in conjunction with the choice of SPDC pump bandwidth presents an interesting tradeoff (The following assumes an SPDC crystal with a phase matching bandwidth significantly larger than the bandwidth of the pump laser and an ‘ideal’ anticorrelated JSA like in figure 2). 

Consider pumping with very short pulses, for example 2ps. Fast pulses like this in conjunction with a dispersive medium would seem to work well with low jitter snspds in a TOF spectrometer. This is because the minimum width of discernible frequency bins in the resulting time domain spectrum is limited by the pump pulse width, as the effect of the dispersion is a convolution like smearing of the idler pulse. The lower the pulse width of the laser, the smaller the frequency bins may be and the more may be packed into a certain time window defined by the TDC hardware of the TOF spectrometer. Therefore, a shorter pump pulse width allows for more precise frequency measurement of heralded idler photons. 

However, the high precision of idler frequency discernable with this fast pump pulse may not actually be useful in a high rate single photon source for the following reason. The 2ps pump pulse, if produced by a near-transform limited mode locked laser, would have a bandwidth of about 1.4nm (185GHz). This means there is 185GHz of uncertainty in the frequency of the corresponding signal photon. The single photon source could use a bandpass filter with a comparable bandwidth on the output, but this may allow noise photons to make it out of the source also. The filter bandwidth could be decreased to constrain the single photon output more strongly, but this would clearly lower the overall generation rate. 

A much slower pump pulse width could be chosen also, but in this regime the width of time-domain frequency bins in the TOF spectrometer are limited by this pulsewidth. A low jitter snspd would not even be required in this case. However, for the slower pump pulse, the pump bandwidth is tighter, thereby better specifying the frequency of a signal photon given the frequency of the idler is well determined. 

It is instructive to understand both extremes, and how the engineering limitations of the SPDC crystal and ramped phase modulator work into these prely physics based limitations. 
