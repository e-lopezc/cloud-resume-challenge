const counter = document.querySelector(".visits-number");
async function updateCounter() {
  let response = await fetch("");
  let data = await response.json();
  counter.innerHTML = `${data}`;
}

updateCounter();
