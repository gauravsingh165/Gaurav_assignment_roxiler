# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

admin_role = Role.find_or_create_by(name: 'Admin')
candidate_role = Role.find_or_create_by(name: 'Candidate')

admin = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'admin123',
  role: admin_role
)

2.times do |i|
  candidate = User.create!(
    name: "Candidate #{i+1}",
    email: "candidate#{i+1}@example.com",
    password: 'password',
    role: candidate_role
  )

  2.times do |j|
    candidate.job_applications.create!(
      title: "Job #{j+1} for #{candidate.name}",
      status: ['pending', 'reviewed'].sample
    )
  end
end
