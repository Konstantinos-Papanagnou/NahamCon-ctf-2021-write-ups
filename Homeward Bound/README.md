# Homeward Bound 

This challenge was prompting us with the message: `Sorry, this page is not accessible externally.` which means there is a filter that checks whether the request came from within the server or a specific set of ips.
We should be able to bypass it if we manage to trick the server that the request is coming from within itself. (127.0.0.1)
The simplest way to do that is with a header manipulation technique. We can capture the request before it gets to the server with BurpSuite and modify a header value to trick the server into thinking the request is actually made from 127.0.0.127
So we use some of these headers 

```
X-Originating-IP: 127.0.0.1 
X-Forwarded-For: 127.0.0.1 
X-Remote-IP: 127.0.0.1 
X-Remote-Addr: 127.0.0.1
```

The header that works for us is the X-Forwarded-For one and after adding it into our request we successfully get our flag:
```
<b>Welcome!</b> Your internal access key is: <code>flag{26080a2216e95746ec3e932002b9baa4}</code>
```

