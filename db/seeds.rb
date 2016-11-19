# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(first_name: 'Brian', last_name: 'Dorton', email: 'brian.dorton@theironyard.com', password: '12345678', role: 'admin', remote_profile_image_url: 'https://avatars3.githubusercontent.com/u/662645?v=3&s=460')


def create_users
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.email
  user.password = Faker::Internet.password(8)
  user.role = "client"
  user.company = Faker::Company.name
  user.remote_profile_image_url = Faker::Avatar.image
  user.save!
  user
end

def create_projects(user, admin)
  project = Project.new
  project.name = Faker::Hacker.say_something_smart
  project.users << user
  project.users << admin
  project.save!
  project
end

def create_project_documents(project)
  doc = ProjectDocument.new
  doc.remote_file_url = Faker::Placeholdit.image
  doc.project_id = project.id
  doc.save!
  doc
end

def create_comments(project, user, document)
  (3..10).to_a.sample.times do
    comment = Comment.new
    comment.body = Faker::ChuckNorris.fact
    comment.user_id = user.id
    comment.project_id = project.id
    comment.project_document_id = document.id
    comment.save!
    comment
  end
end

dorton = admin

10.times do
  create_users
end

User.where(role: 'client').each do |user|
  (3..5).to_a.sample.times do
    create_projects(user, User.where(role: 'admin').first)
  end
end

Project.all.each do |project|
  (2..5).to_a.sample.times do
    user = project.users.all.sample
    doc = create_project_documents(project)
    create_comments(project, user, doc)
  end
end
