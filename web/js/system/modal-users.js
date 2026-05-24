document.addEventListener("DOMContentLoaded", () => {

  const modal = document.getElementById("userModal");
  const form = document.getElementById("formUser");
  const btnAdd = document.querySelector(".btn-add-user");
  const btnCancel = document.querySelector(".btn-cancel");

  function openModal() {
    modal.style.display = "flex";
  }

  function closeModal() {
    modal.style.display = "none";
    form.reset();
  }

  if (btnAdd) {
    btnAdd.addEventListener("click", (e) => {
      e.preventDefault();
      openModal();
    });
  }

  if (btnCancel) {
    btnCancel.addEventListener("click", closeModal);
  }

  if (modal) {
    modal.addEventListener("click", (e) => {
      if (e.target === modal) {
        closeModal();
      }
    });
  }

});