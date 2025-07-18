function toggle_solutions() {
    elements = document.querySelectorAll('.blue,.red');
    for (var i = 0; i < elements.length; i++) {
        elements[i].style.display = elements[i].style.display == 'inline' ? 'none' : 'inline';
    }
}

const signal1 = document.querySelector(".md-option#__palette_2").addEventListener('click', dmode_a)
const signal2 = document.querySelector(".md-option#__palette_1").addEventListener('click', dmode_b)

function switchMode(fromClass, toClass) {
    console.log("Switching from", fromClass, "to", toClass);
    const images = document.getElementsByTagName('img');
    for (let i = 0; i < images.length; i++) {
        if (images[i].src.endsWith('.png') || images[i].src.endsWith('.PNG') || images[i].src.endsWith('.webp')) {
            if (images[i].classList.contains(fromClass)) {
                images[i].classList.replace(fromClass, toClass);
            } else {
                images[i].classList.add(toClass);
            }
        }
    }
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