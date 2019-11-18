10.times do
  Toilet.destroy_all
  toilet = {
    title: "Chiotte beau",
    description: "Super beau c'est genial",
    address:"80 rue curial 808787 Paris",
    toilet_type: Toilet::TOILET_TYPES.sample,
    capacity: rand(1..3),
    gender: Toilet::GENDERS.sample,
    is_noiseproof: [true, false].sample,
    is_pro: [true, false].sample,
    user: User.first
  }
  trone = Toilet.new(toilet)
  trone.save!
end
