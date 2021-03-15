veebee.vbe

vbe is an VBScript encoded file. 
We need a decoder to decrypt it.

git clone https://github.com/JohnHammond/vbe-decoder.git

`python3 vbe-decoder.py veebee.vbe`

```
                                
' VeeBee goes buzz buzz
'
'
MsgBox("Sorry, not that easy!")
MsgBox("Okay, actually, you're right. It is that easy.")
MsgBox("flag{f805593d933f5433f2a04f082f400d8c}")
```

