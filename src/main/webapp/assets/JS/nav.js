const profileMenu = document.querySelector('.profile-menu');
const profileBtn = document.querySelector('.profile-btn');

profileBtn.addEventListener('click', (e) => {
    e.stopPropagation(); // empêche le clic de se propager au document
    profileMenu.classList.toggle('active');
});

// Ferme le menu si on clique ailleurs
document.addEventListener('click', () => {
    profileMenu.classList.remove('active');
});