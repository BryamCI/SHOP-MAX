
const loginBtn = document.getElementById("openLogin");
const modal = document.getElementById("loginModal");
const closeBtn = document.getElementById("closeLogin");

// abrir modal
loginBtn.addEventListener("click", () => {
  modal.classList.add("active");
});

// cerrar con botón
closeBtn.addEventListener("click", () => {
  modal.classList.remove("active");
});

// cerrar clic fuera del modal
window.addEventListener("click", (e) => {
  if (e.target === modal) {
    modal.classList.remove("active");
  }
});
