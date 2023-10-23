
to put something only in the mkdocs/html output:

```{=html}
content here
```


to put something only in the latex output:



<!-- and this might work? -->
<!-- ```{=latex}
content here
``` -->



use \boldsymbol for bold latex:

**Fidelity and Rates vs $\boldsymbol \mu$**

Here are a few bold characters together: $\boldsymbol{\mu \quad \beta \quad \gamma}$

For units, use \mathrm{nm}:
This is a number with units: $138.3~\mathrm{nm}$

Refer to a figure with @fig:figurename or @Fig:figurename or for multiple @fig:figurename

Until I figure something more shorthand, you can set colors with "<span\>" tags:

<span style="color:blue" markdown> This text is blue. And it changes lightness when darkmode is witched </span>


![**Caption title here** a) Long caption here](./figs_06/fig1b_light.svg){#fig:figurename short-caption="Figure label for in thesis index here." width=70%}

![**Caption title here** a) Long caption here](./figs_06/hsps_light.svg){#fig:figurename2 short-caption="Figure label for in thesis index here." width=70%}


to have a "~" space in latex and a no break space in html... "\&#160", just use "\ ". That's a forward slash and a space.


The formatting of multi-line divs is very important. This will render correctly:

<div class=blue markdown> 

$$math stuff 1$$

</div>

But this won't:
<div class=blue markdown> 

    $$math stuff 2$$

</div>

And this won't
    <div class=blue markdown> 

    $$math stuff 3$$

    </div>


the file where you're working on bokeh styling is at :

C:\Users\Andrew\OneDrive - California Institute of Technology\JPL\.Jitterate\peacoq\src\bokeh_hists_js_callbacks.ipynb