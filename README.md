DNS Manager
===================
Dealing with development, testing, and production environments at the same time and only one machine? I know, it's tedious. For me, the ideal would be to have two (or three) machines, one only for development, one for testing, and one more for monitoring my software in production.

Unfortunately I only have one machine and one of my problems is having to edit `/etc/hosts` when moving from development to testing, or if I want to connect to my production servers to check something out.

This tool aims to solve this problem, change your environment with a single command.

Install
=======

    gem install dnsman

How to use
==========
The first step is to initialize dnsman and specify one of the available tasks.

    > dnsman init

The previous command will create (if doesn't exists already) a file called `dns.yml` in the `~/.dnsman/` directory. There you can define a list of domain names for the different environments, for example:

    # dns.yml
    development:
        mongodb-server: 127.0.0.1
        api-server: 127.0.0.1

    test:
        mongodb-server: 52.27.2.2
        api-server: 52.27.2.2

    production:
        mongodb-server: 52.100.1.1
        api-server: 52.100.1.2
        

Let's say you are in development mode and wanna check something out in your production servers, type:

    > dnsman production

And now all your names in /etc/hosts will be pointing to production servers, BE CAREFUL!.

Okay, everything is going well in production, let's go back to development:

    > dnsman dev

Now, let's deploy to our testing servers, we don't wanna experiment in production servers, right?

    > dnsman test

Now you can deploy, upload files, make queries, etc., using the same domain names, but all is pointing to our testing servers.

Finally, you can reset your environment using:

    > dnsman reset

This will restore the original `/etc/hosts` file, as it was before starting using dnsman.

Yeah!!
