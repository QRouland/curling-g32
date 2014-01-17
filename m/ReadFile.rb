#Classe permettant l'acces et la recuperation des données dans les fichiers
class ReadFile
  # <b>Ouverture d'un fichier en lecture</b>
  # * String pFic : chemin de fichier à ouvrir
  def initialize(pFic) 
    @fic = File.open(pFic, "r")
  end
  # <b>Revoit tout le contenu d'un fichier sous forme d'une chaine de caractere</b>
  # * return : string contenant tout le texte du fichier
  def getALL 
    all = @fic.read
    return all
  end
  # <b>Sort les URLs d'un fichier</b>
  # * return : string[] contenant tout les liens http/https du fichier
  def getUrls 
    txt = self.getALL
    url = URI::extract(txt, /http(s)?/)
    return url
  end
end




