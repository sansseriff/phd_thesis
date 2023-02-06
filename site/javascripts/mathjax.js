window.MathJax = {
    loader: {
        load: ['[tex]/autoload', '[tex]/upgreek', '[tex]/unicode', '[tex]/cancel'],
        '[tex]/upgreek': {
            ready: (name) => console.log(name + ' ready'),
            failed: (error) => console.log(error.package + ' failed')
        },
        '[tex]/autoload': {
            ready: (name) => console.log(name + ' ready'),
            failed: (error) => console.log(error.package + ' failed')
        },
    },
    tex: {
        inlineMath: [["\\(", "\\)"]],
        displayMath: [["\\[", "\\]"]],
        processEscapes: true,
        processEnvironments: true,
        packages: { '[+]': ['autoload', 'upgreek', 'unicode', 'cancel'] },
        autoload: {
            upgreek: ['upalpha', 'upbeta', 'upchi', 'updelta', 'Updelta', 'upepsilon',
                'upeta', 'upgamma', 'Upgamma', 'upiota', 'upkappa', 'uplambda',
                'Uplambda', 'upmu', 'upnu', 'upomega', 'Upomega', 'upomicron',
                'upphi', 'Upphi', 'uppi', 'Uppi', 'uppsi', 'Uppsi', 'uprho',
                'upsigma', 'Upsigma', 'uptau', 'uptheta', 'Uptheta', 'upupsilon',
                'Upupsilon', 'upvarepsilon', 'upvarphi', 'upvarpi', 'upvarrho',
                'upvarsigma', 'upvartheta', 'upxi', 'Upxi', 'upzeta'],
            braket: ['bra', 'ket', 'braket', 'set', 'Bra', 'Ket', 'Braket', 'Set', 'ketbra', 'Ketbra'],
        },
    },
    options: {
        ignoreHtmlClass: ".*|",
        processHtmlClass: "arithmatex"
    },

};

document$.subscribe(() => {
    MathJax.typesetClear()
    MathJax.typesetPromise()
})