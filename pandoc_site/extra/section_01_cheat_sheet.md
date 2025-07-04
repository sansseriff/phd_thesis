to put something only in the mkdocs/html output:

content here

to put something only in the latex output:

to get numbered equations to work in both latex and html, use this format. Notice that the label is used twice, once inside the align block and once outside:

<a name='eq:cosines'></a>

$$ 
\begin{align}
P_{A+ B+} &= |\langle 2|2\rangle|^2_{A+ B+} = 2(1 + v \cos(\theta)) \label{eq:cosines}\\
P_{A+ B-} &= |\langle 2|2\rangle|^2_{A+ B-} = 2(1 - v \cos(\theta)) \notag \\
P_{A- B+} &= |\langle 2|2\rangle|^2_{A- B+} = 2(1 - v \cos(\theta)) \notag \\
P_{A- B-} &= |\langle 2|2\rangle|^2_{A- B-} = 2(1 + v \cos(\theta)) \notag \\ \notag
\end{align}
\tag{1}$$

<!-- NOTE if its NOT a numbered equation you have to switch align to aligned!! -->

<!-- and this might work? -->

<!-- ```{=latex}
content here
``` -->

You can do footnotes like this[^1]

use \boldsymbol for bold latex:

**Fidelity and Rates vs $\boldsymbol \mu$**

Here are a few bold characters together: $\boldsymbol{\mu \quad \beta \quad \gamma}$

For units, use \mathrm{nm}: This is a number with units: $138.3~\mathrm{nm}$

Refer to a figure with Fig. [1](#fig:figurename) or Fig. [1](#fig:figurename) or for multiple Fig. [1](#fig:figurename)

Until I figure something more shorthand, you can set colors with “\<span\>” tags:

<span class=blue markdown> This text is blue. And it changes lightness when darkmode is witched </span>

<figure markdown> 
    <a name='fig:figurename'></a> 
    <img alt="fig:figurename" style="width: 70%; margin: auto;" src="../figs_06/fig1b_light.svg#only-light" >
    <img alt="fig:figurename" style="width: 70%; margin: auto;" src="../figs_06/fig1b_dark.svg#only-dark" > 
    <figcaption markdown> Figure 1: **Caption title here** a) Long caption here</figcaption>
    </figure>

<figure markdown> 
    <a name='fig:figurename2'></a> 
    <img alt="fig:figurename2" style="width: 70%; margin: auto;" src="../figs_06/hsps_light.svg#only-light" >
    <img alt="fig:figurename2" style="width: 70%; margin: auto;" src="../figs_06/hsps_dark.svg#only-dark" > 
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

<figure markdown> 
    <a name='fig:cryostat_concept'></a> 
    <img alt="fig:cryostat_concept" style="width: nil; margin: auto;" src="../figs/fig1b_light.svg#only-light" >
    <img alt="fig:cryostat_concept" style="width: nil; margin: auto;" src="../figs/fig1b_dark.svg#only-dark" > 
    <figcaption markdown> Figure 3: **Cryostat free space coupling options.**</figcaption>
    </figure>

the file where you’re working on bokeh styling is at :

C:\Users\Andrew\OneDrive - California Institute of Technology\JPL.Jitterate\peacoq\src\bokeh\_hists_js_callbacks.ipynb

[^1]: This is a footnote
