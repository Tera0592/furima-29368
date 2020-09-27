const pay = () => {
  console.log("pay関数実行の確認")
  Payjp.setPublicKey("pk_test_34d35352760f7be6ecfcaa57");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    console.log("イベント発火の確認");
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: document.getElementById("card-number").value,
      cvc: document.getElementById("card-cvc").value,
      exp_month: document.getElementById("card-exp-month").value,
      exp_year: `20${document.getElementById("card-exp-year").value}`,
    };
    console.log(card);
    Payjp.createToken(card, (status, response) => {
      console.log(status)
      console.log(response)
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