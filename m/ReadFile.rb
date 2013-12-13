class ReadFile
  def initialize(pFic)
    @fic = File.open(pFic, "r")
  end
    
  def getLines
    i=0
    tabLines = []
    @fic.each_line { |ligne|
      tabLines[i] = ligne
      i = i + 1
    }
    return tabLines
  end
end

class TestLink

end