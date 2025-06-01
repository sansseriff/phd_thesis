## SNSPhD

The SNSPhD python package includes a number of utility functions and presets used for managing data and generating figures for this thesis. It is based on the `phd` package from [Griffin Chure](https://github.com/gchure/phd#phd-1). Notably, it includes the `vis.phd_style()` function for setting up nice looking matplotlib defaults in my personal style, and the `viz.save_light_dark_all()` function for saving light-mode svg, dark-mode svg, and pdf versions of a figure. The SVGs are used to populate the [thesis website](https://snsphd.online), and the PDFs are used for the latex thesis itself. The `layout.bisect` function is also useful for laying out subfigures in a straightforward way.

The package can be installed with:

```bash
pip install snsphd
```

```{=html}

<div style="display: flex; flex-direction: row; justify-content: space-between">
<a class="md-button" style="width: 30%; display: block; margin: auto; text-align: center;" href="https://github.com/sansseriff/snsphd">Repository <span class="twemoji"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M439.55 236.05 244 40.45a28.87 28.87 0 0 0-40.81 0l-40.66 40.63 51.52 51.52c27.06-9.14 52.68 16.77 43.39 43.68l49.66 49.66c34.23-11.8 61.18 31 35.47 56.69-26.49 26.49-70.21-2.87-56-37.34L240.22 199v121.85c25.3 12.54 22.26 41.85 9.08 55a34.34 34.34 0 0 1-48.55 0c-17.57-17.6-11.07-46.91 11.25-56v-123c-20.8-8.51-24.6-30.74-18.64-45L142.57 101 8.45 235.14a28.86 28.86 0 0 0 0 40.81l195.61 195.6a28.86 28.86 0 0 0 40.8 0l194.69-194.69a28.86 28.86 0 0 0 0-40.81z"></path></svg></span></a>

<a class="md-button" style="width: 30%; display: block; margin: auto; text-align: center;" href="https://pypi.org/project/snsphd/">PyPI </a>
</div>
```

<span class="latex">\href{https://github.com/sansseriff/snsphd}{SNSPhD package repository}</span>

<!-- <script src="../../chapter_06/code/section_05.js"></script> -->
