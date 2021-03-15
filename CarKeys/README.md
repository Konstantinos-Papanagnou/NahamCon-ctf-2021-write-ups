# Car Keys

We are prompted with `ygqa{6y980e0101e8qq361977eqe06508q3rt}` at the flag info with a QWERTY hint as well...

First thing that came into my mind was a rot13 or rot47 algorithm but it wasn't that
Maybe the QWERTY is a key in which case this could be a vigenere cipher but no matter the combination it wouldn't work.

Turns out it is a ceasar's cipher with a key. Googling Ceasar's cipher with key we get this website `https://www.boxentriq.com/code-breaking/keyed-caesar-cipher`
Decrypting the message with `QWERTY` as a key we get the flag

flag{6f980c0101c8aa361977cac06508a3de}