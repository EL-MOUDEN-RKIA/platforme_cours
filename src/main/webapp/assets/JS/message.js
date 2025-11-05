function toggleDetails(button) {
    const details = button.parentElement.nextElementSibling;
    details.classList.toggle("show");
    button.textContent = details.classList.contains("show") ? "Hide details" : "See more";
}