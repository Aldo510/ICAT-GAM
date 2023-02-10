# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

web: rake db:migrate && bin/rails server -b 0.0.0.0 -p ${PORT:-3000} 