package Issue::issue; 

use strict; 
use warnings; 
use Data::Dumper;
use DBI;

our @EXPORT_OK = qw(connect getIssue addIssue);
 

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
    

    return +{STATUS=>"ERROR:MISSING DATABASE HANDLER"} unless (defined $dbh);
    
    my $sth = $dbh->prepare("SELECT * FROM Issue"); 
    
    $sth->execute() or die +{STATUS =>"execution failed : $sth->errstr()"}; 
    
    my $issues = {}; 
    my $ref;
    while($ref = $sth->fetchrow_hashref() ){
        $issues->{ $ref->{ID} } = $ref;
    }
    
    print Dumper($issues);

    $sth->finish;
    $dbh->disconnect();
    
    return +{STATUS => "ERROR RETURNING HASH )"} unless ('HASH' eq ref $issues); 
    
    return +{STATUS => 'OK' , "Issue" => $issues}; 
    
}

sub addIssue{
    my ($self, %arg) = @_ ; 
    
    
    
    my $dbh = $arg{dbh};

    return {STATUS=>"ERROR:MISSING DATABASE HANDLER"} unless (defined $dbh);
    
    my $sth = $dbh->prepare("INSERT INTO Issue (title, owner, description, status) VALUES (?,?,?,?)"); 

    $sth->execute($arg{title},$arg{owner}, $arg{description}, $arg{status}) 
                             or return +{STATUS =>"Execution failed : $sth->errstr()"};
    
    $sth->finish; 
    $dbh->disconnect();

    return +{STATUS => 'OK' , "Issue" => "Issue created successfully"} ; 
}

sub updateIssue{
    my ($self, $dbh ,$fields) = @_ ; 
    
    return 1; 
}


1;