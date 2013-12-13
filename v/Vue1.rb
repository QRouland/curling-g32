class Vue1
  def initialize()
    @window = Gtk::Window.new
    @window.set_title('Saisie nom fichier')
    
    vb = Gtk::VBox.new(true, 6)
    hb = Gtk::HBox.new(false, 6)
    val = Gtk::Label.new('Nom');
    hb.pack_start(val, false, true, 6)
    @nom = Gtk::Entry.new
    hb.pack_start(@nom, true, true)
    @b = Gtk::Button.new('OK')
    hb.pack_start(@b)
    vb.pack_start(hb)
    @window.add(vb)
  end
  
  def getWindow
      return @window
  end
  
  def getEntry
    return @chaine
  end
  
  def listenerDestroy
    @window.signal_connect('destroy') {
    @window.destroy
    Gtk.main_quit
    }
  end
  
  def listenerBouton
    @chaine = " "
    @b.signal_connect('clicked'){ 
    @chaine = @nom.text.to_s
    @window.destroy
    Gtk.main_quit
    }
  end
end