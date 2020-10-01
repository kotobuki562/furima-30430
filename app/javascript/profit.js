// function profit() {
//   const itemPrice = document.getElementById("item-price");
//   const addTaxPrice = document.getElementById("add-tax-price");
//   const profitTotal = document.getElementById("profit");

//   itemPrice.addEventListener("input", () => {
//     addTaxPrice.innerHTML = `${itemPrice}`;
//     profitTotal.innerHTML = `${itemPrice}`;
//   });
// }
// window.addEventListener("load", profit);
function profit() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const itemPriceCount = itemPrice.value;
    const profitTotal = document.getElementById("profit");
    profitTotal.innerHTML = `${itemPriceCount * 0.9}`;
  });
}
window.addEventListener("load", profit);
