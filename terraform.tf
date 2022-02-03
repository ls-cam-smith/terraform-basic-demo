resource "random_pet" "demo" {
  length = 4
}

output "pet_name" {
  value = random_pet.demo.id
}
