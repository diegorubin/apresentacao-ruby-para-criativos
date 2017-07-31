require 'faker'
module Person
  def self.generate
    name = Faker::Name.name
    {
      avatar: Faker::Avatar.image(name.gsub(/\.|\ /, '-')),
      name: name,
      title: Faker::Job.title,
      birthday: Faker::Date.birthday(18, 65),
      email: Faker::Internet.email,
      bio: [Faker::Simpsons, Faker::StarWars, Faker::Hobbit][rand(3)].quote
    }
  end
end

