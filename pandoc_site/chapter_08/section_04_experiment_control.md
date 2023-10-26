## Sequence Generator

The Sequence Generator repository is for generating AWG sequences that are synchronized with the Pritel OAC fast mode locked laser. This is needed for carving the mode locked laser signal with intensity modulators. This toolset was useful for my PPM project as well as a concurrent high rate QKD project with slightly different requirements.

The most important feature of this toolset is the ability to determine compatible AWG sample rates and sequence lengths for a given laser repetition rate, while imposing certain requirements, like that the AWG sequence length must be a multiple of 128 samples. The script supports situations where a small integer number of laser pulses does not math in time an integer number of AWG samples. The main requirement is that the time for the full AWG sequence to run must be an integer multiple of the laser repetition period, so that the AWG sequence can be repeated indefinitely without drifting out of sync with the laser.

The sections of code that undergo this analysis are located in the functions `determine_ppm_properties` and `determine_regular_properties` for the PPM and QKD applications respectively.

[Repository :fontawesome-brands-git-alt:](https://github.com/sansseriff/sequence_generator/tree/main){.md-button}

## 
