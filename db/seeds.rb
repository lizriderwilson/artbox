User.create(username: 'firstartist', email: 'hello@test.com', bio: "I am the first artist to be created for this website.", password: 'test')

Supply.create(name: 'Prismacolor Colored Pencils', description: 'Prismacolor colored pencils, basic set', user_id: 1)
Supply.create(name: 'Windsor & Newton Cotman watercolors', description: 'Basic set', user_id: 1)

Category.create(name: 'colored pencils')
Category.create(name: 'watercolors')

SupplyCategory.create(supply_id: 1, category_id: 1)
SupplyCategory.create(supply_id: 2, category_id: 2)