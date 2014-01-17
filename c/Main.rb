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

#Controleur du menu principal de l'application
class Menu
	# <b>Controleur du menu d'acceuil VueMenu</b>
	def initialize
		@v = VueMenu.new(self,"Menu")
		@v.getWindow.show_all # affichage
	    Gtk.main
	end

	#  <b>Acces au controleur CtrlHistoLink</b>
	def histo 
		@v.getWindow.hide_all #cache le menu
		c = CtrlHistoLink.new
		urls = c.saisie
		@v.getWindow.show_all #reaffiche le menu
	end

	# <b>Acces au controleur vérification d'un fichier CtrlCheckLinks</b>
	def newVerifFile 
		@v.getWindow.hide_all #cache le menu
		c = CtrlCheckLinks.new
 		urls = c.saisie(1, 'Saisie nom fichier')
 		@v.getWindow.show_all #reaffiche le menu
	end

	# <b>Acces au controleur vérification d'un dossier CtrlCheckLinks</b>
	def newVerifDossier 
		@v.getWindow.hide_all #cache le menu
		c = CtrlCheckLinks.new
 		urls = c.saisie(0, 'Saisie nom dossier')
 		@v.getWindow.show_all #reaffiche le menu
	end

	# <b>Controleur permettant de detruire la VueMenu</b>
	def destructionMenu
    	@v.getWindow.destroy
    	Gtk.main_quit
  	end
	
end

Menu.new

print "Termine\n"