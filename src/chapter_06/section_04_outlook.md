## Outlook

To recapitulate the insights derived from the previous chapters, three principal points stand out:
1. With proper mounting and thermalisation techniques, the use of free space optical components inside a cryostat is not prohibitively challenging. 
2. Time walk and PNR correction will likely be necessary for high count rate photon number resolving SNSPDs
3. The new capabilities, as discussed, should be incorporated into a design that does not necessitate substantial complication or discrete calibration endeavors. The key is to develop software supportive of in-situ calibration and event-corruption management.

Our findings can be leveraged in the development of future high-rate heralded SPDC sources. In this context, we see a particular design for such a source, as shown in @fig:final_setup, to be particularly promising.

![**Proposed multiplexed SPDC heralding system** A design for high efficiency heralding of SPDC. A diffraction grating separates spectral modes out of the cavity enhanced SPDC into spatial modes, which are focused onto an SNSPD array in different locations. The idler-arm fiber coupling stands in for whatever type of output coupling is required for the application. ](./figs/final_setup_light.png){#fig:final_setup short-caption='Proposed multiplexed SPDC heralding system' width=78% path="chapter_06"}

We propose a design for a future SPDC & SNSPD system that supports high-rate heralding of a range of idler frequencies from a cavity-enhanced SPDC all onto a single SNSPD array. We envision pumping the pair generating crystal in free space and then coupling one arm to an SNSPD array, also in free-space, with the whole setup located inside a cryostat with the detector. 

The signal arm is reflected off a diffraction grating, which separates different signal frequencies into different spatial modes imaged onto the SNSPD.   This makes for a compact system that should have excellent SPDC - detector coupling efficiency. All the lessons learned about high rate PNR heralding could be incorporated into this array, including time-walk correction as well as accurate simultaneous arrival time and photon number attribution. 

This design could be adapted for use in entanglement-based QKD, for a high-rate single photon source [@MeyerScott2020Single; @MeyerScott2017; @Andreas:12], as part of a heralded EPR/entanglement source [@barz2010heralded; @barz2010heralded], or for preparation of non-Gaussian states [@Walschaers2021; @AsavanantBook; @Walschaers2021]. For heralded single photon and entangled pair sources, the spectral multiplexed herald design supports certain methods for increasing output rates without sacrificing state purity [@Hiemstra2020, @Grimau2017Heralded]. One of the issues facing the development of linear optics quantum computing is the lack of such high-rate high purity sources of non-Gaussian states of light, such a single-photon states. Heralded sources of entanglement are related, and these is a promising path towards demonstrating these at high rate. This is needed because the entanglement distribution system from chapter 5, and all other such systems, must operate at low pump power and low mean photon number $\mu$ in order to minimize the detrimental effects of SPDC multi-pair events on entanglement visibility. A heralded single-pair entanglement source would support drastically higher pair generation rates. 

<!-- <span class="html">(1)</span><span class="latex">\footnote{see appendix section \ref{here} for a review of a particular spectral multiplexing idea that we began pursuing during COVID, and may be further developed by other students in the future. </span>.<span class="html_lineskip">{ .annotate }</span>

```{=html}

1.  See [this appendix section](../chapter_10/thing) for a review of a particular spectral multiplexing idea that we began pursuing during COVID, and may be further developed by other students in the future.

``` -->

<!-- We discussed in the last chapter how cavity enhanced SPDC emission is promising for overcoming some of the limitations of the high-rate entanglement source. With this, any DWDM filter serves just to separate out the different wavelengths and should not a source of much loss. That idea can be extended further, with other insights from the other chapters: -->

One open question is how to apply both the time-walk correction and the PNR attribution techniques simultaneously. This is important for in-development high-rate SNSPD arrays, successors to the PEACOQ [@Craiciu23], which incorporate impedance matching tapers. These will support some degree of photon number resolution simply by spreading out the optical mode over multiple nanowires. But for excellent PNR, single-wire multi and single-photon event discrimination is necessary. For such arrays that must operate at very high rates for emerging quantum networking applications, single wires must support PNR attribution at high count rates as well. 

The development of a method for time-walk correction and simultaneous PNR attribution goes beyond the scope of this thesis. However, as discussed in chapter 4, we believe that high-dimensional modelling of the the SNDPD response is useful for overcoming this challenge. Both multi-photon and single-photon events will suffer from time-walk effects for SNSPD pulses that arrive soon after previous pulses. But graphing such data in a high dimensional space spanned by timing measurements from multiple trigger levels and the inter-pulse time $t'$ may show seperated $|1\rangle$ and $|2+\rangle$ event groups.  This is a promising direction for future research.

SNSPD technology continues an ongoing trend of rapid improvement. This detector technology therefore is well positioned to dictate certain engineering features of emerging quantum communication and computing systems. Perhaps existing problems in quantum transduction and interconnects can be solved through the use of SNSPDs for high-rate high-efficiency bell state measurements. 

Certain types of quantum memories, for example, function best when interfaced with low-bandwidth, low-rate channels at wavelengths that aren't well supported for long-haul transmission through fiber.  This means there may be certain design choices for quantum repeaters and quantum computers that use bandwidth, and frequency conversion processes to interfaces high rate wide-bandwidth transmission channels with large banks of quantum memories. High rate SNSPDs could be pivotal in such conversion systems, and help bring about a robust system of interconnects between diverse quantum systems.


