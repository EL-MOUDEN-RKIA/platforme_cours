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



const modal = document.getElementById("contactModal");
const btn = document.getElementById("openModal");
const span = document.querySelector(".close");
const profName = document.getElementById("profName");

// Nom du prof récupéré dynamiquement
//profName.textContent = "<%= p.getPrenom() + ' ' + p.getNom() %>";

// Ouvrir la modale
btn.onclick = function() {
    modal.style.display = "flex";
};

// Fermer la modale
span.onclick = function() {
    modal.style.display = "none";
};

// Fermer si on clique à l’extérieur
window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
}