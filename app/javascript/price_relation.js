function calc_price() {
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  itemPrice.addEventListener("input", () => {
    addTaxPrice.innerHTML = Math.floor(itemPrice.value * 0.1)
    profit.innerHTML = itemPrice.value  - addTaxPrice.innerHTML
  })
}

window.addEventListener('load', calc_price)