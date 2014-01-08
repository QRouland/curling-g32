#! /usr/bin/ruby

#lib
require 'gtk2' # lib graphique
require 'net/ping' #lib netwotk

#include
require './CtrlCheckLinks'
require '../m/ReadFile'
require '../m/ReadFolder'
require '../v/Vue1'
require '../v/VueResult'

  c = CtrlCheckLinks.new
  urls = c.saisie
while urls!=nil
  c = CtrlCheckLinks.new
  urls = c.saisie
end
print "Termine\n"