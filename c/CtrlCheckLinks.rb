class CtrlCheckLinks
  def saisie
    liste_dir = "../fichier/".liste_rep 
    #Va checher les fichiers et arborecenses dans le dossier fichier (Méthode dans ReadFolder)
    Gtk.init
    @v1 = Vue1.new(liste_dir, self)
    @v1.getWindow.show_all
    Gtk.main
    
    return @urls
  end
  
  def recupUrls(str)
    f = ReadFile.new(str)
    @urls = f.getUrls
    self.vueResult(self.verifLiens(@urls))
  end
  
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
  
  def destructionFen
    @v1.getWindow.destroy
    Gtk.main_quit
  end
  
  def verifLiens(urls)
    resultats = ""
    urls.each { |n| 
    p = Net::Ping::HTTP.new n , 80
    if p.ping?
      resultats +=  "#{n} est vivant\n" 
    else
      resultats += "#{n} est mort\n"
    end
    }
    return resultats	
  end
  
  def vueResult(resultats)
    v = VueResult.new(resultats)
    v.getWindow.show_all
    Gtk.main
    
  end
  
  
  

end