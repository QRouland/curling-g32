class ReadFile
  def initialize(pFic)
    @fic = File.open(pFic, "r")
  end
    
  def getALL #revoit tout le contenu d'un fichier sous forme d'une chaine de caractere
    all = @fic.read
    return all
  end
  
  def getUrls #sort les URLs d'un fichier
    txt = self.getALL
    url = txt.scan(/http[^\s]*/)
    return url
  end
end




