#Classe permettant l'acces et la recuperation des données dans les fichiers
class ReadFile
  #Ouverture d'un fichier en lecture
  def initialize(pFic) 
    @fic = File.open(pFic, "r")
  end
  #Revoit tout le contenu d'un fichier sous forme d'une chaine de caractere
  def getALL 
    all = @fic.read
    return all
  end
  #Sort les URLs d'un fichier
  def getUrls 
    txt = self.getALL
    url = URI::extract(txt, /http(s)?/)
    return url
  end
end




