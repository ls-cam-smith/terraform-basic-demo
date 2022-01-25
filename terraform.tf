resource "random_pet" "demo" {
}

output "pet_name" {
  value = random_pet.demo.id
}
