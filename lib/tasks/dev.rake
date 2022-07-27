namespace :dev do
  desc 'Configures development environment'
  task setup: :environment do
    `rails db:drop db:create db:migrate db:seed`
  end
end
