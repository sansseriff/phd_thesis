### Performance Regime of the Tungsten Silicide detector

When our calibration and correction method is applied to the Tungsten Silicide SNSPD, the walk-cancellation method primarily corrects for pulse height variations. These variations are caused by varying levels of bias current in the device at the time of photo-detection. An oscilloscope trace shows an exponentially decaying increase in SNSPD pulse height following a previous detection. This exponential recovery shape reinforces evidence that this detector operates in this ‘bias current recovery’ regime, rather than the regime where amplifier reset dynamics dominate.

<figure markdown> 
    <a name='fig:rise_exp'></a> 
    <img alt="fig:rise_exp" style="width: 100%; margin: auto;" src="../figs_02/rise_exp_light.svg#only-light" >
    <img alt="fig:rise_exp" style="width: 100%; margin: auto;" src="../figs_02/rise_exp_dark.svg#only-dark" > 
    <figcaption markdown> Figure 1: **WSi detector pulse recovery** Sweep of trigger levels for pulse rising edges after a previous pulse (not shown). This is similar to a scope trace in overlay false color mode. The detector is illuminated by a 537.5 MHz pulse train.</figcaption>
    </figure>

??? note
    This is a real scope trace that shows the same inverted exponential recovery effect:

    ![thing1](./figs_02/ringdown_scope_light.png#only-light)
    ![thing2](../figs_02/ringdown_scope_dark.png#only-dark)

### Software dead time for high count rate jitter suppression

In certain cases a software-based dead time is an effective way of reducing jitter at high count rates. SNSPD pulses that arrive soon after a previous pulse are ignored because their timing is assumed to be corrupted due to pulse distortions (Fig. \ref{fig:dead_time}a). With a long software-based dead time, data is filtered to keep only events for which the SNSPD was in a fully reset state prior to detection. This results in low jitter measurements even at high rate as shown in Fig. \ref{fig:dead_time}d where the dashed and solid (red, orange) lines are response functions of unfiltered and filtered data respectively. However, the use of software-based dead times can severely limit usable count rate. This paradoxically contrasts with the main intended goal, which is to operate an SNSPD at the highest possible count rates. As shown in the Fig. 3b, adding a 100 ns software dead time to our WSi single pixel SNSPD limits its usable maximum count rate to about 4 MHz, while the raw count rate exceeds 10 MHz. Furthermore, the usable count rate drops to zero for higher incident photon rates, as the dead time starts to reject most events. This behavior can be unexpected and problematic for any applications that occasionally over-saturate the detector.

<figure markdown> 
    <a name='fig:dead_time'></a> 
    <img alt="fig:dead_time" style="width: 80%; margin: auto;" src="../figs_02/cut_count_rate_v2_light.svg#only-light" >
    <img alt="fig:dead_time" style="width: 80%; margin: auto;" src="../figs_02/cut_count_rate_v2_dark.svg#only-dark" > 
    <figcaption markdown> Figure 2: **Removing time walk with dead time** a) Illustration of the RF signal out of an SNSPD with red highlighted regions signifying a software-based dead time that rejects some events. b) Count rate vs normalized efficiency, similar to the curve in green in [the jitter metrics figure](section_04_method.md#fig:jitterate_results_2). (c) & (d) Response functions for timetaggs at two count rates denoted by the vertical lines in (b), similar to [the same figure (b) and (c)](section_04_method.md#fig:jitterate_results_2). The dark grey solid lines show response functions from the calibration and correction method which does not limit count rate. The 100 ns dead time filtered data does not reach the 5.9 Mcps of figure (d) and is therefore not shown in (d).</figcaption>
    </figure>
