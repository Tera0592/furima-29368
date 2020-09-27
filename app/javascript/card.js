const pay = () => {
  Payjp.setPublicKey("pk_test_34d35352760f7be6ecfcaa57");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: document.getElementById("card-number").value,
      cvc: document.getElementById("card-cvc").value,
      exp_month: document.getElementById("card-exp-month").value,
      exp_year: `20${document.getElementById("card-exp-year").value}`,
    };
    
    Payjp.createToken(card, (status, response) => {
      
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const token0bj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", token0bj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    })
  })
}
window.addEventListener("load",pay);