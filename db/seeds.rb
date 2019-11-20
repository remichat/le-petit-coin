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
  description: "Les meilleures chiottes pour ceux qui ont un potager! Tout ce qui entre là-dedans est transformé en composte.

  Si vous êtes ce genre de salopard capitaliste mais que votre conscience de hypster-bobo s'éveille récemment, ces toilettes sont faites pour vous!

  Il est grand temps de réduire l'empreinte carbone dégueulasse que vous devez à votre indécente consommation de barbaque.",
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
  title: "Le Bagne Turc",
  description: "Avez-vous déjà expérimenté les prisons turques ? Vous en serez probablement dissuadés en sortant de cette expérience.
  Les vétérans de ces toilettes vous recommanderont d'emporter un surin avec vous.

  La légende parle d'u type ayant attrapé le sida en squattant trop bas et touchant la cuvette.

  En revanche pour ce qui est du nom, les anglophones appellent ça des 'French squatting toilets', je vous suggère de ranger vos clichés sur la Turquie dorénavant.",
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
  title: "Des paillettes dans ma vie",
  description: "Paraît-il que c'est sur ce trône qu'Inès Reg a eu l'inspiration de la dite punchline.

  Comme quoi faire le buzz, ça n'a pas de secret : il suffit juste de s'accorder des moments de réfléxion sur des chiottes qui déchirent!

  Libre à vous de considérer si ça vaut la peine d'investir massivement dans des chiottes indécentes pour y avoir des moments de réflexion intenses et déboucher sur des idées de merde.",
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
  description: " Vous avez abusé des gyozas hier soir ?

  Ce bijou vous indiquera même le poids de votre git push. Allez-y, asseyez-vous, fermez les yeux et laissez-vous transporter au Nihon-koku.

  Et on dit merci qui ? Merci Jacquie & -euh non c'est peut-être parti un peu trop loin.",
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
  title: "Les Toilettes du Titanic",
  description: "Vous êtes-vous déjà senti l'âme d'un romantique et pris d'une envie de revivre les derniers instants du Titanic ?

  Personellement chez le Ptit Coin, pas du tout. Mais bon, nous ne sommes pas là pour émettre des jugements de valeur sur vos délires.

  Quoiqu'il en soit, si vous êtes en pleine sortie plongée à la con lors de vos vacances à Bali et qu'une envie pressante vous prend, vous savez où vous rendre.",
  address: "A côté du shipwreck datant de la seconde Guerre Mondiale, Amed, Bali.",
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
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus ex adipisci, atque! Sunt mollitia facere, assumenda ex sequi, perspiciatis reiciendis repellendus consectetur nobis nihil expedita perferendis dolores incidunt quibusdam minima. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deleniti, fugit, quos. Necessitatibus, vel, velit! Ducimus saepe aliquid maiores id magnam inventore laudantium ipsam recusandae amet eaque, at nostrum labore velit.
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus ex adipisci, atque! Sunt mollitia facere, assumenda ex sequi, perspiciatis reiciendis repellendus consectetur nobis nihil expedita perferendis dolores incidunt quibusdam minima. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deleniti, fugit, quos. Necessitatibus, vel, velit! Ducimus saepe aliquid maiores id magnam inventore laudantium ipsam recusandae amet eaque, at nostrum labore velit.",
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
