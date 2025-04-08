locals {
  js_content = <<-EOT
const counter = document.querySelector(".visits-number");
async function updateCounter() {
  let response = await fetch("${var.url_endpoint}");
  let data = await response.json();
  counter.innerHTML = data.toString();
}
updateCounter();
EOT
}

resource "local_file" "counter_js" {
  content  = local.js_content
  filename = var.output_path
}
