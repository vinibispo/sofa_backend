# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Order.destroy_all
Address.destroy_all
User.destroy_all
Plan.destroy_all
Enterprise.destroy_all

path_image = 'public/images/enterprises/place1.jpeg'
enterprise = Enterprise.create(nome: 'Empreendimento 1', endereco: 'Rua Dos Bobos')
enterprise.image.attach(io: File.open(path_image), filename: 'place1.jpeg')
plan = enterprise.plans.create(room: 2, area: 4)
path_image = 'public/images/plans/plan1.jpeg'
plan.image.attach(io: File.open(path_image), filename: 'plan1.jpeg')
plan = enterprise.plans.create(room: 4, area: 16)
path_image = 'public/images/plans/plan2.jpg'
plan.image.attach(io: File.open(path_image), filename: 'plan2.jpg')
path_image = 'public/images/enterprises/place2.jpeg'
enterprise = Enterprise.create(nome: 'Empreendimento 2', endereco: 'Rua X')
enterprise.image.attach(io: File.open(path_image), filename: 'place2.jpeg')
plan = enterprise.plans.create(room: 6, area: 20)
path_image = 'public/images/plans/plan3.png'
plan.image.attach(io: File.open(path_image), filename: 'plan3.png')
plan = enterprise.plans.create(room: 10, area: 100)
path_image = 'public/images/plans/plan4.jpeg'
plan.image.attach(io: File.open(path_image), filename: 'plan4.jpeg')

path_image = 'public/images/enterprises/place1.jpeg'
enterprise = Enterprise.create(nome: 'Empreendimento 1', endereco: 'Rua Dos Bobos')
enterprise.image.attach(io: File.open(path_image), filename: 'place1.jpeg')
plan = enterprise.plans.create(room: 2, area: 4)
path_image = 'public/images/plans/plan1.jpeg'
plan.image.attach(io: File.open(path_image), filename: 'plan1.jpeg')
plan = enterprise.plans.create(room: 4, area: 16)
path_image = 'public/images/plans/plan2.jpg'
plan.image.attach(io: File.open(path_image), filename: 'plan2.jpg')
path_image = 'public/images/enterprises/place2.jpeg'
enterprise = Enterprise.create(nome: 'Empreendimento 2', endereco: 'Rua X')
enterprise.image.attach(io: File.open(path_image), filename: 'place2.jpeg')
plan = enterprise.plans.create(room: 6, area: 20)
path_image = 'public/images/plans/plan3.png'
plan.image.attach(io: File.open(path_image), filename: 'plan3.png')
plan = enterprise.plans.create(room: 10, area: 100)
path_image = 'public/images/plans/plan4.jpeg'
plan.image.attach(io: File.open(path_image), filename: 'plan4.jpeg')
