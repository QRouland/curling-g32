# Classe creation de la vue permettant d'aceder a l'historique
class VueHisto
  # <b>Creation de la vue</b>
  # * CtrlCheckHisto ctrl : controleur de la vue
  # * String title : titre de la vue
  def initialize(ctrl, title)
    @ctrl = ctrl
    #fenenetre generale
    @window = Gtk::Window.new
    @window.set_title(title)
    
    #declaration des differents widgets
    vb = Gtk::VBox.new(true, 6)
    bot = Gtk::HBox.new(false, 6)
    
    #creation label pour la saisie
    lab = Gtk::Label.new('Chemin du fichier a rejouer :')
    bot.pack_start(lab, false, true, 6)
    
    #creation champ de saisie
    @nom = Gtk::FileChooserButton.new("choisir un fichier", Gtk::FileChooser::ACTION_OPEN)
    @nom.set_current_folder("../sauv")
    bot.pack_start(@nom, true, true)
    
    #creation bouton de validation
    @b = Gtk::Button.new('OK')
    bot.pack_start(@b)
    vb.pack_start(bot)
    ##############################
    
    @window.add(vb)
    
    # Abbonement fenetre au Listener
    self.listenerBouton
    self.listenerDestroy
  end
  
  def getWindow #:nodoc:#
    return @window
  end
  
  def getEntry #:nodoc:#
    return @chaine
  end
  
  # <b>Listener fermeture fenetre</b>
  def listenerDestroy 
    @window.signal_connect('destroy') {
      @ctrl.destructionFen
    }
  end

  # <b>Listener appuie bouton validation -> test liens fichier </b>
  def listenerBouton 
    @chaine = " "
    @b.signal_connect('clicked'){ 
    @chaine = @nom.filename
    if (@chaine =="") #gestion saisie vide
      m = Gtk::MessageDialog.new(Gtk::Window.new, Gtk::Dialog::DESTROY_WITH_PARENT,
			    Gtk::MessageDialog::ERROR,
			    Gtk::MessageDialog::BUTTONS_CLOSE,
			    "Erreur : Veuillez saisir un fichier !")
	     m.run
	     m.destroy  
    else
    	if(File.exist?(@chaine))  #si c'est un fichier existant utilisation du controleur adéquat
    	  @ctrl.rejouer(@chaine)
    	else #gestion saisie invalide
    	  d = Gtk::MessageDialog.new(Gtk::Window.new, Gtk::Dialog::DESTROY_WITH_PARENT,
    			      Gtk::MessageDialog::ERROR,
    			      Gtk::MessageDialog::BUTTONS_CLOSE,
    			      "Erreur :  Fichier inexistant !")
    	  d.run
    	  d.destroy  
       end
      
    end
    }
  end
end
