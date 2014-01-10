  class VueResult
  def initialize(liste_result, nom)
    @window = Gtk::Window.new
    @window.set_title(nom)
    
    vb = Gtk::VBox.new(true, 6)
    vh = Gtk::HBox.new(false, 6)
    
    if(liste_result != "")
      res = Gtk::Label.new(liste_result)
    else
      res = Gtk::Label.new("Pas de liens trouves")
    end
    vh.pack_start(res, false, true, 6)
    vb.pack_start(vh)
    
    @window.add(vb)
    self.listenerDestroy
  end
  
  def getWindow
    return @window
  end

  def listenerDestroy
    @window.signal_connect('destroy') {
    @window.destroy
    Gtk.main_quit
    }
  end
end
