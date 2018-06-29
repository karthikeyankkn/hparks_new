##########staging code############hparks.getspini.in##################
role :app, %w{ubuntu@54.169.244.126}
role :web, %w{ubuntu@54.169.244.126}
role :db,  %w{ubuntu@54.169.244.126}
set :ssh_options, {
  keys: %w(~/.ssh/kp_1.pem),
  forward_agent: false,
  auth_methods: %w(publickey password)
}