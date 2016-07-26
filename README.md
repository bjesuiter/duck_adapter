# duck_adapter

#### Description
A dart library for using duck cli file transfer tool. 
This library is intended to be used with [grinder](https://github.com/google/grinder.dart)
to allow automated deployments.

    The universal file transfer tool duck which runs in your shell on Linux and OS X 
    or your Windows command line prompt. 
    Edit files on remote servers, download, upload and copy between servers with 
    FTP, SFTP or WebDAV plus support for cloud storage Amazon S3 & OpenStack Swift deployments.

See [duck wiki](https://trac.cyberduck.io/wiki/help/en/howto/cli) 
for more information on the cli tool

#### The gui version - Cyberduck
    Cyberduck is a libre FTP, SFTP, WebDAV, S3, Backblaze B2, 
    Azure & OpenStack Swift browser for Mac and Windows.
    
- See [cyberduck.io](https://cyberduck.io/?l=de) for more information on cyberduck.  

## Setup 

This library requires the "duck" executable to be available in path environment.
Please use the instructions at [duck.sh](https://duck.sh/) for more information on installing
the duck cli tool.

For using this with grinder, please setup grinder like described on the page 
[https://github.com/google/grinder.dart]