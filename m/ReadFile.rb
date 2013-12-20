class ReadFile
  def initialize(pFic)
    @fic = File.open(pFic, "r")
  end
  
  
    
  def getALL
    all = @fic.read
    return all
  end
  
  def getUrls
    txt = self.getALL
	url = txt.scan(/http[^\s]*/)
    return url
  end
end




