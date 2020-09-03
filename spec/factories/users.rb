FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    first_name            { '鈴木' }
    last_name             { '花子' }
    first_name_reading    { 'スズキ' }
    last_name_reading     { 'ハナコ' }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birth_date { '1930-02-01' }
  end
end
