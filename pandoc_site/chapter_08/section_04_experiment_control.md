## Experiment and control software

### Sequence generator

The Sequence Generator repository is for generating AWG sequences that are synchronized with the Pritel OAC fast mode locked laser. This is needed for carving the mode locked laser signal with intensity modulators. This toolkit was useful for my PPM project as well as a concurrent high rate QKD project with slightly different requirements.

The most important feature of this codebase is the ability to determine compatible AWG sample rates and sequence lengths for a given laser repetition rate, while imposing certain requirements, like that the AWG sequence length must be a multiple of 128 samples. The script supports situations where a small integer number of laser pulses does not match in time with an integer number of AWG samples. The main requirement is that the time for the full AWG sequence to run must be an integer multiple of the laser repetition period, so that the AWG sequence can be repeated indefinitely without drifting out of sync with the laser.

This analysis is performed in the functions `determine_ppm_properties` and `determine_`-`regular_properties` for the PPM and QKD applications, respectively.

<a class="md-button" style="width: 30%; display: block; margin: auto; text-align: center;" href="https://github.com/sansseriff/sequence_generator/tree/main">Repository <span class="twemoji"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M439.55 236.05 244 40.45a28.87 28.87 0 0 0-40.81 0l-40.66 40.63 51.52 51.52c27.06-9.14 52.68 16.77 43.39 43.68l49.66 49.66c34.23-11.8 61.18 31 35.47 56.69-26.49 26.49-70.21-2.87-56-37.34L240.22 199v121.85c25.3 12.54 22.26 41.85 9.08 55a34.34 34.34 0 0 1-48.55 0c-17.57-17.6-11.07-46.91 11.25-56v-123c-20.8-8.51-24.6-30.74-18.64-45L142.57 101 8.45 235.14a28.86 28.86 0 0 0 0 40.81l195.61 195.6a28.86 28.86 0 0 0 40.8 0l194.69-194.69a28.86 28.86 0 0 0 0-40.81z"></path></svg></span></a>

### Time-walk correction

A repository of tools for performing time-walk calibration and correction on timetag data files. It is set up to use the binary format `.ttbin` from swabian timetaggers, but can be easily adapted to other formats.

<a class="md-button" style="width: 30%; display: block; margin: auto; text-align: center;" href="https://github.com/sansseriff/SNSPD-time-walk-and-jitter-correction">Repository <span class="twemoji"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M439.55 236.05 244 40.45a28.87 28.87 0 0 0-40.81 0l-40.66 40.63 51.52 51.52c27.06-9.14 52.68 16.77 43.39 43.68l49.66 49.66c34.23-11.8 61.18 31 35.47 56.69-26.49 26.49-70.21-2.87-56-37.34L240.22 199v121.85c25.3 12.54 22.26 41.85 9.08 55a34.34 34.34 0 0 1-48.55 0c-17.57-17.6-11.07-46.91 11.25-56v-123c-20.8-8.51-24.6-30.74-18.64-45L142.57 101 8.45 235.14a28.86 28.86 0 0 0 0 40.81l195.61 195.6a28.86 28.86 0 0 0 40.8 0l194.69-194.69a28.86 28.86 0 0 0 0-40.81z"></path></svg></span></a>

### Bias controll user interface

