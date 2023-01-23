window.MathJax = {
    tex: {
        inlineMath: [["\\(", "\\)"]],
        displayMath: [["\\[", "\\]"]],
        processEscapes: true,
        processEnvironments: true,
        packages: { '[+]': ['upgreek'] },
    },
    options: {
        ignoreHtmlClass: ".*|",
        processHtmlClass: "arithmatex"
    },
    loader: { load: ['[tex]/upgreek'] },
};

document$.subscribe(() => {
    MathJax.typesetPromise()
})