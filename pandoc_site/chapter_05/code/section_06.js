const message = document.querySelector(".md-button");
message.addEventListener('click', toggle_solutions)



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
        if (images[i].src.endsWith('.PNG')) {
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

function formatText(text) {
    // Replace special character codes with actual HTML tags
    text = text.replace(/&lt;b&gt;/g, "<b>").replace(/&lt;\/b&gt;/g, "</b>");
    text = text.replace(/&lt;i&gt;/g, "<i>").replace(/&lt;\/i&gt;/g, "</i>");
    text = text.replace(/&lt;em&gt;/g, "").replace(/&lt;\/em&gt;/g, "");
    text = text.replace(/&#160;/g, " ");
    // Remove quotation marks and newlines
    text = text.replace(/"/g, "").replace(/\n/g, "");
    return text;
}



// Find all list elements with an id of the form "fn:1", "fn:2", etc.
// and do some processing to correct garbled HTML in the footnotes
document.addEventListener("DOMContentLoaded", function () {
    const listElements = document.querySelectorAll("li[id^='fn:']");

    // Loop through each list element
    listElements.forEach((listElement) => {
        // Find the <p> tag inside the list element
        const pTag = listElement.querySelector("p");
        if (pTag) {
            // Get the text inside the <p> tag
            let text = pTag.innerHTML;
            text = formatText(text);
            pTag.innerHTML = text;
        }
    });
});

// document.addEventListener("DOMContentLoaded", function () {
//     const listElements = document.querySelectorAll("li[id^='fn:']");

//     // Loop through each list element
//     listElements.forEach((listElement) => {
//         // Find the <p> tag inside the list element
//         const pTag = listElement.querySelector("p");
//         if (pTag) {
//             // Get the text inside the <p> tag
//             let text = pTag.textContent;
//             // Format the text using the formatText() function
//             text = formatText(text);
//             // Set the text content of the <p> tag to an empty string
//             pTag.textContent = "";
//             // Prepend the formatted text to the existing innerHTML
//             pTag.innerHTML = text + pTag.innerHTML;
//         }
//     });
// });




toggle_solutions()
init_img()
