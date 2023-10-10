use \boldsymbol for bold latex:

**Fidelity and Rates vs $\boldsymbol \mu$**

Here are a few bold characters together: $\boldsymbol{\mu \quad \beta \quad \gamma}$

For units, use \mathrm{nm}: This is a number with units: $138.3~\mathrm{nm}$

Refer to a figure with Fig. [1](#fig:figurename) or Fig. [1](#fig:figurename) or for multiple Fig. [1](#fig:figurename)

Until I figure something more shorthand, you can set colors with “\<span\>” tags:

[ This text is blue. And it changes lightness when darkmode is witched ]{.blue markdown=""}

<figure markdown> 
    <a name='fig:figurename'></a> 
    ![fig:figurename](./figs_06/fig1b_light.svg#only-light)
    ![fig:figurename](./figs_06/fig1b_dark.svg#only-dark) 
    <figcaption markdown> Figure 1: **Caption title here** a) Long caption here</figcaption>
    </figure>

<figure markdown> 
    <a name='fig:figurename2'></a> 
    ![fig:figurename2](./figs_06/hsps_light.svg#only-light)
    ![fig:figurename2](./figs_06/hsps_dark.svg#only-dark) 
    <figcaption markdown> Figure 2: **Caption title here** a) Long caption here</figcaption>
    </figure>

to have a “&#160;” space in latex and a no break space in html… “&#160”, just use “ ”. That’s a forward slash and a space.

The formatting of multi-line divs is very important. This will render correctly:

<div class=blue markdown>

$$math stuff 1$$

</div>

But this won’t:

::: {.blue markdown=""}
    $$math stuff 2$$
:::

And this won’t

<div class=blue markdown>

    $$math stuff 3$$

    </div>

the file where you’re working on bokeh styling is at :

C:\Users\Andrew\OneDrive - California Institute of Technology\JPL.Jitterate\peacoq\src\bokeh\_hists_js_callbacks.ipynb
