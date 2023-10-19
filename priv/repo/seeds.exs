# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ProductSearchApp.Repo.insert!(%ProductSearchApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ProductSearchApp.Products.Product
alias ProductSearchApp.Repo

%Product{about: "About this product.", is_active: false, name: "Avocado Hair Conditioner", picture: "/img/products/10-green.png", price: 2000, tags: "faux avocado conditioner"} |> Repo.insert!
%Product{about: "About this product.", is_active: true, name: "Avocado Hair Shampoo", picture: "/img/products/30-green.png", price: 2200, tags: "faux avocado shampoo"} |> Repo.insert!
%Product{about: "About this product.", is_active: true, name: "Avocado Serum for Hair Damage", picture: "/img/products/20-green.png", price: 3000, tags: "faux avocado serum"} |> Repo.insert!
%Product{about: "About this product.", is_active: true, name: "Avocado Scalp Treatment", picture: "/img/products/40-green.png", price: 2000, tags: "faux avocado treatment"} |> Repo.insert!

%Product{about: "About this product.", is_active: false, name: "Cherry Hair Conditioner", picture: "/img/products/10-red.png", price: 2000, tags: "faux cherry conditioner"} |> Repo.insert!
%Product{about: "About this product.", is_active: true, name: "Cherry Hair Shampoo", picture: "/img/products/30-red.png", price: 2200, tags: "faux cherry shampoo"} |> Repo.insert!
%Product{about: "About this product.", is_active: true, name: "Cherry Serum for Hair Damage", picture: "/img/products/20-red.png", price: 3000, tags: "faux cherry serum"} |> Repo.insert!
%Product{about: "About this product.", is_active: true, name: "Cherry Scalp Treatment", picture: "/img/products/40-red.png", price: 2000, tags: "faux cherry treatment"} |> Repo.insert!

%Product{about: "About this product.", is_active: true, name: "Grape Hair Conditioner", picture: "/img/products/10-purple.png", price: 2000, tags: "faux grape conditioner"} |> Repo.insert!
%Product{about: "About this product.", is_active: false, name: "Grape Hair Shampoo", picture: "/img/products/30-purple.png", price: 2200, tags: "faux grape shampoo"} |> Repo.insert!
%Product{about: "About this product.", is_active: true, name: "Grape Serum for Hair Damage", picture: "/img/products/20-purple.png", price: 3000, tags: "faux grape serum"} |> Repo.insert!
%Product{about: "About this product.", is_active: true, name: "Grape Scalp Treatment", picture: "/img/products/40-purple.png", price: 2000, tags: "faux grape treatment"} |> Repo.insert!

%Product{about: "About this product.", is_active: true, name: "Orange Hair Conditioner", picture: "/img/products/10-orange.png", price: 2000, tags: "faux orange conditioner"} |> Repo.insert!
%Product{about: "About this product.", is_active: true, name: "Orange Hair Shampoo", picture: "/img/products/30-orange.png", price: 2200, tags: "faux orange shampoo"} |> Repo.insert!
%Product{about: "About this product.", is_active: false, name: "Orange Serum for Hair Damage", picture: "/img/products/20-orange.png", price: 3000, tags: "faux orange serum"} |> Repo.insert!
%Product{about: "About this product.", is_active: true, name: "Orange Scalp Treatment", picture: "/img/products/40-orange.png", price: 2000, tags: "faux orange treatment"} |> Repo.insert!

%Product{about: "About this product.", is_active: true, name: "Blueberry Hair Conditioner", picture: "/img/products/10-turq.png", price: 2000, tags: "faux blueberry conditioner"} |> Repo.insert!
%Product{about: "About this product.", is_active: true, name: "Blueberry Shampoo", picture: "/img/products/30-turq.png", price: 2200, tags: "faux blueberry shampoo"} |> Repo.insert!
%Product{about: "About this product.", is_active: true, name: "Blueberry Serum for Hair Damage", picture: "/img/products/20-turq.png", price: 3000, tags: "faux blueberry serum"} |> Repo.insert!
%Product{about: "About this product.", is_active: false, name: "Blueberry Scalp Treatment", picture: "/img/products/40-turq.png", price: 2000, tags: "faux blueberry treatment"} |> Repo.insert!
