# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create sample users
puts "Creating sample users..."

# Admin user
admin = User.where(email: "admin@jhoom.com").first_or_initialize
admin.update!(
  name: "Admin User",
  password: "password",
  password_confirmation: "password",
  confirmed_at: Time.current
)
puts "Admin user created or updated: #{admin.email}"

# Demo user
demo = User.where(email: "demo@jhoom.com").first_or_initialize
demo.update!(
  name: "Demo User",
  password: "password",
  password_confirmation: "password",
  confirmed_at: Time.current
)
puts "Demo user created or updated: #{demo.email}"

# Test users
3.times do |i|
  user = User.where(email: "user#{i+1}@jhoom.com").first_or_initialize
  user.update!(
    name: "Test User #{i+1}",
    password: "password",
    password_confirmation: "password",
    confirmed_at: Time.current
  )
  puts "Test user created or updated: #{user.email}"
end

puts "Seed data creation complete!"
