set :repository, "git://github.com/Burgestrand/Benrangel.git"
set :revision,   "master"

set :deploy_to,  "/opt/www/benrangel.se"
set :domain,     "webmaster@burken"
set :shared_paths, shared_paths.merge({
  'assets' => 'public/assets',
  'bundle' => 'vendor/bundle'
})
set :bundler_cmd, 'bundle install --deployment --without=development,test'