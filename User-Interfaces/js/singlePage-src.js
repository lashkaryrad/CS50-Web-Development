// Get Buttons DataSet
document.addEventListener("DOMContentLoaded", function() {

    // Access To all Button's DataSet
    document.querySelectorAll("button").forEach((button) => {

        // if Button clicked:
        button.onclick = function() {
            console.log(this.dataset.page)
        }
    })

    return false; // Sent data as Ajax.
})