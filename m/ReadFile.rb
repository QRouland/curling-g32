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
    url = txt.match /http[^\s]*/
    return url
  end
end

class TestLink

end