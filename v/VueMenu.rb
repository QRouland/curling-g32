#Classe creation vue du menu
class VueMenu
	# <b>Creation de la vue</b>
  # * Menu ctrl : controleur de la vue
  # * String title : titre de la vue
	def initialize(ctrl, title)
  	@ctrl = ctrl
    #fenenetre generale
    @window = Gtk::Window.new
    @window.set_title(title)
    
    #declaration des differents widgets
    vb = Gtk::VBox.new(true, 6)
    top = Gtk::HBox.new(false, 6)
    
    
    
    #creation boutons
    @newFile = Gtk::Button.new('Nouveau test fichier')
    @newDoss = Gtk::Button.new('Nouveau test dossier')
    @histo = Gtk::Button.new('Histo')
 
    top.pack_start(@newFile)
    top.pack_start(@newDoss)
    top.pack_start(@histo)
    vb.pack_start(top)
    ##############################
    
    @window.add(vb)
    
    # Abbonement fenetre au Listener
    self.listenerBoutonNewFile
    self.listenerBoutonNewDossier
    self.listenerBoutonHisto
    self.listenerDestroy
  end

  def getWindow #:nodoc:#
      return @window
  end
  # <b>Listener appuie bouton nouvelle vérification de 1 fichier</b>
  def listenerBoutonNewFile
  	@newFile.signal_connect('clicked'){ 
  		@ctrl.newVerifFile
  	}
  end
  # <b>Listener appuie bouton validation nouvelle vérification de 1 dossier</b>
  def listenerBoutonNewDossier
  	@newDoss.signal_connect('clicked'){ 
  		@ctrl.newVerifDossier
  	}
  end
  # <b>Listener appuie bouton validation pour rejouer un fichier dans de l'historique</b>
  def listenerBoutonHisto
  	@histo.signal_connect('clicked'){ 
  		@ctrl.histo
  	}
  end
	# <b>Listener fermeture fenetre Menu</b>
  def listenerDestroy 
    @window.signal_connect('destroy') {
       @ctrl.destructionMenu
    }
  end



end