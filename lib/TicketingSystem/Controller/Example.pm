package TicketingSystem::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';
use Issue::issue;
use Data::Dumper; 

# This action will render a template
sub welcome {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  $self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}



sub get_issue {
  my $self = shift; 
  
  my $dbh = Issue::issue->connect('ticketSystem');
  
  my $issue = Issue::issue->getIssue($dbh); 
  
  $self->render(json=>{status=>'OK', response=>$issue});

}

sub post_issue{
  my $self = shift; 
  
  my $request = $self->req->json;
  
  my $dbh = Issue::issue->connect('ticketSystem'); 

  $request->{dbh} = $dbh;
  
  my $issue_status = Issue::issue->addIssue(%$request);
 
  $self->render(json=>{status=>'OK',response=>"Issue Created successfully " });
}

1;
