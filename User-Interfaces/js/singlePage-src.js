// Show Page Funtion
function showPage(page) {
    // Make All DIV's unvisible
    document.querySelectorAll("div").forEach((dd) => {
        dd.style.display = "none"
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
           showPage(this.dataset.page);
        }
    })

    return false; // Sent data as Ajax.
})