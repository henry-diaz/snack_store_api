namespace :start do
  # Starts foreman with the Procfile.dev
  # Which runs rails server on port 3001 and client npm on port 3000
  desc 'Start dev server'
  task :development do
    exec 'foreman start -f Procfile.dev'
  end

  # We can test our production build locally running rake start:production
  # This task will run foreman in production env, with our Procfile file and
  # kickstart the rails server from public directory (Which now contains our
  # build client)
  desc 'Start production server'
  task :production do
    exec 'NPM_CONFIG_PRODUCTION=true npm run postinstall && foreman start'
  end
end
# rake start by default run the dev environment
task :start => 'start:development'
