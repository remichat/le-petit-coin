require 'faker'
require 'open-uri'

puts "destroying models instances..."
Toilet.destroy_all
User.destroy_all

puts "creating models instances..."
user1 = {
  first_name: "Khâ",
  last_name: "Bhï-Nęt",
  phone_number: "0612345678",
  address: "Narnii Rd, Ulaanbaatar, Mongolie",
  email: "ca@binet.com",
  password: "azertyu",
  password_confirmation: "azertyu"
}

user1 = User.new(user1)
user1pic = URI.open('https://media.licdn.com/dms/image/C5103AQG0eyey_2tgew/profile-displayphoto-shrink_200_200/0?e=1579737600&v=beta&t=q4LYg3xZWW4u5l4PcxCiUD5lwiDuFr75Mll0ah0nn8M')
user1.photo.attach(io: user1pic, filename: 'user1-avatar', content_type: 'image/jpg')
user1.save!

user2 = {
  first_name: "Alexei",
  last_name: "Kipetrovici",
  phone_number: "0609090807",
  address: "Red Square, Moscow, Russie, 109012",
  email: "alexei@petrovite.com",
  password: "azertyu",
  password_confirmation: "azertyu"
}
user2 = User.new(user2)
user2pic = URI.open('https://res.cloudinary.com/db2r8xix2/image/upload/v1574244761/remi_u6rbv7.png')
user2.photo.attach(io: user2pic, filename: 'user2-avatar', content_type: 'image/jpg')
user2.save!

user3 = {
  first_name: "Albert",
  last_name: "Cacamus",
  phone_number: "0687878787",
  address: "Le Royaume",
  email: "caca@mou.com",
  password: "azertyu",
  password_confirmation: "azertyu"
}
user3 = User.new(user3)
user3pic = URI.open('https://res.cloudinary.com/db2r8xix2/image/upload/v1574244761/had_tidvnc.png')
user3.photo.attach(io: user3pic, filename: 'user3-avatar', content_type: 'image/jpg')
user3.save!

users = [user1, user2, user3]
puts "Users created !"


chiure_decolo = {
  title: "Chiure d'écolo",
  description: "Les meilleures chiottes pour ceux qui bouffent des veggies! Tout ce qui entre là-dedans est transformé en composte.",
  address: "88 rue des rosiers, 92500 Rueil Malmaison",
  toilet_type: "Sèche",
  capacity: 1,
  gender: "Mixte",
  is_noiseproof: true,
  is_pro: false,
  user: users.sample
}
chiure_decolo = Toilet.new(chiure_decolo)
chiurepic = URI.open('https://res.cloudinary.com/db2r8xix2/image/upload/v1574243667/nature_cklrxy.jpg')
chiure_decolo.photo.attach(io: chiurepic, filename: 'chiure-image', content_type: 'image/jpg')
chiure_decolo.save!

bagne_turc = {
  title: "Bagne Turc",
  description: "Avez-vous déjà expérimenté les prisons turques ? Quoiqu'il en soit vous serez dissuadés en sortant de cette expérience.",
  address: "KFC Paris Les Halles, 31 Bd Sebastopol, 75001 Paris",
  toilet_type: "Turc",
  capacity: 12,
  gender: "Homme",
  is_noiseproof: false,
  is_pro: true,
  user: users.sample
}
bagne_turc = Toilet.new(bagne_turc)
bagnepic = URI.open('https://res.cloudinary.com/db2r8xix2/image/upload/v1574243668/turc_fwfiha.jpg')
bagne_turc.photo.attach(io: bagnepic, filename: 'bagne-image', content_type: 'image/jpg')
bagne_turc.save!

paillettes = {
  title: "Plus de paillettes dans la vie",
  description: "Paraît-il que c'est sur ce trône qu'Inès Reg a eu l'inspiration de la dite punchline... Envie de savoir pourquoi ? Essayez-les !",
  address: "53 Boulevard Murat, 75016 Paris",
  toilet_type: "Pot",
  capacity: 2,
  gender: "Mixte",
  is_noiseproof: true,
  is_pro: false,
  user: users.sample
}
paillettes = Toilet.new(paillettes)
paillettespic = URI.open('https://res.cloudinary.com/db2r8xix2/image/upload/v1574243667/diams_r1lzaj.jpg')
paillettes.photo.attach(io: paillettespic, filename: 'paillettes-image', content_type: 'image/jpg')
paillettes.save!

japonaise = {
  title: "詰まったトイレ",
  description: "Ce bijou pourra même vous indiquer le poids de votre git push. Allez-y, asseyez-vous, fermez les yeux et laissez-vous transporter au Nihon-koku.",
  address: "37 rue Saint-Anne, 75001 Paris",
  toilet_type: "Pot",
  capacity: 1,
  gender: "Femme",
  is_noiseproof: true,
  is_pro: true,
  user: users.sample
}
japonaise = Toilet.new(japonaise)
japonaisepic = URI.open('https://res.cloudinary.com/db2r8xix2/image/upload/v1574243667/jap_x2bhzk.jpg')
japonaise.photo.attach(io: japonaisepic, filename: 'japonaise-image', content_type: 'image/jpg')
japonaise.save!

underwater = {
  title: "Toilettes du Titanic",
  description: "Snorkeling vous dîtes ?",
  address: "Yet to be determined.",
  toilet_type: "Pot",
  capacity: 500,
  gender: "Mixte",
  is_noiseproof: true,
  is_pro: true,
  user: users.sample
}
underwater = Toilet.new(underwater)
underwaterpic = URI.open('https://res.cloudinary.com/db2r8xix2/image/upload/v1574243667/water_ccxkmx.jpg')
underwater.photo.attach(io: underwaterpic, filename: 'underwater-image', content_type: 'image/jpg')
underwater.save!

10.times do
  toilet = {
    title: "Lorem Ipsum",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.",
    address:"#{Faker::Address.street_address}, #{Faker::Address.city}",
    toilet_type: Toilet::TOILET_TYPES.sample,
    capacity: rand(1..3),
    gender: Toilet::GENDERS.sample,
    is_noiseproof: [true, false].sample,
    is_pro: [true, false].sample,
    user: users.sample
  }
  trone = Toilet.new(toilet)
  tronepic = URI.open('https://res.cloudinary.com/db2r8xix2/image/upload/v1574244573/toilet_rdyx94.jpg')
  trone.photo.attach(io: tronepic, filename: 'trone-image', content_type: 'image/jpg')
  trone.save!
end

puts "Seeds done !"
