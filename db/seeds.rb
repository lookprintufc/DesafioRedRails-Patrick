#Cadastrar place_type
PlaceType.create  name: 'Casa'
PlaceType.create  name: 'Hospedaria'
PlaceType.create  name: 'Apartamento'

#Cadastrar Comodidades
Amenitie.create name: 'Permitido animais'
Amenitie.create name: 'Internet Sem Fio'
Amenitie.create name: 'TV a Cabo'

User.create first_name: 'Patrick', last_name: 'Magalhães', email: 'pixelzip0@gmail.com', password: '123456'


for i in 0..10
  user = Place.new do |user|
    user.title = Faker::Space.agency
    user.description = "Charming and romantic, Charming and romantic,Charming and romantic, Charming and romantic,"
    user.place_type_id = 3

    user.room_limit = 5
    user.bed_limit = 3
    user.bathroom_limit = 2
    user.address = Faker::Address.street_address
    user.price = Faker::Number.decimal(3, 3)
    user.user_id = 1
    user.accomodate_limit = 5
    user.photo = ['padrao.png','padrao1.jpg'].sample


  end

  if user.save!
  

  # Rails.logger.info "#{user.name} foi adicionado"
  else
  # Rails.logger.info "Não foi possível adicionar #{user.name}. Erros:\n\t #{user.errors.full_messages}"
  end


end