#Classe permettant de g"rer l'historique de fichier traité
class CtrlHistoLink
	#Saisie pour vérification de lien stocké en historique
  	def saisie 
		@v = VueHisto.new(self,"Historique") #creation vue 
		@v.getWindow.show_all # affichage
		Gtk.main
		return @urls
  	end
  	#Sauvegarde les liens dans un fichier pour historique
	def sauv(fileName, urls)  
		fileName = File.basename(fileName)
		f = File.new("../sauv/#{fileName}", "w+")
		f.write(urls)
		f.close
	end

	#Permet de rejouer les liens d'un fichier
	def rejouer(fileName)
		r = CtrlCheckLinks.new
		@urls = r.recupUrls(fileName)
	end

	#Controleur permettant de detruire la vue historique
	def destructionFen  
    	@v.getWindow.destroy
    	Gtk.main_quit
  	end

end