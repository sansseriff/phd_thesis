const message = document.querySelector(".md-button");
message.addEventListener('click', toggle_solutions)



function toggle_solutions() {
    elements = document.querySelectorAll('.blue,.red');
    for (var i = 0; i < elements.length; i++) {
        elements[i].style.display = elements[i].style.display == 'inline' ? 'none' : 'inline';
    }
}

// function init_img() {
//     var local = JSON.parse(localStorage.getItem('/.__palette'));

//     if (local == null) {
//         var mode = 'default'
//     }
//     else {
//         var mode = local.color.scheme
//     }


//     if (mode == 'slate') {
//         // init to dark mode
//         const images = document.getElementsByTagName('img');
//         // Loop through all the image elements
//         for (let i = 0; i < images.length; i++) {
//             // Check if the image is a .png file
//             if (images[i].src.endsWith('.png')) {
//                 // Replace the old class with the new one
//                 images[i].classList.add('dark_mode');
//             }
//         }
//     }
//     else {
//         // init to light mode
//         const images = document.getElementsByTagName('img');
//         // Loop through all the image elements
//         for (let i = 0; i < images.length; i++) {
//             // Check if the image is a .png file
//             if (images[i].src.endsWith('.png')) {
//                 // Replace the old class with the new one
//                 images[i].classList.replace('dark_mode');
//             }
//         }
//     }
// }

// const signal1 = document.querySelector(".md-option#__palette_2").addEventListener('click', dark_mode_a)
// const signal2 = document.querySelector(".md-option#__palette_1").addEventListener('click', dark_mode_b)

// function dmode_a(e) {
//     // switching to dark mode
//     const images = document.getElementsByTagName('img');
//     // Loop through all the image elements
//     for (let i = 0; i < images.length; i++) {
//         // Check if the image is a .png file
//         if (images[i].src.endsWith('.png')) {
//             // Replace the old class with the new one
//             images[i].classList.replace('light_mode', 'dark_mode');
//         }
//     }
// }

// function dmode_b(e) {
//     // switching to light mode
//     const images = document.getElementsByTagName('img');
//     // Loop through all the image elements
//     for (let i = 0; i < images.length; i++) {
//         // Check if the image is a .png file
//         if (images[i].src.endsWith('.png')) {
//             // Replace the old class with the new one
//             images[i].classList.replace('dark_mode', 'light_mode');
//         }
//     }

// }

const signal1 = document.querySelector(".md-option#__palette_2").addEventListener('click', dmode_a)
const signal2 = document.querySelector(".md-option#__palette_1").addEventListener('click', dmode_b)

function switchMode(fromClass, toClass) {
    console.log("Switching from", fromClass, "to", toClass);
    const images = document.getElementsByTagName('img');
    for (let i = 0; i < images.length; i++) {
        if (images[i].src.endsWith('.PNG')) {
            if (images[i].classList.contains(fromClass)) {
                images[i].classList.replace(fromClass, toClass);
            } else {
                images[i].classList.add(toClass);
            }
        }
    }
}

// function init_img() {
//     var local_1 = JSON.parse(localStorage.getItem('/phd_thesis/.__palette'));
//     var local_2 = JSON.parse(localStorage.getItem('/.__palette'));
//     if (local_1 != null) {
//         switch (local_1.color.scheme) {
//             case 'slate':
//                 switchMode('light_img', 'dark_img');
//                 break;
//             default:
//                 switchMode('dark_img', 'light_img');
//         }
//     }
//     if (local_2 != null) {
//         switch (local_2.color.scheme) {
//             case 'slate':
//                 switchMode('light_img', 'dark_img');
//                 break;
//             default:
//                 switchMode('dark_img', 'light_img');
//         }
//     }

// }

function init_img() {
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
