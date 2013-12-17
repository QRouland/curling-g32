#! /usr/bin/ruby

#lib
require 'gtk2' # lib graphique
require 'net-ping' #lib netwotk

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
#print str

if(File.exist?(str))
  f = ReadFile.new(str)
  tabL = f.getLines

  for i in tabL
    puts i
  end
else
    vd = VueError.new("Fichier inexistant")
    vd.getDialog.run
    vd.getDialog.destroy  
end





print "Termine\n"