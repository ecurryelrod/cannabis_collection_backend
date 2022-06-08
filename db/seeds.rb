# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Type.create(name: 'Indica')
Type.create(name: 'Sativa')
Type.create(name: 'Hybrid')

Effect.create(name: 'Anxious')
Effect.create(name: 'Aroused')
Effect.create(name: 'Creative')
Effect.create(name: 'Dizzy')
Effect.create(name: 'Dry Eyes')
Effect.create(name: 'Dry Mouth')
Effect.create(name: 'Energetic')
Effect.create(name: 'Focused')
Effect.create(name: 'Giggly')
Effect.create(name: 'Happy')
Effect.create(name: 'Headache')
Effect.create(name: 'Hungry')
Effect.create(name: 'Paranoid')
Effect.create(name: 'Relaxed')
Effect.create(name: 'Sleepy')
Effect.create(name: 'Talkative')
Effect.create(name: 'Tingly')
Effect.create(name: 'Uplifted')

u = User.create(name: 'Test', email: 'test@test.com', password: 'password')

u.strains.create(name: 'Purple Haze', type_id: 2, description: 'Super heady. Took me on a wild ride. I thought I was a unicorn with magic.', terpene: 'Cotton candy and chocolate notes', thc_amount: 30, cbd_amount: 0, cbg_amount:0, effect_ids: [2, 6, 13, 16, 17])