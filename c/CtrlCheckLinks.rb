# Controleur de la vérification de la validité des liens ainsi que les vues correspondantes
class CtrlCheckLinks
  #Controleur de la saisie pour vérification de lien 
  def saisie(type) 
    @v1 = Vue1.new(self, 'Saisie nom fichier', type) #creation vue principal
    @v1.getWindow.show_all # affichage
    Gtk.main
    return @urls
  end
  #Controleur recuperation et verification de liens dans 1 fichiers
  def recupUrls(str) 
    f = ReadFile.new(str)
    @urls = f.getUrls
    self.vueResult(self.verifLiens(@urls), str)
    s = CtrlHistoLink.new #on enregistre dans l'histo le verif du lien
    s.sauv(str, @urls)
    return @urls
  end
  #Controleur recuperation et verification de liens dans 1 dossier
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
  #Controleur permettant de detruire la vue principal
  def destructionFen 
    @v1.getWindow.destroy
    Gtk.main_quit
  end
  #Controleur de verification de liens
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
  #Controleur permettant d'afficher la vue secondaire d'affichage de resultat
  def vueResult(resultats, nom) 
    v = VueResult.new(resultats, nom)
    v.getWindow.show_all
    Gtk.main
    
  end
end