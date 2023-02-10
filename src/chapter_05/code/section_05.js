const message = document.querySelector(".md-button");
message.addEventListener('click', toggle_solutions)



function toggle_solutions() {
    console.log("working function")
    elements = document.querySelectorAll('.blue,.red');
    for (var i = 0; i < elements.length; i++) {
        elements[i].style.display = elements[i].style.display == 'inline' ? 'none' : 'inline';
    }
}

toggle_solutions()