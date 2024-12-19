# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Account
User.create! :legal_first_name => 'John', :legal_last_name => "Doe", :preferred_first_name => 'John', :preferred_last_name => "Doe", :email => 'dev@dev.com', :password => 'password', :password_confirmation => 'password', :confirmed_at => DateTime.now, :dob => "01/01/1970", :phone_number => "++44 0000 123456"

# Test Application
Application.create! :name => "Test", :client_secret => "HelloWorld", :approved => true