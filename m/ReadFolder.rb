class String
  def liste_rep(espacement = "")

    liste_exclus = [".", ".."]
    d = Dir.open(self)

    liste_dir = d.sort - liste_exclus

    liste_dir.each { |fichier|
      case File.ftype(self+fichier)
        when "directory"
          puts "#{espacement} + #{fichier}/"
          espacement += "    "
          (self + fichier + "/").liste_rep(espacement)
          espacement = espacement[0, espacement.length-4]
        when "file"
          puts "#{espacement} - #{fichier}"
      end
    }
  end
end