# frozen_string_literal: true

if Rails.env.development?
  PASSWORD_ADMIN = 123246
  namespace :dev do
    desc 'Configure development environment'
    task setup: :environment do
      puts '------> Setup'
      show_msg_spinner('Dropped database..') { `rails db:drop` }
      show_msg_spinner('Created database..') { `rails db:create` }
      show_msg_spinner('Migrating..') { `rails db:migrate` }
      show_msg_spinner('Create default Admin..') { `rails dev:add_default_admin` }
      show_msg_spinner('Create Admins - Faker..') { `rails dev:add_admins` }
      show_msg_spinner('Create default User..') { `rails dev:add_default_user` }
    end

    desc 'Create default Admin'
    task add_default_admin: :environment do
      Admin.create!(email: 'admin@gmail.com', password: PASSWORD_ADMIN, password_confirmation: PASSWORD_ADMIN)
    end

    desc 'Create Admins - Faker'
    task add_admins: :environment do
      10.times do |_i|
        Admin.create!(email: Faker::Internet.email, password: PASSWORD_ADMIN, password_confirmation: PASSWORD_ADMIN)
      end
    end

    desc 'Create default User'
    task add_default_user: :environment do
      User.create!(email: 'user@gmail.com', password: '123456',
                   password_confirmation: '123456', user_name: 'User Default')
    end
  end

  def show_msg_spinner(start)
    spinner = TTY::Spinner.new("[:spinner] #{start}")
    spinner.auto_spin
    yield
    spinner.success('(successful)')
  end
end
