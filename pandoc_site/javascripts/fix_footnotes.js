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

var thing = null

// document.addEventListener("DOMContentLoaded", function () {
document$.subscribe(function() {


    // this fixes situations where a citation follows some latex. With nowrap,
    // the citation doesn't fall to the next line.
    const arithmatexSpans = document.querySelectorAll("span.arithmatex");
    arithmatexSpans.forEach((span) => {
        span.style.whiteSpace = "nowrap";
    });


    // // Find all sup elements on the page
    const supElements = document.querySelectorAll("sup");
    let firstElement = null;
    let lastElement = null;

    // restyle the sup elements like normal latex citations
    for (let i = 0; i < supElements.length; i++) {
        const currentElement = supElements[i];
        const nextElement = supElements[i + 1];

        before = currentElement.previousSibling
        after = currentElement.nextSibling


        if (!(before && after)) {
            console.log("before and after are not text nodes")
            // here
            // add text nodes before and after currentElement
            const bracketBefore = document.createTextNode("[");
            const bracketAfter = document.createTextNode("]");
            currentElement.parentNode.insertBefore(bracketBefore, currentElement);
            currentElement.parentNode.insertBefore(bracketAfter, currentElement.nextSibling);
        }
        else {
            if (before && before.nodeType === 3 && after && after.nodeType === 3) {
                before.nodeValue += "[";
                after.nodeValue = "]" + after.nodeValue;
              }
        }


        // this identifies a series of multiple citations in a row
        // and only puts brackets around the first and last
        if (nextElement && nextElement.previousSibling === currentElement) {
            // The next element appears directly after the current element
            if (!firstElement) {
                // This is the first element in the set
                firstElement = currentElement;
            }
            // This is the last element in the set
            lastElement = nextElement;

            if (firstElement && lastElement) {
                const firstTextNode = firstElement.previousSibling;
                const lastTextNode = lastElement.nextSibling;
                firstTextNode.nodeValue += "[";
                lastTextNode.nodeValue = "]" + lastTextNode.nodeValue;
            }

        }
        else {
            firstElement = null;
        }
    }

    if (firstElement && lastElement) {
        console.log("The first element is:", firstElement);
        console.log("The last element is:", lastElement);
    } else {
        console.log("No set of elements found");
    }

    // // Loop through each sup element and replace it with its content
    // supElements.forEach((supElement) => {
    //     const html = supElement.innerHTML;
    //     const newElement = document.createElement("span");
    //     newElement.innerHTML = `[${html}]`;
    //     // Transfer the id attribute of the sup element to the new span element
    //     const id = supElement.getAttribute("id");
    //     if (id) {
    //         newElement.setAttribute("id", id);
    //     }
    //     supElement.parentNode.replaceChild(newElement, supElement);
    // });

    // Find all sup elements with an id attribute on the page
    // const supElements = document.querySelectorAll("sup");

    // // Loop through each sup element and add brackets before and after
    // supElements.forEach((supElement, index) => {
    //     const html = supElement.outerHTML;
    //     const newElement = document.createElement("span");
    //     newElement.innerHTML = html;
    //     // Add a bracket before the first sup element
    //     if (index === 0) {
    //         const bracket = document.createTextNode("[");
    //         supElement.parentNode.insertBefore(bracket, supElement);
    //     }
    //     // Add a bracket after the last sup element
    //     if (index === supElements.length - 1) {
    //         const bracket = document.createTextNode("]");
    //         supElement.parentNode.insertBefore(bracket, supElement.nextSibling);
    //     }
    //     supElement.parentNode.replaceChild(newElement, supElement);
    // });


    // Find all list elements with an id of the form "fn:1", "fn:2", etc.
    // and do some processing to correct garbled HTML in the footnotes
    const listElements = document.querySelectorAll("li[id^='fn:']");
    thing = listElements
    // console.log(listElements)
    // Loop through each list element
    listElements.forEach((listElement) => {
        // Find the <p> tag inside the list element
        const pTag = listElement.querySelector("p");
        // const aTag = listElement.querySelector("a");
        if (pTag) {
            // Get the text inside the <p> tag
            let text = pTag.innerHTML;
            text = formatText(text);
            pTag.innerHTML = text;
        }
    });
});

// // Find all list elements with an id of the form "fn:1", "fn:2", etc.
// // and do some processing to correct garbled HTML in the footnotes
// document.addEventListener("DOMContentLoaded", function () {
//     const listElements = document.querySelectorAll("li[id^='fn:']");
//     thing = listElements
//     // console.log(listElements)
//     // Loop through each list element
//     listElements.forEach((listElement) => {
//         // Find the <p> tag inside the list element
//         const pTag = listElement.querySelector("p");
//         const aTag = listElement.querySelector("a");
//         if (pTag && aTag) {
//             // Get the link inside the <a> tag
//             const url = aTag.href;
//             // Fetch the header content from the URL using the HEAD method
//             fetch(url, { method: 'HEAD' })
//                 .then(response => {
//                     // Get the headers from the response
//                     const headers = response.headers;
//                     // Get the content of the "og:image" meta tag from the headers
//                     const ogImage = headers.get("og:image");
//                     // Do something with the og:image content
//                     console.log(ogImage);
//                 })
//                 .catch(error => console.error(error));
//             // Get the text inside the <p> tag
//             let text = pTag.innerHTML;
//             text = formatText(text);
//             pTag.innerHTML = text;
//         }
//     });
// });