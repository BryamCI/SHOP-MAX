
const users = [
  {name:"Juan Pérez", role:"admin", email:"juan@mail.com", phone:"999111222", store:"Shop 1", city:"Piura"},
  {name:"Carlos Ruiz", role:"seller", email:"carlos@mail.com", phone:"999333444", store:"Shop 2", city:"Lima"},
  {name:"Ana Torres", role:"admin", email:"ana@mail.com", phone:"999555666", store:"Shop 3", city:"Cusco"},
  {name:"Luis Gómez", role:"seller", email:"luis@mail.com", phone:"999777888", store:"Shop 4", city:"Arequipa"},
  {name:"María Díaz", role:"seller", email:"maria@mail.com", phone:"999222333", store:"Shop 5", city:"Trujillo"},
  {name:"Pedro León", role:"admin", email:"pedro@mail.com", phone:"999444555", store:"Shop 6", city:"Tacna"},
  {name:"Sofía Rojas", role:"seller", email:"sofia@mail.com", phone:"999888999", store:"Shop 7", city:"Piura"}
];

let currentPage = 0;
const perPage = 6;

function renderUsers() {
  const search = document.getElementById("searchUser").value.toLowerCase();
  const role = document.getElementById("roleFilter").value;

  let filtered = users.filter(u =>
    u.name.toLowerCase().includes(search) &&
    (role === "all" || u.role === role)
  );

  const start = currentPage * perPage;
  const pageUsers = filtered.slice(start, start + perPage);

  const grid = document.getElementById("usersGrid");
  grid.innerHTML = "";

  pageUsers.forEach(u => {
    grid.innerHTML += `
      <div class="user-card">
        <div class="user-top">
          <div class="avatar">${u.name.charAt(0)}</div>
          <div>
            <strong>${u.name}</strong>
            <p>${u.role}</p>
          </div>
        </div>

        <div class="user-info">
          <p><i class="fa fa-envelope"></i>${u.email}</p>
          <p><i class="fa fa-phone"></i>${u.phone}</p>
          <p><i class="fa fa-store"></i>${u.store}</p>
          <p><i class="fa fa-map-marker-alt"></i>${u.city}</p>
        </div>
      </div>
    `;
  });

  // botones
  document.getElementById("prevUsers").disabled = currentPage === 0;
  document.getElementById("nextUsers").disabled = start + perPage >= filtered.length;
}

document.getElementById("searchUser").addEventListener("input", () => {
  currentPage = 0;
  renderUsers();
});

document.getElementById("roleFilter").addEventListener("change", () => {
  currentPage = 0;
  renderUsers();
});

document.getElementById("nextUsers").addEventListener("click", () => {
  currentPage++;
  renderUsers();
});

document.getElementById("prevUsers").addEventListener("click", () => {
  currentPage--;
  renderUsers();
});

renderUsers();
