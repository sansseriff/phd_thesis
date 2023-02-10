## Aph 138 Homework Assignment

<!-- the html tag makes this only appear on the website -->

<!-- if you don't use the {=html} syntax, then the inside of the div would be rendered in the latex document -->

<button style="display: block; margin-left: auto; margin-right: auto" class="md-button md-button--primary">Toggle Visibility of Homework Solutions</button></td>

<!-- This span is processed by  pandoc-latex-color so that the color of the pdf will change also. -->

<span class=blue>Contact [Andrew Mueller](mailto:andrewstermueller@gmail.com) with any questions about the homework or solution manual. The solutions to some sections specify finer-grained point values when there are multiple answers per section. As the grader, feel free to use these or not. </span>

### 1. Free space coupling with low dark counts (50 points)

An experimental apparatus emits a collimated beam of $1550~\mathrm{nm}$ photons with gaussian beam waist $w_0 = 3~\mathrm{mm}$. You wish to focus the beam onto an SNSPD directly through a window in a cryostat.

<figure markdown> 
    <a name='fig:cryostat_concept'></a> 
    ![fig:cryostat_concept](./figs_05/fig1b_light.svg#only-light)
    ![fig:cryostat_concept](./figs_05/fig1b_dark.svg#only-dark) 
    <figcaption><b>Cryostat optical coupling</b>** **</figcaption> 
</figure>

As we will see later on, a set of filters will be needed between the detector and the window to minimize dark counts. In practice, the set of filters can be quite thick. Say a $f = 100~\mathrm{mm}$ lens is used right outside the cryostat to focus the beam onto the detector though a set of filters (Fig 1a). The long focal length makes room for a few inches of filters between the external lens and focused spot.

<!-- This is a link to [The cryostat](./#fig:cryostat_concept) -->

1.  (4 pts) If the detector has a circular active area with radius $5~\mathrm{\upmu m}$, what ratio of power in the beam can it collect? Assume the detector has unity efficiency across all angles of incidence with respect to the surface normal.

    <span class=blue markdown> **Answer:** </span> <span class=blue markdown> The divergence angle of the guassian beam: $\theta = \tan^{-1}({\frac{3}{100}})$. </span>

    <span class=blue markdown> The formula for divergence angle in terms of waist $w_0$: $\theta = \frac{\lambda}{\pi w_0}$ </span>

    <span class=blue markdown> Combining and plugging in, the waist radius at focus is $\frac{1550~\mathrm{nm}}{\pi \tan^{-1}(\frac{3}{100})} \approx 16.5~ \mathrm{\upmu m}$ </span>

    <span class=blue markdown> The formula for power inside an aperture at $w(z)$ for a guassian beam:</span>

    <div class=blue markdown>

    $$P(r, z)=P_{0}\left[1-e^{-2 r^{2} / w^{2}(z)}\right]$$

    </div>
    <span class=blue markdown>We are interested in the ratio of power collected at $w(z=0) = w_0$ which may be expressed as:</span>

    <div class=blue markdown>

    $$P(r, z=0)=1-e^{-2 r^{2} / w_0^{2}}$$

    </div>
    <span class=blue markdown>Plugging in: </span>

    <div class=blue markdown>

    $$P(r, z=0)=1-e^{-2(5^{2}) / 16.5^{2}} \approx  \boxed{0.17} $$

    </div>

2.  (4 pts) A faster lens mounted much closer to the detector inside the cryostat focuses to a smaller waist. Consider an $f = 18~\mathrm{mm}$ lens with the detector at the focal length (@Fig:cryostat_concept (B)). Verify more than 99% of the collimated light will be focused onto the active area of the detector.

    <span class=blue markdown> The waist radius at focus is $\frac{1550~\mathrm{nm}}{\pi \tan^{-1}(\frac{3}{18})} \approx 2.98~\mathrm{\upmu m}$ </span>

    <span class=blue markdown>Ratio of power within the $10~\mathrm{\upmu m}$ radius active area: </span>

    <div class=blue markdown>

    $$P(r, z=0)=1-e^{-2(5^{2}) / 2.98^{2}} \approx \boxed{0.996} $$

    </div>
    Without filtering, the mid-infrared photons coupled to the detector from the room temperature laboratory are a dominant source of dark counts. Think of the environment outside the window as an isotropic blackbody emitter. Consider 3 cases, where the shaded red regions illustrate the light field of thermal radiation that could couple to the detector:

    <figure markdown> 
        <a name='fig:coupling_options'></a> 
        ![fig:coupling_options](./figs_05/fig2b_light.svg#only-light)
        ![fig:coupling_options](./figs_05/fig2b_dark.svg#only-dark) 
        <figcaption><b>Cryostat coupling options</b>Three Coupling Options</figcaption> 
    </figure>
    i)  There is no lens; the detector is distance $l$ inside the cryostat, and the first window with diameter $d$ defines an entrance pupil. <br>
    ii) Same as (i), but a lens with focal length $l$ is placed right outside the first window. The detector is at the focal point. <br>
    iii) Same as (ii) but the lens is placed inside the cryostat with the detector still at the focal length. Equivalent to @Fig:cryostat_concept (B) above. <br>

3.  (6 pts) Does (ii) couple more, less, or equal dark counts to the detector than (i)? What about case (iii)? Why? No calculations should be needed. (Hint: Consider the units of radiance, which characterizes a black body emitter. Etendue or beam parameter product may be useful concepts to consider)

    <span class=blue markdown> **Answer:** </span> <span class=blue markdown> The three cases couple the same amount of light to the detector. (ii) couples the same amount of power as (i) because a blackbody source can’t be focused to higher intensity with a lens. The solid angle subtended by the entrance pupil as seen by the detector is the same in all cases. The detector area stays the same as well so the etendue is conserved across all three cases. This implies the same radiant power is coupled. </span>

    <span class=red markdown> 3 points for saying all situations couple the same rate; 3 points for some explanation. </span>

4.  (9 pts) Using Planck’s law with laboratory temperature $T$ and the geometry of case (i) above, write an expression for spectral radiant flux (photons per unit wavelength) on the active area of a detector with radius $r$.

    <span class=blue markdown> **Answer:** </span> <span class=blue markdown>The expression is a product of several factors:</span>

    <div class=blue markdown>

    $$\text{Flux}[\lambda] = P \Omega D_{area} B_{\lambda}(\lambda, T)$$

    </div>
    <span class=blue markdown> Where $P = \frac{\lambda}{hc}$ is the number of photons per unit energy, $\Omega$ is the solid angle of blackbody radiation as seen by the detector, $D_{area} = \pi r^2$ is the area of the detector, and $B_{\lambda}$ is Planck’s law. </span> <span class=blue markdown>Planck’s law:</span>

    <div class=blue markdown>

    $$B_{\lambda}(\lambda, T)=\frac{2 h c^{2}}{\lambda^{5}} \frac{1}{e^{h c /\left(\lambda k_{\mathrm{B}} T\right)}-1}$$

    </div>
    <span class=blue markdown> $\Omega = \pi \sin{\theta^2}$, where $\theta = \tan^{-1}(\frac{(d/2)}{l})$ is the half angle of the field of view of blackbody radiation as seen by the detector. </span>

    <span class=blue markdown>The full expression: </span>

    <div class=blue markdown>

    $$\text{Flux}[\lambda] = \frac{\lambda \pi^2 r^2 \sin{\theta^2}}{hc} \frac{2 h c^{2}}{\lambda^{5}} \frac{1}{e^{h c /\left(\lambda k_{\mathrm{B}} T\right)}-1}, \,\,\,\,\,\,\,\,\,\,\,\theta = \tan^{-1}(\frac{(d/2)}{l})$$

    </div>
    <span class=blue markdown> Since the expression asked for can be written many ways, just verify the student has taken into account all the terms in equation (1) above, and has the correct expressions for</span> <span class=red markdown>$\Omega$ (3 pts), $\theta$ (3 pts), and P (3 pts).</span>

5.  (6 pts) Consider the configuration in Fig. 1b). The detector has an internal quantum efficiency approximated by: <!--\footnote{A more accurate model would include the transmission spectrum of the optical stack in which the nanowire is embedded, along with a non-unity coupling efficiency}:  -->

$$\eta(\lambda) = \frac{1}{2}(1 - \text{erf}[\lambda - 3~\mathrm{\upmu m}]) $$

$\lambda$ is measured in $\mathrm{\upmu m}$ and $\text{erf}()$ is the error function. Using your conclusions from (1.3) and expression from (1.4), write a formula $N_{photons}[\lambda]$ for the number of detectable dark counts with respect to $\lambda$, then numerically integrate it to find the dark count rate with no filtering. The laboratory temperature $T$ is 293\~K, lens focal length $l$ is $18~\text{mm}$, detector radius $r$ is $5~\mathrm{\upmu m}$, and the diameter $d$ of all optics is 1 inch. The maximum count rate of this SNSPD is 10 MHz. Is the detector usable or overexposed?

<!-- Keep at end of the page! -->

<script src="../../chapter_05/code/section_05.js"></script>
