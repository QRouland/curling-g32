# Controleur de la vérification de la validité des liens ainsi que la vue Vue1 et VueResult
class CtrlCheckLinks
  # <b>Controleur de la saisie pour vérification de lien, controleur Vue1</b>
  # * int type : permet de modifier la vue si 1 -> fichier sinon dossier
  # * string title : titre fenetre de la vue qui va etre genere
  # * return : String des urls trouvés
  def saisie(type, title) 
    @v1 = Vue1.new(self, title, type) #creation vue principal
    @v1.getWindow.show_all # affichage
    Gtk.main
  end
  # <b>Controleur de recuperation et verification de liens dans 1 fichiers</b>
  # * string str : chemin d'accès au fichier à traiter
  def recupUrls(str) 
    f = ReadFile.new(str)
    @urls = f.getUrls
    self.vueResult(self.verifLiens(@urls), str)
    s = CtrlHistoLink.new #on enregistre dans l'histo le verif du lien
    s.sauv(str, @urls)
  end
  # <b>Controleur de recuperation et verification de liens dans 1 dossier</b>
  # * string str : chemin d'accès au fichier à traiter
  def recupUrlsDoss(str) 
    d = Dir.open(str)
    liste_exclus = [".", ".."]
    liste_dir = d.sort - liste_exclus
    liste_dir.each { |fichier| #pour chaque fichier touvé
      if (File.ftype(str + "/" + fichier) == "file")
          self.recupUrls(str + "/" + fichier)
      end
     }             
  end
  # <b>Controleur permettant de detruire la vue Vue1</b>
  def destructionFen 
    @v1.getWindow.destroy
    Gtk.main_quit
  end
  # <b>Controleur de verification de liens</b>
  # * string[] : tableau des urls à vérifier
  # * return : string contenant le resultat des pings
  def verifLiens(urls) 
    resultats = "" 
    urls.each { |n| # pour chaque urls on realise un ping -> mise des resultats en chaine de caractere
    p = Net::Ping::HTTP.new n , 80, 5
    if p.ping?
      resultats +=  "#{n} est vivant\n" 
    else
      resultats += "#{n} est mort\n"
    end
    }
    return resultats	
  end
  # <b>Controleur permettant d'afficher la vue secondaire d'affichage de resultats, controleur VueResult</b>
  # * string resultats : contient les resultats à affiché
  # * string nom : nom du fichier qui contient les urls traités
  def vueResult(resultats, nom) 
    v = VueResult.new(resultats, nom)
    v.getWindow.show_all
    Gtk.main
  end
end