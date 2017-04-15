package Issue::issue; 

use strict; 
use warnings; 
use Data::Dumper;
use DBI;

our @EXPORT_OK = qw(connect getIssue addIssue updateStatus);
 

sub connect {
	my ($self, $database)= @_; 
	
	my $port = 3306; 
	my $hostname = "0.0.0.0";
	my $username = "abdullah2891";
	my $password =  "";
	my $dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
	my $dbh = DBI->connect($dsn, $username,$password); 
	
	return $dbh; 
}


sub getIssue {
	my ($self, $dbh, $id) = @_ ;
	# my $dbh = shift;

	return +{STATUS=>"ERROR:MISSING DATABASE HANDLER"} unless (defined $dbh);
	my $sql_statement = "SELECT * FROM Issue" ; 
	
	$sql_statement .= " WHERE id  = ?" if ($id); 
	print Dumper($sql_statement);
	
	my $sth = $dbh->prepare($sql_statement); 
	
	$id ? $sth->execute($id) :  $sth->execute()  or die +{STATUS =>"execution failed : $sth->errstr()"}; 
	
	my @issues = (); 
	my $ref;

	while($ref = $sth->fetchrow_hashref() ){
		push @issues ,  $ref;
	}
	
	$sth->finish;
	$dbh->disconnect();
	
	return +{STATUS => "ERROR RETURNING HASH )"} 
				unless ('ARRAY' eq ref \@issues); 
	
	return \@issues; 
	
}

sub addIssue{
	my ($self, %arg) = @_ ; 
	
	my $dbh = $arg{dbh};

	return {STATUS=>"ERROR:MISSING DATABASE HANDLER"} unless (defined $dbh);
	
	my $sth = $dbh->prepare("INSERT INTO Issue (title, owner, description, status) VALUES (?,?,?,?)"); 

	$sth->execute($arg{issue}{title},$arg{issue}{owner}, $arg{issue}{description}, $arg{issue}{status}) 
							 or return +{STATUS =>"Execution failed : $sth->errstr()"};
	
	$sth->finish; 
	$dbh->disconnect();

	return +{STATUS => 'OK' , "Issue" => "Issue created successfully"} ; 
}

sub updateStatus{
	my ($self, %arg) = @_ ; 
	
	my $dbh = $arg{dbh};
	print Dumper(" UPDATE STATUS ");
	
	return +{STATUS=>"ERROR:MISSING DATABASE HANDLER"} unless (defined $dbh);
	return +{STATUS=> "MISSING ID PARAMETER" } unless($arg{ID}); 
	
	my $sth = $dbh->prepare("UPDATE Issue SET `status` = ? where ID = ?"); 
	
	$sth->execute( $arg{issue}{status}, $arg{ID} )
					or return +{STATUS =>"Execution failed : $sth->errstr()"};
	
	
	$sth->finish; 
	# not sure I have to disconnect from database handler
	$dbh->disconnect();
	
	return +{STATUS => 'OK' , "Issue" => "Issue updated successfully"}; 
};