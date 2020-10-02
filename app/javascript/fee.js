function fee() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const itemPriceCount = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${itemPriceCount * 0.1}`;
    const profitTotal = document.getElementById("profit");
    profitTotal.innerHTML = `${itemPriceCount * 0.9}`;
  });
}
window.addEventListener("load", fee);
