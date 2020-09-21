function price_calc() {

  const sellingPrice = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  sellingPrice.addEventListener("keyup", () => {
    const calcTax = sellingPrice.value * 0.1 ;
    const calcProfit = sellingPrice.value * 0.9 ;
    taxPrice.innerHTML = calcTax ;
    profit.innerHTML = calcProfit ;
  });
}
setInterval(price_calc,1000);





