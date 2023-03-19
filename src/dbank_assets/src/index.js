import { dbank } from "../../declarations/dbank";

const balance = document.getElementById("value");
const form = document.querySelector("form");
const topUp = document.querySelector("#input-amount");
const withdraw = document.querySelector("#withdrawal-amount");

const getBalance = async () => {
  const currentBalance = await dbank.checkBalance();
  balance.innerText = Math.round(currentBalance * 100) / 100;
};

window.addEventListener("load", async () => {
  await getBalance();
});

form.addEventListener("submit", async (e) => {
  e.preventDefault();

  const button = e.target.querySelector("#submit-btn");

  const topUpValue = parseFloat(topUp.value);
  const withdrawValue = parseFloat(withdraw.value);

  button.setAttribute("disabled", true);

  if (topUp.value.length !== 0) {
    await dbank.topUP(topUpValue);
  } else if (withdraw.value.length !== 0) {
    await dbank.withdraw(withdrawValue);
  }

  await getBalance();

  topUp.value = "";
  button.removeAttribute("disabled");
});
