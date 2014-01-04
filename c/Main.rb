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

while 1
  c = CtrlCheckLinks.new
  urls = c.saisie
  if(urls !=nil)
    resultats = c.verifLiens(urls)
    c.vueResult(resultats)
  else
    break
  end
end
print "Termine\n"