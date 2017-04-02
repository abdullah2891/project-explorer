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
  $self->res->headers->header('Access-Control-Allow-Origin' => '*');
  $self->render(json=>{status=>'OK', issue => $issue});

}

sub post_issue{
  my $self = shift; 
  
  my $request = $self->req->json;
  
  $request->{dbh} = Issue::issue->connect('ticketSystem'); 

  my $issue_status = Issue::issue->addIssue(%$request);
  $self->res->headers->header('Access-Control-Allow-Origin' => '*');
  $self->render(json=>{status=>'OK',response=>"Issue Created successfully " });
}

sub update_status{
  my $self = shift; 
  
  my $request = $self->req->json;
  
  $request->{dbh} = Issue::issue->connect('ticketSystem'); 
  
  my $issue_status = Issue::issue->updateStatus(%$request);
  $self->res->headers->header('Access-Control-Allow-Origin' => '*');
  $self->render(json=>{status=>'OK',response=>"Issue is updated successfully"});  
}

1;
