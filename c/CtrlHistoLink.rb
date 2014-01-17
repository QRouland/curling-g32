#Classe permettant de gzrer l'historique de fichier traité et la vue VueHisto
class CtrlHistoLink
	# <b>Saisie pour vérification de lien stocké en historique, controleur VueHisto</b>
  	def saisie 
		@v = VueHisto.new(self,"Historique") #creation vue 
		@v.getWindow.show_all # affichage
		Gtk.main
  	end
  	# <b>Sauvegarde les liens dans un fichier pour historique</b>
  	# * String pathName : chemin du fichier à mettre en historique
  	# * String urls : liste urls à sauver dans l'historique
	def sauv(pathName, urls)  
		pathName = File.basename(pathName)
		f = File.new("../sauv/#{pathName}", "w+")
		f.write(urls)
		f.close
	end

	# <b>Permet de rejouer les liens d'un fichier</b>
	# * Sting pathName : chemin du fichier de l'historique à rejouer
	def rejouer(pathName)
		r = CtrlCheckLinks.new
		@urls = r.recupUrls(pathName)
	end

	# <b>Controleur permettant de detruire la vue historique</b>
	def destructionFen  
    	@v.getWindow.destroy
    	Gtk.main_quit
  	end

end