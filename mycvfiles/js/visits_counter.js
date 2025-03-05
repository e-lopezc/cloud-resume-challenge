const counter = document.querySelector(".counter-number");
async function updateCounter() {
    let response = await fetch("YOUR LAMBDA FUNCTION URL HERE");
    let data = await response.json();
    counter.innerHTML = `${data}`;

}

updateCounter();
