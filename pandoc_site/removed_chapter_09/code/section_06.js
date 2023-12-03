// const message = document.querySelector(".md-button");
// message.addEventListener('click', toggle_solutions)

console.log("Loaded section_06.js")


// function toggle_solutions() {
//     elements = document.querySelectorAll('.blue,.red');
//     for (var i = 0; i < elements.length; i++) {
//         elements[i].style.display = elements[i].style.display == 'inline' ? 'none' : 'inline';
//     }
// }

const signal1 = document.querySelector(".md-option#__palette_2").addEventListener('click', dmode_a)
const signal2 = document.querySelector(".md-option#__palette_1").addEventListener('click', dmode_b)

function switchMode(fromClass, toClass) {
    console.log("Switching from", fromClass, "to", toClass);
    const images = document.getElementsByTagName('img');
    for (let i = 0; i < images.length; i++) {
        // console.log(i)
        if (images[i].src.toLowerCase().endsWith('.png')) {
            if (images[i].classList.contains(fromClass)) {
                images[i].classList.replace(fromClass, toClass);
            } else {
                images[i].classList.add(toClass);
            }
        }
    }
    console.log("finished")
}


function init_img() {
    // different names for the palette for dev env and deployment
    const local_storage_keys = ['/phd_thesis/.__palette', '/.__palette'];
    local_storage_keys.map((key) => {
        const local = JSON.parse(localStorage.getItem(key));
        if (local !== null) {
            switch (local.color.scheme) {
                case 'slate':
                    switchMode('light_img_achromatic', 'dark_img_achromatic');
                    break;
                default:
                    switchMode('dark_img_achromatic', 'light_img_achromatic');
            }
        }
    });
}

function dmode_a(e) {
    switchMode('light_img_achromatic', 'dark_img_achromatic');
}

function dmode_b(e) {
    switchMode('dark_img_achromatic', 'light_img_achromatic');
}

function update_sizes() {
    // if math containers are too wide, reduce font size
    // console.log("Updating sizes")
    page_container = document.querySelector(".md-content")
    var containers = document.querySelectorAll('mjx-container');
    containers.forEach(container => {
        var width = container.offsetWidth;
        // if (width > 420) {
        //     var percentage = 110 - ((width - 420) * 0.08);
        //     percentage = Math.max(percentage, 0); // Ensure the percentage doesn't go below 0
        //     container.style.fontSize = percentage + '%';
        // }
        if (width > page_container.offsetWidth*0.9) {
            var scale = (page_container.offsetWidth*0.9) / width;
            container.style.transform = 'scale(' + scale + ')';
            container.style.transformOrigin = 'left';
        }
    });

}

window.addEventListener('scroll', function() {
    update_sizes()
});

window.onload = function () {
    init_img()
    // thing = document.querySelector(".md-content")
    // console.log("thing width: ", thing.offsetWidth)
    setTimeout(update_sizes, 100);
}
