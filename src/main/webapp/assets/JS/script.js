const scrollContainer = document.getElementById("scroll");
const leftBtn = document.getElementById("left");
const rightBtn = document.getElementById("right");

leftBtn.addEventListener("click", () => {
    scrollContainer.scrollBy({ left: -200, behavior: "smooth" });
});

rightBtn.addEventListener("click", () => {
    scrollContainer.scrollBy({ left: 200, behavior: "smooth" });
});

// Optionnel : Changement d'état actif
const buttons = document.querySelectorAll(".category");
buttons.forEach(btn => {
    btn.addEventListener("click", () => {
        buttons.forEach(b => b.classList.remove("active"));
        btn.classList.add("active");
    });
});