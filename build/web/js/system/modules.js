document.addEventListener("DOMContentLoaded", () => {

  const dashboardM = document.getElementById("dashboard-module");
  const usersM = document.getElementById("users-module");

  const btnDashboard = document.getElementById("btnDashboard");
  const btnUsers = document.getElementById("btnUsers");

  function setActiveModule(module) {

    dashboardM.style.display = "none";
    usersM.style.display = "none";

    btnDashboard.classList.remove("active");
    btnUsers.classList.remove("active");

    if (module === "dashboard") {
      dashboardM.style.display = "block";
      btnDashboard.classList.add("active");
    }

    if (module === "users") {
      usersM.style.display = "block";
      btnUsers.classList.add("active");
    }
  }

  btnDashboard.addEventListener("click", () => {
    setActiveModule("dashboard");
  });

  btnUsers.addEventListener("click", () => {
    setActiveModule("users");
  });

});