#! /usr/bin/ruby

#lib
require 'gtk2' # lib graphique
require 'net/http' #lib netwotk
require 'uri'
#include
require '../m/ReadFile'
require '../v/Vue1'
require '../v/VueError'


Gtk.init
v1 = Vue1.new

v1.listenerBouton
v1.listenerDestroy

v1.getWindow.show_all
Gtk.main
str = v1.getEntry

if(File.exist?(str))
  f = ReadFile.new(str)
  url = f.getUrls
  puts url
  
else
    vd = VueError.new("Fichier inexistant")
    vd.getDialog.run
    vd.getDialog.destroy  
end





# def ping(host)
# begin
#  url=URI.parse(host)
#  start_time = Time.now
#  response=Net::HTTP.get(url)
#  end_time = Time.now - start_time
#    if response==""
#      return false
#    else
#      puts "response time : #{end_time}"
#      return true
#    end
#    rescue Errno::ECONNREFUSED
#      return false
#  end
# end
# 
# if(ping "")
#   puts('vrai')
# else
#   puts('faux')
# end



print "Termine\n"