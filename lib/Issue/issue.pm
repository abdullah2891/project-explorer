package Issue::issue; 

use strict; 
use warnings; 
use Data::Dumper;
use DBI;

our @EXPORT_OK = qw(connect getIssue);
 

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
    my ($self, $dbh) = @_ ;
    
    my $sth = $dbh->prepare("SELECT * FROM Issue"); 
    
    $sth->execute() or die +{STATUS =>"execution failed : $sth->errstr()"}; 
    
    my $issues = $sth->fetchrow_hashref(); 
    
    $sth->finish;
    
    return +{STATUS => "ERROR RETURNING ARRAYS  $sth->errstr()"} unless ('HASH' eq ref $issues); 
    
    return +{STATUS => 'OK' , "Issue" => $issues}; 
    
}



1;