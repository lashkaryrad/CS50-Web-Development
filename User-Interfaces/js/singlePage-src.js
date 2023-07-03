// Show Page Funtion
function showPage(page) {
    // Make All DIV's unvisible
    document.querySelectorAll("div").forEach((div) => {
        div.style.display = "none";
    })

    // Show The Requested Div (page)
    document.getElementById(page).style.display = "block";
}

// Get Buttons DataSet
document.addEventListener("DOMContentLoaded", function() {

    // Access To all Button's DataSet
    document.querySelectorAll("button").forEach((button) => {

        // if Button clicked:
        button.onclick = function() {
            // if button is home make all None
            if(this.dataset.page == "home") {
                document.querySelectorAll("div").forEach((div) => {div.style.display = "none"});
            } else {
                showPage(this.dataset.page);
            }
        }
    })

    return false; // Sent data as Ajax.
})