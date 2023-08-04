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
const listElements = document.querySelectorAll("li[id^='fn:']");

// Loop through each list element
listElements.forEach((listElement) => {
    // Find the <p> tag inside the list element
    const pTag = listElement.querySelector("p");
    console.log(pTag)
    if (pTag) {
        // Get the text inside the <p> tag
        let text = pTag.textContent;
        // Format the text using the formatText() function
        text = formatText(text);
        console.log(text)
        // Replace the text inside the <p> tag with the formatted text
        pTag.textContent = text;
    }
});

toggle_solutions()
init_img()