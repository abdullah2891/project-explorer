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
  $r->get('/issue')->to('example#get_issue');
  $r->post('/issue')->to('example#post_issue');
  
}

1;
