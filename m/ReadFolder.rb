class String #ajout de la méthode à la classe String
  def liste_rep(espacement = "")
    #initialisation
    i=0
    fich_dir = [""]
    all_dir = ""
    liste_exclus = [".", ".."]
    d = Dir.open(self)

    #sort les fichiers sans . et .. qui nous interresse pas
    liste_dir = d.sort - liste_exclus

    liste_dir.each { |fichier| #pour chaque fichier touvé
      case File.ftype(self+fichier)
        when "directory" #si on trouve un dossier on l'ajoute et on cherche son contenu avec un apelle recursif
          fich_dir[i] = "#{espacement} + #{fichier}/ \n"
          espacement += "    "
          fich_dir[i+1] = (self + fichier + "/").liste_rep(espacement)
          espacement = espacement[0, espacement.length-4]
          i+=2
        when "file" # si c'est un fichier on l'ajoute simplement
          fich_dir[i] = "#{espacement} - #{fichier} \n"
          i+=1
      end
      
    }
    
    fich_dir.each { |n|
                    all_dir += n 
                  }
    return all_dir; #return l'arboressence des fichiers sous forme d'une chaine de caractere
  end
end