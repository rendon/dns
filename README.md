Environment Manager
===================
Dealing with development, testing, and production environments at the same time and only one machine? I know, it's tedious. For me, the ideal would be to have two (or three) machines, one only for development, one for testing, and one more for monitoring my software in production.

Unfortunately I only have one machine and one of my problems is having to edit `/etc/hosts` when moving from development to testing, or if I want to connect to my production servers to check something out.

This tool aims to solve this problem, change your environment with a single command.

Install
=======

    gem install envman

How to use
==========
The first step is to define a profile, in this profile we'll specify our list of domain names, and the corresponding values for the different environments.

    > envman init


Or you can create the file manually, *envman* uses a yml file for storing this information.

    config 1: ...
    config 2: ...

Let's say you are in development mode and wanna check something out in your production servers, type:

    > envman prod

And now all your names in /etc/hosts will be pointing to production servers, BE CAREFUL!.

Okay, everything is going well in production, let's go back to development:

    > envman dev

Now, let's deploy to our testing servers, we don't wanna experiment in production servers, right?:

    > envman test

Now you can deploy, upload files, make queries, etc., using the same domain names, but all is pointing to our testing servers.

Yeah!!
