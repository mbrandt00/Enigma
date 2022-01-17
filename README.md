# Enigma!
## Encrypting, Cracking, and Decoding Messages with the Command line with Ruby!
![Alt Text](https://c.tenor.com/qhCxxfVk6QMAAAAC/based-hack.gif)

Image source<sup>[1](#footnote)</sup>

## Overview
The *Enigma* Project is based on codebreaking in WW2. British codebreaker, [Alan Turing](https://en.wikipedia.org/wiki/Alan_Turing) <sup>[2](#footnote)</sup>, with assistance of Polish mathematicians and espionage, cracked the Nazi's enigma encryption, ultimately  shortening the war and saving potentially millions of lives. The encryption algorithm was believed to be so secure that it was used to encrypt all German military and broadcasted over open radio.

This encryption algorithm is based on a ceasar cipher with four distinct shifts.
## Example
As an example take the message "hello world." A possible shift pattern could be
`{A => 3, B => 27, C => 2 D => 8}`
The shift pattern is created through a complex transformation and summation of the date and key which are provided by the user. It is important to note that only valid characters a-z and spaces are encrypted, the rest are simply transcribed.

 - In this example, the A shifter would shift every 4th letter of "hello world" to
 #### [k]ell[r] wo[u]ld!
 - The B shift would take this last string "kellr would!" and start on the second letter (e) and shift every four. Since there are 27 characters (a-z + spaces) the characters would functionally remain the same

 #### k[e]llr[ ]wo[u]ld!
 - The C shift would start on the third letter (l) and shift every fourth letter from this starting position by 2 from "kellr would!" to  
 #### ke[n]lr [y]orl[f]!
 - the D shift wold start on the fourth letter of "kenlr yorlf!", (l), and transform each fourth letter from the starting position by 8 to
 #### ken[t]r y[w]lf[!]

 Although ! should be transformed, since it is not in our set of valid characters, it is left as is.

#### Thus our string is encrypted via four ceasar cipher shifts from `hello_world => kentr ywlf!`

Decryption would work in a similar way, just instead of shifting characters forward, characters are shifted backwards to return the original string.

## Usage
The *Enigma* program can be run from the command line. Simply clone the repo and navigate to the root directory. For encryption, use the following syntax, where the first argument is the file containing the plain .txt file to be encrypted and the second argument is the name of the .txt file that will be created with the encrypted text.

```shell
ruby ./lib/encrypt.rb message.txt encrypted.txt
```

Decryption is similar. To decrypt a message, four arguments are required. (1) the encrypted .txt. file, (2) the new file which contains the unencrypted text, (3) the code used for decryption (note this down when encrypting), and (4) the date of encryption in MMDDYY format (for instance April 1, 1932) would be represented 040132.

```shell
ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 12345 040132
```

To crack an encrypted message without knowing the key, use the following syntax (the last argument is the formatted date):

```shell
ruby ./lib/crack.rb encrypted.txt cracked.txt 040132
```

## Self Assessment

As part of the submission requirements for this project. I was asked to assess my performance on Functionality, OOP, Ruby Conventions, and TDD according to [this rubric](https://backend.turing.io/module1/projects/enigma/rubric).

||Functionality |Object Oriented Programming |Ruby Conventions and Mechanics|Test Driven Development|
|:---:|:---:|:---:|:---:|:---:|
| Score | 4 | 4 | 4 | 4 |


<sup><a name="footnote">1</a></sup> By Kyrah - <a rel="nofollow" class="external text" href="https://tenor.com/view/based-hack-hacker-security-cryptography-gif-19828021">Based Hack GIF</a>, uploaded 1/4/2021

<sup><a name="footnote">2</a></sup> Wikipedia contributors. (2022, January 14). Alan Turing. In Wikipedia, The Free Encyclopedia. Retrieved 18:55, January 14, 2022</a></sup>
