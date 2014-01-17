#! /usr/bin/ruby

#lib
require 'gtk2' # lib graphique
require 'net/ping' #lib netwotk

#include
require './CtrlCheckLinks'
require './CtrlHistoLink'
require '../m/ReadFile'
require '../v/Vue1'
require '../v/VueResult'
require '../v/VueMenu'
require '../v/VueHisto'

#Classe principal du controleur main
class Main
	# Controleur du menu de départ
	def menu 
	
		@v = VueMenu.new(self,"Menu")
		@v.getWindow.show_all # affichage
	    Gtk.main
	end

	# Controleur historique
	def histo 
		c = CtrlHistoLink.new
		urls = c.saisie
	end

	# Controleur vérification d'un fichier
	def newVerifFile 
		c = CtrlCheckLinks.new
 		urls = c.saisie(1)
	end

	# Controleur vérification d'un dossier
	def newVerifDossier 
		c = CtrlCheckLinks.new
 		urls = c.saisie(0)
	end

	# Controleur permettant de detruire la vue menu
	def destructionMenu
    	@v.getWindow.destroy
    	Gtk.main_quit
  	end
	
end

c = Main.new
c.menu

print "Termine\n"