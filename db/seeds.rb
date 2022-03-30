# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Warehouses, shelfs and shelfsections
Warehouse.create(name: "Almacen 1")
Warehouse.create(name: "Almacen 2")

Shelf.create(warehouse_id: 1, code: "asdasd", category: "Niños")
Shelf.create(warehouse_id: 1, code: "asdasd", category: "Adultos mayores")
Shelf.create(warehouse_id: 1, code: "asdasd", category: "Cosecha de lluvia")
Shelf.create(warehouse_id: 1, code: "asdasd", category: "Ferreteria")
Shelf.create(warehouse_id: 1, code: "asdasd", category: "Papelería")
Shelf.create(warehouse_id: 2, code: "asdasd", category: "Niños")
Shelf.create(warehouse_id: 2, code: "asdasd", category: "Adultos mayores")
Shelf.create(warehouse_id: 2, code: "asdasd", category: "Cosecha de lluvia")
Shelf.create(warehouse_id: 2, code: "asdasd", category: "Ferreteria")
Shelf.create(warehouse_id: 2, code: "asdasd", category: "Papelería")
ShelfSection.create(shelf_id: 1, number: 1)
ShelfSection.create(shelf_id: 1, number: 2)
ShelfSection.create(shelf_id: 1, number: 3)
ShelfSection.create(shelf_id: 1, number: 4)
ShelfSection.create(shelf_id: 1, number: 5)
ShelfSection.create(shelf_id: 1, number: 6)
ShelfSection.create(shelf_id: 1, number: 7)