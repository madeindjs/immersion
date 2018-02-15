# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  require 'faker'

  20.times do

    puts '.'

    user = User.create(
      email: Faker::Internet.email,
      password: 20462046,
      password_confirmation: 20462046,
      firstname: Faker::Name.first_name,
      lastname: Faker::Name.last_name,
      activated: true,
    )

    rand(0..5).times do
      category_offset = rand(Category.count)

      Product.create(
        name: Faker::Food.dish,
        description: Faker::Hobbit.quote,
        price: rand(20..60),
        user_id: user.id,
        category_id: Category.offset(category_offset).first.id,
        duration: rand(400)
      )
    end
  end
end
