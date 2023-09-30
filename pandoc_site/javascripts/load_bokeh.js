// const cdnUrls = [
//     'https://cdn.bokeh.org/bokeh/release/bokeh-3.2.2.min.js',
//     'https://cdn.bokeh.org/bokeh/release/bokeh-gl-3.2.2.min.js',
//     'https://cdn.bokeh.org/bokeh/release/bokeh-widgets-3.2.2.min.js',
//     'https://cdn.bokeh.org/bokeh/release/bokeh-tables-3.2.2.min.js',
//     'https://cdn.bokeh.org/bokeh/release/bokeh-mathjax-3.2.2.min.js',
//     'https://cdn.bokeh.org/bokeh/release/bokeh-api-3.2.2.min.js'
// ];

// let loadedCount = 0;
// let bokeh = NaN;

// const bokeh_graphs = [];

// const activateSpan = document.querySelector('.bokeh');

// const elements = document.querySelectorAll('.bokeh')

// const ids = [];
// elements.forEach(element => {
//     const id = element.getAttribute('id');
//     ids.push(id);
// });


// if (activateSpan) {
//     let loadedCount = 0;
//     cdnUrls.forEach((url, index) => {
//         const script = document.createElement('script');
//         script.type = 'text/javascript';
//         script.src = url;
//         script.async = true;
//         script.onload = () => {
//             loadedCount++;
//             if (loadedCount === cdnUrls.length) {
//                 // Code to execute after all scripts have loaded
//                 console.log('this is bokeh: ', window.Bokeh);
//                 init_bokeh(ids, elements)
//             }
//         };
//         setTimeout(() => {
//             document.head.appendChild(script);
//         }, index * 15); // Change the timeout value here (in milliseconds)
//     });
// }

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

const bokeh_graphs = [];

const activateSpan = document.querySelector('.bokeh');

const elements = document.querySelectorAll('.bokeh')

const ids = [];
elements.forEach(element => {
    const id = element.getAttribute('id');
    ids.push(id);
});


if (activateSpan) {
    const loadScript = (url, index) => {
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
            } else {
                loadScript(cdnUrls[loadedCount], loadedCount);
            }
        };
        document.head.appendChild(script);
    };
    loadScript(cdnUrls[0], 0);
}

var obj;

const darkColors = [
    '#3d3f4f', // background_fill_color
    '#24242d', // border_fill_color
    '#444444', // outline_line_color
    '#b8b9bf', // major_tick_line_color
    '#b8b9bf', // minor_tick_line_color
    '#b8b9bf', // axis_line_color
    '#b8b9bf', // major_label_text_color
    '#b8b9bf', // axis_label_text_color
    'white', // text_color
    '#b8b9bf', // label_text_color
    '#b8b9bf', // title_text_color
    '#e0e0e0', // major_label_text_color
    '#15191c', // background_fill_color
    '#c08df0', // line_color
    '#3d3f4f', // bar_color
    '#575766', // grid line color
    '#797c91', // legend fill color
    '#56586b', // slider border color
    '#727487', // slider handle background color
    '#9799ad', // handle border color
];

const lightColors = [
    '#FBFBFF', // background_fill_color
    '#f7f7fd', // border_fill_color
    '#F3F3F5', // outline_line_color
    '#83838a', // major_tick_line_color
    '#83838a', // minor_tick_line_color
    '#83838a', // axis_line_color
    '#83838a', // major_label_text_color
    '#83838a', // axis_label_text_color
    '#83838a', // text_color
    '#83838a', // label_text_color
    '#83838a', // title_text_color
    '#83838a', // major_label_text_color
    '#666666', // background_fill_color
    '#595959', // line_color
    'white', // bar_color
    '#d0d0d6', // grid line color
    '#d3d4db', // legend fill color
    '#e6e7ed', // slider border color
    '#d0d2db', // slider handle background color
    '#e1e2e8', // handle border color
];

