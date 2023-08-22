## Synchronization with a Software Phase Locked Loop (PLL)

**Todo**
*This will be the first place in the thesis that I introduce the use of my software based phase locked loop (PLL). The software PLL has been useful in several later projects. I will either fully explain the PLL here, or I will only introduce and motivate it here. And a full description will go in an appendix. *
1. For sending many PPM symbols, I needed a synchronization clock that was (A) always running, and (B) extremely low jitter. 
2. Sending an output from the AWG to the Swabian timetagger in another room resulted in a less-than-ideal clock source. The signal was low amplitude, and triggering on it's rising edge did not make for a very low jitter clock signal. 
3. I had some sense that that should be a way of 'averaging' past clock cycles in some way to cancel jitter. After some research and failed tests toward developing my own averaging method, I learned a software based Phase Locked Loop is just what I needed. 
4. Initial version was adapted from a Matlab code on the Phase Locked Loop wikipedia page. That code was written for a sampled sign wave, but I adapted to take in just one data point per period. For our non-coherent and time-resolved types of measurements with SNSPDs, we typically only have clocks of this type. Where the clock is expressed by some type of optical or RF pulse that arrives on a regular period. 
5. More recently Rahaf Youssef and I have worked on updating our software PLL tools so that its easier to understand and reason about, and easier to lock to a given signal. 