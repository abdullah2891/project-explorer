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

sub custom_header{
	my $self = shift; 
	print Dumper("custom header rerouted");
	$self->req->headers->header('Access-Control-Allow-Origin' => 'https://ember-workspace-abdullah2891.c9users.io');
	$self->res->headers->header('Access-Control-Allow-Origin' => 'https://ember-workspace-abdullah2891.c9users.io');
	$self->res->headers->header('Access-Control-Allow-Methods' =>'GET, OPTIONS, POST, DELETE, PUT');
	$self->res->headers->header('Access-Control-Allow-Headers' => 'Content-Type, X-CSRF-Token');

	
	$self->respond_to(any => { data => '', status => 200 });

}

sub get_issue {
	my $self = shift; 
	
	my $id = $self->stash('id'); 
	print Dumper($id); 
	
	
	my $dbh = Issue::issue->connect('ticketSystem');
	
	my $issue = Issue::issue->getIssue($dbh, $id); 
	$self->res->headers->header('Access-Control-Allow-Origin' => '*');
	$self->render(json=>{status=>'OK', issue => $issue});

}

sub post_issue{
	my $self = shift; 
	
	print Dumper("posting issue");
	
	my $request = $self->req->json;
	
	$request->{dbh} = Issue::issue->connect('ticketSystem'); 

	my $issue_status = Issue::issue->addIssue(%$request);
	$self->res->headers->header('Access-Control-Allow-Origin' => '*');
	$self->render(json=>{status=>'OK',response=>"Issue Created successfully " });
}

sub update_status{
	my $self = shift; 
	my $id= $self->stash('id'); 
	
	my $request = $self->req->json;

	print Dumper($id); 
	$request->{ID} = $id; 
	$self->res->headers->header('Access-Control-Allow-Origin' => '*');

		
	$request->{dbh} = Issue::issue->connect('ticketSystem'); 
	
	my $issue_status = Issue::issue->updateStatus(%$request);

	$self->render(json=>{status=>'OK',response=>"Issue is updated successfully"});  
}

1;
