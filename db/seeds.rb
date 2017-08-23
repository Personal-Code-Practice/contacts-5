# 40.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name

#   contact = Contact.new(first_name: first_name,
#    last_name: last_name,
#    email: "#{first_name.first}.#{last_name}@gmail.com",
#    phone: Faker::PhoneNumber.phone_number)
#   contact.save
# end

# @contacts = Contact.all 

# @contacts.each do |contact|
#   contact.update(user_id: rand(1..2))
# end

  # Contact.all.each do |contact|
  #   ContactGroup.create(group_id: rand(1...3), contact_id: contact_id)
  # end


