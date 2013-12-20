#! /usr/bin/ruby

#lib
require 'gtk2' # lib graphique
require 'net/ping' #lib netwotk

#include
require '../m/ReadFile'
require '../m/ReadFolder'
require '../v/Vue1'
require '../v/VueError'

"../fichier/".liste_rep #à ajouter à vue 1

Gtk.init
v1 = Vue1.new

v1.listenerBouton
v1.listenerDestroy

v1.getWindow.show_all
Gtk.main
str = v1.getEntry
str = "../fichier/" + str

if(File.exist?(str))
  f = ReadFile.new(str)
  url = f.getUrls
else
  vd = VueError.new("Fichier inexistant")
  vd.getDialog.run
  vd.getDialog.destroy  
end

url.each { |n| # faire une vue affichage
 p = Net::Ping::HTTP.new n , 80
 if p.ping?
  puts n + " est vivant" 
 else
  puts n + " est mort"
 end
}

 





print "Termine\n"