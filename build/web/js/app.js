
const grid = document.querySelector(".products-grid");
const searchInput = document.getElementById("searchInput");
const filter = document.getElementById("filter");

const prevBtn = document.getElementById("prevBtn");
const nextBtn = document.getElementById("nextBtn");

let currentPage = 0;
const itemsPerPage = 12;

/* FILTRAR */
function getFilteredProducts() {
  const search = searchInput.value.toLowerCase();
  const category = filter.value;

  return products.filter(p => {
    const matchesSearch =
      p.nombre.toLowerCase().includes(search) ||
      p.descripcion.toLowerCase().includes(search);

    const matchesCategory =
      category === "🔎 Todas" || p.categoria === category;

    return matchesSearch && matchesCategory;
  });
}

/* RENDER */
function renderProducts() {
  const filtered = getFilteredProducts();

  const start = currentPage * itemsPerPage;
  const end = start + itemsPerPage;

  const paginated = filtered.slice(start, end);

  grid.innerHTML = "";

  paginated.forEach(p => {
    grid.innerHTML += `
      <div class="product-card">
        <div class="product-img">
          <img src="${p.img}">
          <span class="category">${p.categoria}</span>
        </div>

        <div class="product-info">
          <h3>${p.nombre}</h3>
          <p class="desc">${p.descripcion}</p>

          <div class="product-bottom">
            <span class="price">S/ ${p.precio}</span>
            <button class="add-cart">🛒</button>
          </div>
        </div>
      </div>
    `;
  });

  /* BOTONES */
  prevBtn.disabled = currentPage === 0;
  nextBtn.disabled = end >= filtered.length;
}

/* EVENTOS */
searchInput.addEventListener("input", () => {
  currentPage = 0;
  renderProducts();
});

filter.addEventListener("change", () => {
  currentPage = 0;
  renderProducts();
});

nextBtn.addEventListener("click", () => {
  currentPage++;
  renderProducts();
});

prevBtn.addEventListener("click", () => {
  currentPage--;
  renderProducts();
});

/* INICIO */
renderProducts();