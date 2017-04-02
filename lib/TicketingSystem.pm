package TicketingSystem;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;
  
  
  # Normal route to controller
  $r->get('/')->to('example#welcome');
  $r->get('/issues')->to('example#get_issue');
  $r->post('/issues')->to('example#post_issue');
  $r->put('/issues')->to('example#update_status');
}

1;
