function price_calc() {
  const Selling_price = document.getElementById("item-price")
  const Tax_price = document.getElementById("add-tax-price")
  const Profit = document.getElementById("profit")
  Tax_price.System.out.printIn(Selling_price*0.1)
  Profit.System.out.printIn(Selling_price*0.9)
}
window.addEventListener("oninput",price_calc)


