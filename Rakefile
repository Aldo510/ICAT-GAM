# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

release: bin/rails db:migrate
web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV