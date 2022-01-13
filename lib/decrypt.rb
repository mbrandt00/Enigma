require './lib/CLIdecrypt'
# ruby ./lib/crack.rb encrypted.txt cracked.txt 240818
a = CLIdecrypt.new(false) #takes date
a.decrypt_to_file
