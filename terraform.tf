resource "random_pet" "demo" {
  length = 4
}

output "pet_name" {
  value = random_pet.demo.id
}

data "http" "quote" {
  url = "https://animechan.vercel.app/api/random"

  lifecycle {
    postcondition {
      condition = contains([200], self.status_code)
      error_message = "Status code invalid"
    }
  }
}

resource "local_file" "quote_file" {
  filename = "anime_quote.txt"
  content = jsondecode(data.http.quote.response_body)["quote"]
}