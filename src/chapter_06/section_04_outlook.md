

Capabilities uncovered and lessons learned from the previous chapters of this thesis:
1. free space coupling in a cryostat isn't so bad
2. Time walk and PNR correction are necessary for high rate photon number resolving SNSPDs
3. These new capabilities should be implemented in such a way that they don't require much added complexity or seperate calibration efforts. Software that supports in-situ calibration and event-corruption management is key. 


Okay so there is precendent fro developing a system for high rate heralding of SPDC. This design could be adapted for QKD, a high rate single phton source, or for a heralded EPR/entanglement source. The high rate single photon source and EPR source ideas would be especially impactful. One of hte issues facing the developement of linear optics quantum computing is the lack of such high rate high purity single photon sources. There has been less research into high rate entanglement source, but I believe that this is a very promising direction for future reseach. The high rate entanglement distribution system we demonstrate, and all other such system, must operate at low $\mu$ in order to minimize the detrimental effect of multi-pair events on entanglement visibility. A heralded single-pair entanglement source would support drastically higher rates of entanglement distribution.

We discussed in the chapter 5 that the future of SPDC multiplexing may involve cavity coupled pair sources. With that, any DWDM filter serves just to separate out the different wavelengths and should not a source of much loss. That idea can be extended further, with other insights from the other chapters:


Here we present a model for a future SPDC & SNSPD system that supports high-rate heralding of a range of idler frequencies from a cavity-enhansed SPDC all onto a single SNSPD array. From the low dark count rate chapter, we observed the use of free space optics inside a cryostat isn't as finicky as one might expect. 
Given that, here we envison pumping an SPDC cystal in free space and then coupling one arm to an SNSD array, also in free-space. The idler arm is reflected off a diffraction grating, which separates different idler frequencies into different spatial modes imaged onto the SNSPD at different locations.   This makes for a compact system that should have excellent SPDC - detector coupling efficiency. All the lessons learned about high rate PNR heralding could be incorporated into this array, including time-walk correction as well as accurate simultaneous arrival time and photon number attribution. 

One open area of research is how to do both time-walk correction and the PNR attribution techniques simultaneously. This is important for soon to be deveoped high rate SNDD arrays with impedance matching tapers. These will support some degree of photn number reoslution purely by virtue of being made from multiple wires. But for excellent PNR, single-wire multi and single-photon event discrimination is necessary. For such arrays, operation at high count rates is most useful for high rate quantum networks. Therefore, single wires of hihg-rate arrays themselves will be operating at high count rates, and should support PNR attribution capability. 

The question of how to achieve the time-walk correction and PNR attribution simultaneously goes beyond the scope of this thesis. However as discussed in chapter 4, I believe that high-dimensional modelling of the the SNDPD response is useful for overcoming this challenge. Both multi-photon and singel-photn events will suffer from time-walk effects for SNSPD pulses that arrive soon after previous pulses. But graphing such data in a high dimensional space spanned by timing measurements from multliple trigger levels and the inter-pulse time $t'$ may show certain groupings of events thats can be distinguished across varied $t'$ as single and multi-photon events. This is a promising direction for future research.

SNSPD technology continues an ongoing trend of rapid improvement. This detector technology therefore is well positioned to dictate certain engineering features of emerging quantum communication and computing systems. Perhaps existing problems in quantum transduction and interconnects can be solved through the use of SNSPDs for high-rate high-efficiency bell state measurements. 

Standout quantum memories, for example, may function best when interfaced with low-bandwidth, low-rate channels at wavelengths that aren't well supported for long-hawl transmission.  This means there may be certain design choices for quantum repeaters and quantum computers that use bandwidth, and frequncy conversion processes to interfaces high rate wide-bandwidth transmission channels with large banks of quantum memories. High rate SNSPDs could be pivotal in such conversion systems, and help bring about a robust system for interconnects between diverse quantum systems.


