const message = document.querySelector(".md-button");
message.addEventListener('click', toggle_solutions)



function toggle_solutions() {
    elements = document.querySelectorAll('.blue,.red');
    for (var i = 0; i < elements.length; i++) {
        elements[i].style.display = elements[i].style.display == 'inline' ? 'none' : 'inline';
    }
}

const signal1 = document.querySelector("input#__palette_1.md-option").addEventListener('click', dmode_a)
const signal2 = document.querySelector("input#__palette_0.md-option").addEventListener('click', dmode_b)

function switchMode(fromClass, toClass) {
    console.log("Switching from", fromClass, "to", toClass);
    const images = document.getElementsByTagName('img');
    for (let i = 0; i < images.length; i++) {
        // console.log(i)
        if (images[i].src.endsWith('.PNG')) {
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
                    switchMode('light_img', 'dark_img');
                    break;
                default:
                    switchMode('dark_img', 'light_img');
            }
        }
    });
}

function dmode_a(e) {
    switchMode('light_img', 'dark_img');
}

function dmode_b(e) {
    switchMode('dark_img', 'light_img');
}



toggle_solutions()
init_img()
