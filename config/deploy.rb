set :repository, "git://github.com/Burgestrand/Benrangel.git"
set :revision,   "master"

set :deploy_to,  "/usr/local/www/benrangel.se"
set :domain,     "localhost"
set :shared_paths, shared_paths.merge({
  'assets' => 'public/assets',
  'bundle' => 'vendor/bundle'
})
set :bundler_cmd, 'bundle install --deployment --without=development,test'