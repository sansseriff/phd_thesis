// using technique from https://github.com/ObsidianPublisher/tooltips-internal-link

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