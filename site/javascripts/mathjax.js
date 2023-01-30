window.MathJax = {
    loader: { load: ['[tex]/upgreek'] },
    tex: {
        inlineMath: [["\\(", "\\)"]],
        displayMath: [["\\[", "\\]"]],
        processEscapes: true,
        processEnvironments: true,
        packages: { '[+]': ['upgreek'] },
        autoload: {
            upgreek: ['upalpha', 'upbeta', 'upchi', 'updelta', 'Updelta', 'upepsilon',
                'upeta', 'upgamma', 'Upgamma', 'upiota', 'upkappa', 'uplambda',
                'Uplambda', 'upmu', 'upnu', 'upomega', 'Upomega', 'upomicron',
                'upphi', 'Upphi', 'uppi', 'Uppi', 'uppsi', 'Uppsi', 'uprho',
                'upsigma', 'Upsigma', 'uptau', 'uptheta', 'Uptheta', 'upupsilon',
                'Upupsilon', 'upvarepsilon', 'upvarphi', 'upvarpi', 'upvarrho',
                'upvarsigma', 'upvartheta', 'upxi', 'Upxi', 'upzeta']
        },
    },
    options: {
        ignoreHtmlClass: ".*|",
        processHtmlClass: "arithmatex"
    },

};

document$.subscribe(() => {
    MathJax.typesetPromise()
})