const colorNames = [
    'background_fill_color',
    'border_fill_color',
    'outline_line_color',
    'major_tick_line_color',
    'minor_tick_line_color',
    'axis_line_color',
    'major_label_text_color',
    'axis_label_text_color',
    'text_color',
    'label_text_color',
    'title_text_color',
    'major_label_text_color',
    'background_fill_color',
    'line_color',
    'bar_color',
  ];

function replaceColors(colors1, colors2) {
    // Create a regex pattern that matches all colors in the light mode array
    const regex = new RegExp(colors1.join('|'), 'g');

    // Create a replacement function that returns the corresponding color in the dark mode array
    const replacement = match => colors2[colors1.indexOf(match)];

    // Return a function that takes a string as input and replaces the colors using regex and the replacement function
    return string => string.replace(regex, replacement);
}



const replaceLightWithLight = replaceColors(darkColors, lightColors);
const replaceDarkWithDark = replaceColors(lightColors, darkColors);



function init_with_mode(ids, elements, mode) {
    console.log("starting init with mode")
    ids.forEach(id => {
        fetch(id + ".json").then(response => response.text())
            .then(data => {
                // console.log(mode)
                // console.log(typeof (mode))
                if (mode == 'slate') {
                    // console.log('running slate')
                    var converted = replaceDarkWithDark(data)
                    bokeh_graphs.push(converted)
                    const parsedJson = JSON.parse(converted); // Convert the string back to JSON
                    // console.log(parsedJson); // Do something with the parsed JSON
                    load_plot(document.getElementById(id), id, parsedJson)
                    console.log("loaded")

                }
                else {
                    // console.log('running default')
                    var converted = replaceLightWithLight(data)
                    bokeh_graphs.push(converted)
                    const parsedJson = JSON.parse(converted); // Convert the string back to JSON
                    // console.log(parsedJson); // Do something with the parsed JSON
                    load_plot(document.getElementById(id), id, parsedJson)
                    console.log("loaded")

                }
            })
            .catch(error => console.error(error));
    });
}

function init_bokeh(ids, elements) {
    var local = JSON.parse(localStorage.getItem('/.__palette'));
    console.log("this is local storage: ", localStorage)
    console.log(" this is current theme: ", local)

    if (local == null) {
        var mode = 'default'
    }
    else {
        var mode = local.color.scheme
    }

    init_with_mode(ids, elements, mode)
    var sliderDiv = document.querySelector('.bk-Slider');
    

    // Use setTimeout instead of window.onload
    // setTimeout(function() {
    //     // Get the div element with the class "bk-Slider"
    //     // var shadowDivs = document.querySelectorAll('shadow-root::shadow div.noUi-connect');
    //     // console.log(shadowDivs)

    //     var shadowDivs = document.querySelectorAll('shadow-root div.noUi-connect');
    //     console.log(shadowDivs)
    //     // Loop through the div elements and access their shadow roots
    //     shadowDivs.forEach(function(div) {
    //         var shadowRoot = div.shadowRoot;
    //         console.log(shadowRoot);
    //     });

    // }, 3000); // Set the timeout to 1000 milliseconds (1 second)
    // window.onload = function() {
    //     var sliderDiv = document.querySelector('.noUi-connect');
    //     console.log(sliderDiv);
    // };
}

function load_plot(element, id, docs_json) {
    element.innerHTML = "";
    
    window.Bokeh.embed.embed_item(docs_json, id).then(figure => get_figure_info(figure))
}

function get_figure_info(figure) {
    // console.log(figure)
    // console.log(figure[0].model)
    // console.log(figure[0].model.background_fill_color)
    // figure[0].model.background_fill_color = 'black'
}


const signal1 = document.querySelector(".md-option#__palette_2").addEventListener('click', dmode_a)
const signal2 = document.querySelector(".md-option#__palette_1").addEventListener('click', dmode_b)


function dmode_a(e) {
    init_with_mode(ids, elements, 'slate')
}

function dmode_b(e) {
    init_with_mode(ids, elements, 'default')
}