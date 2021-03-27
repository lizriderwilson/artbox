User.create(name: 'Liz', username: 'firstartist', email: 'hello@test.com', bio: "I am the first artist to be created for this website.", password: 'test', location: 'NC', twitter: 'm3rlumina', instagram: 'merlumina', icon: 'fas fa-highlighter')

Supply.create(name: 'Prismacolor Colored Pencils', description: 'Prismacolor colored pencils, basic set', user_id: 1, category_id: 1)
Supply.create(name: 'Windsor & Newton Cotman watercolors', description: 'Basic set', user_id: 1, category_id: 2)

Category.create(name: 'colored pencils')
Category.create(name: 'watercolors')