const cdnUrls = [
    'https://cdn.bokeh.org/bokeh/release/bokeh-3.2.2.min.js',
    'https://cdn.bokeh.org/bokeh/release/bokeh-gl-3.2.2.min.js',
    'https://cdn.bokeh.org/bokeh/release/bokeh-widgets-3.2.2.min.js',
    'https://cdn.bokeh.org/bokeh/release/bokeh-tables-3.2.2.min.js',
    'https://cdn.bokeh.org/bokeh/release/bokeh-mathjax-3.2.2.min.js',
    'https://cdn.bokeh.org/bokeh/release/bokeh-api-3.2.2.min.js'
];

let loadedCount = 0;
let bokeh = NaN;

const activateSpan = document.querySelector('.bokeh');

const elements = document.querySelectorAll('.bokeh')

const ids = [];
elements.forEach(element => {
    const id = element.getAttribute('id');
    ids.push(id);
  });


if (activateSpan) {
  let loadedCount = 0;
  cdnUrls.forEach(url => {
    const script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = url;
    script.async = true;
    script.onload = () => {
      loadedCount++;
      if (loadedCount === cdnUrls.length) {
        // Code to execute after all scripts have loaded
        console.log('this is bokeh: ', window.Bokeh);
        init_bokeh(ids, elements)
      }
    };
    document.head.appendChild(script);
  });
}



// const message = document.querySelector(".md-button");
// message.addEventListener('click', func)

// function func() {
//     alert("This is your message!")
// }

// console.log(window.location.href)

// res = fetch("./this.json")
// .then(res => res.json())
// // .then(data => console.log(data))

var obj;
// var local = JSON.parse(localStorage.getItem('/.__palette'));
// console.log(local.color.scheme);

// fetch('./json_test_peacoq_hist_2.json')
//   .then(res => res.json())
//   .then(data => obj = data).then(() => load_plot(obj))




function init_bokeh(ids, elements) {
    var local = JSON.parse(localStorage.getItem('/.__palette'));

    if (local == null) {
        var mode = 'default'
    }
    else {
        var mode = local.color.scheme
    }


    // if (mode == 'slate') {
    //     fetch('./json_test_peacoq_hist_dark_special.json')
    //         .then(res => res.json())
    //         .then(data => obj = data).then(() => load_plot(obj))
    // }
    ids.forEach(id => {
        res = fetch("./code/" + id + ".json")
        console.log(res)
      });



    



    // else {
    //     fetch('./json_test_peacoq_hist_light.json')
    //         .then(res => res.json())
    //         .then(data => obj = data).then(() => load_plot(obj))
    // }
}

function load_plot(element, docs_json) {
    document.getElementById("testPlot").innerHTML = "";
    window.Bokeh.embed.embed_item(docs_json, 'testPlot').then(figure => get_figure_info(figure))
    // window.Bokeh.theme = 'dark_minimal'
}

function get_figure_info(figure) {
    // console.log(figure)
    // console.log(figure[0].model)
    // console.log(figure[0].model.background_fill_color)
    // figure[0].model.background_fill_color = 'black'
}


const signal1 = document.querySelector(".md-option#__palette_2").addEventListener('click', dmode_a)
const signal2 = document.querySelector(".md-option#__palette_1").addEventListener('click', dmode_b)
// console.log(signal1)


function dmode_a(e) {
    // console.log(e.target)
    // console.log("dark")
    // fetch('./json_test_peacoq_hist_dark.json')
    //     .then(res => res.json())
    //     .then(data => obj = data).then(() => load_plot(obj))
    
}

function dmode_b(e) {
    // console.log(e.target)
    // console.log("light")
    fetch('./json_test_peacoq_hist_light.json')
        .then(res => res.json())
        .then(data => obj = data).then(() => load_plot(obj))
}