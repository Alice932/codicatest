require 'faker'


admin = User.create_with(password: '12345678').find_or_create_by(
  username: Faker::Games::Witcher.witcher,
  email: 'admin@test.com',
  role: :admin,
  phone: Faker::Number.number(digits: 7)
)

puts 'Admin user created!'

patient_1 = Patient.create!(name: Faker::Games::Witcher.monster)

User.create_with(password: '12345678').find_or_create_by(
  username: patient_1.name,
  email: 'patient1@test.com',
  role: :patient,
  phone: Faker::Number.number(digits: 7)
)

patient_2 = Patient.create!(name: Faker::Games::Witcher.monster)

User.create_with(password: '12345678').find_or_create_by(
  username: patient_2.name,
  email: 'patient2@test.com',
  role: :patient,
  phone: Faker::Number.number(digits: 7)
)

patient_3 = Patient.create!(name: Faker::Games::Witcher.monster)

User.create_with(password: '12345678').find_or_create_by(
  username: patient_3.name,
  email: 'patient3@test.com',
  role: :patient,
  phone: Faker::Number.number(digits: 7)
)


doctor_1 = Doctor.create!(name: Faker::Games::Witcher.character)

User.create_with(password: '12345678').find_or_create_by(
  username: doctor_1.name,
  email: 'doctor1@test.com',
  role: :doctor,
  phone: Faker::Number.number(digits: 7)
)

doctor_2 = Doctor.create!(name: Faker::Games::Witcher.character)

User.create_with(password: '12345678').find_or_create_by(
  username: doctor_2.name,
  email: 'doctor2@test.com',
  role: :doctor,
  phone: Faker::Number.number(digits: 7)
)

doctor_3 = Doctor.create!(name: Faker::Games::Witcher.character)

User.create_with(password: '12345678').find_or_create_by(
  username: doctor_3.name,
  email: 'doctor3@test.com',
  role: :doctor,
  phone: Faker::Number.number(digits: 7)
)


Appointment.create!(
  doctor_id: doctor_1.id,
  patient_id: patient_1.id,
  description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote
)
Appointment.create!(
  doctor_id: doctor_1.id,
  patient_id: patient_2.id,
  description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote
)
Appointment.create!(
  doctor_id: doctor_2.id,
  patient_id: patient_1.id,
  description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote
)
Appointment.create!(
  doctor_id: doctor_3.id,
  patient_id: patient_3.id,
  description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote
)
