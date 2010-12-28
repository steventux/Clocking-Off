require 'machinist/active_record'
require 'sham'
require 'faker'
require 'machinist/object'
#require 'lib/faker_extras'

# Shams - generated filler values
#
chars = ['A'..'Z', 'a'..'z'].map{|r|r.to_a}.flatten

Sham.define do
#  person_name     { Faker::Name.name }
#  # Make a fake username that passes validation
#  login           { Array.new(20).map{chars[rand(chars.size)]}.join  }
#  email           { Faker::Internet.email}
#  telephone       { Faker::PhoneNumber.phone_number}
#  client_id       { Faker::PhoneNumber.phone_number }
end

Event.blueprint do
  name { Faker::Lorem.words(4).join ' ' }
  start_at { Time.local(2010,12,25,10,30) }
  end_at { Time.local(2010, 12,25,12,30) }
end