A web-based user interfaces for controlling isolated voltage sources used for SNSPD biasing. Is is an improvement over a previous web interface which is based on the [svelte frontend framework](https://svelte.dev/) and should be much easier to maintain and extend than the [previous web interface](https://github.com/sansseriff/Isolated_Vsource).

<a class="md-button" style="width: 30%; display: block; margin: auto; text-align: center;" href="https://github.com/sansseriff/snspd-bias-controll-svelte">Repository <span class="twemoji"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M439.55 236.05 244 40.45a28.87 28.87 0 0 0-40.81 0l-40.66 40.63 51.52 51.52c27.06-9.14 52.68 16.77 43.39 43.68l49.66 49.66c34.23-11.8 61.18 31 35.47 56.69-26.49 26.49-70.21-2.87-56-37.34L240.22 199v121.85c25.3 12.54 22.26 41.85 9.08 55a34.34 34.34 0 0 1-48.55 0c-17.57-17.6-11.07-46.91 11.25-56v-123c-20.8-8.51-24.6-30.74-18.64-45L142.57 101 8.45 235.14a28.86 28.86 0 0 0 0 40.81l195.61 195.6a28.86 28.86 0 0 0 40.8 0l194.69-194.69a28.86 28.86 0 0 0 0-40.81z"></path></svg></span></a>

### Entanglement analysis repositories

This master repository contains submodules for all the repositories used for analyzing data from the high-rate entanglement distribution system. It includes a script for automatically populating each repository with the original raw data stored or figshare.

<a class="md-button" style="width: 30%; display: block; margin: auto; text-align: center;" href="https://github.com/sansseriff/highrate_origin">Repository <span class="twemoji"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M439.55 236.05 244 40.45a28.87 28.87 0 0 0-40.81 0l-40.66 40.63 51.52 51.52c27.06-9.14 52.68 16.77 43.39 43.68l49.66 49.66c34.23-11.8 61.18 31 35.47 56.69-26.49 26.49-70.21-2.87-56-37.34L240.22 199v121.85c25.3 12.54 22.26 41.85 9.08 55a34.34 34.34 0 0 1-48.55 0c-17.57-17.6-11.07-46.91 11.25-56v-123c-20.8-8.51-24.6-30.74-18.64-45L142.57 101 8.45 235.14a28.86 28.86 0 0 0 0 40.81l195.61 195.6a28.86 28.86 0 0 0 40.8 0l194.69-194.69a28.86 28.86 0 0 0 0-40.81z"></path></svg></span></a>

### Entanglement control software

Based on an example file shipped with the swabian timetagger, this leverages the swabian python api for collecting entanglement data for the high-rate entanglement distribution system. It incorporates an innovative method for defining long running measurements based on a construct called `Actions`. `Actions` are objects that perform some operation at one stage in the script’s main event loop (e.g., change an interferometer voltage to a specific value), or over multiple event loop iterations (e.g., integrate coincidences). Actions may also contain and run other actions, so that successively more complex measurements can be built from simple reusable components. This is done through an `evaluate` method that all `Action` methods share. The base class for all actions is located in `measurements/measurement`-`_management.py`. When a complex measurement is finished, a highly nested construct of actions may export its internal data to a `.json` file. The high-rate experiment [analysis repositories](https://github.com/sansseriff/highrate_origin) start with loading and analyzing these `.json` files.

<a class="md-button" style="width: 30%; display: block; margin: auto; text-align: center;" href="https://github.com/sansseriff/swabian_entanglement_gui">Repository <span class="twemoji"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M439.55 236.05 244 40.45a28.87 28.87 0 0 0-40.81 0l-40.66 40.63 51.52 51.52c27.06-9.14 52.68 16.77 43.39 43.68l49.66 49.66c34.23-11.8 61.18 31 35.47 56.69-26.49 26.49-70.21-2.87-56-37.34L240.22 199v121.85c25.3 12.54 22.26 41.85 9.08 55a34.34 34.34 0 0 1-48.55 0c-17.57-17.6-11.07-46.91 11.25-56v-123c-20.8-8.51-24.6-30.74-18.64-45L142.57 101 8.45 235.14a28.86 28.86 0 0 0 0 40.81l195.61 195.6a28.86 28.86 0 0 0 40.8 0l194.69-194.69a28.86 28.86 0 0 0 0-40.81z"></path></svg></span></a>

### Dark count rate through filters simulation

Based on the known lens f-number, aperture size, detector size, and filter transmissions for the dark count minimization project, the rate of dark counts due to transmitted blackbody photons can be estimated. With this simulation we determined that 4 thick custom short-pass filters, and one bandpass filter were ideal for our experiment.

<a class="md-button" style="width: 30%; display: block; margin: auto; text-align: center;" href="https://github.com/sansseriff/dark_count_simulation">Repository <span class="twemoji"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M439.55 236.05 244 40.45a28.87 28.87 0 0 0-40.81 0l-40.66 40.63 51.52 51.52c27.06-9.14 52.68 16.77 43.39 43.68l49.66 49.66c34.23-11.8 61.18 31 35.47 56.69-26.49 26.49-70.21-2.87-56-37.34L240.22 199v121.85c25.3 12.54 22.26 41.85 9.08 55a34.34 34.34 0 0 1-48.55 0c-17.57-17.6-11.07-46.91 11.25-56v-123c-20.8-8.51-24.6-30.74-18.64-45L142.57 101 8.45 235.14a28.86 28.86 0 0 0 0 40.81l195.61 195.6a28.86 28.86 0 0 0 40.8 0l194.69-194.69a28.86 28.86 0 0 0 0-40.81z"></path></svg></span></a>
