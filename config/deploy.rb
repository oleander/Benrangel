set :repository, "git://github.com/Burgestrand/Benrangel.git"
set :revision,   "master"

set :deploy_to,  "benrangel.se"
set :domain,     "localhost:/usr/local/www"
set :shared_paths, shared_paths.merge('assets' => 'public/assets')