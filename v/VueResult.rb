  # Classe creation de la vue des resultats
  class VueResult
  # <b>Creation de la vue</b>
  # * String liste_result : contient les resultats a afficher
  # * String title : titre de la vue
  def initialize(liste_result, title)
    #fenenetre generale
    @window = Gtk::Window.new
    @window.set_title(title)
    
    #declaration des differents widgets
    vb = Gtk::VBox.new(true, 6)
    vh = Gtk::HBox.new(false, 6)
    
    #creation label resultat
    if(liste_result != "")
      res = Gtk::Label.new(liste_result)
    else
      res = Gtk::Label.new("Pas de liens trouves")
    end
    vh.pack_start(res, false, true, 6)
    vb.pack_start(vh)
    
    # Abbonement fenetre au Listener
    @window.add(vb)
    self.listenerDestroy
  end
  
  def getWindow #:nodoc:#
    return @window
  end

  # <b>Listener fermeture Resultat</b>
  def listenerDestroy 
    @window.signal_connect('destroy') {
      @window.destroy
      Gtk.main_quit
    }
  end
end
