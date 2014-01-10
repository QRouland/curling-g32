
class Vue1
  def initialize(liste_dir, ctrl)
    @ctrl = ctrl
    #fenenetre generale
    @window = Gtk::Window.new
    @window.set_title('Saisie nom fichier')
    
    #declaration des differents widgets
    vb = Gtk::VBox.new(true, 6)
    top = Gtk::HBox.new(false, 6)
    bot = Gtk::HBox.new(false, 6)
    
    ###Partie supérieur fenetre###
    
    #Creation du label de l'arbo
    dir = Gtk::Label.new(liste_dir)
    top.pack_start(dir, false, true, 6)
    vb.pack_start(top)
    ##############################
    
    
    ###Partie Inferieur fenetre###
    
    #creation label pour la saisie
    lab = Gtk::Label.new('Chemin')
    bot.pack_start(lab, false, true, 6)
    
    #creation champ de saisie
    @nom = Gtk::Entry.new
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
  
  def getWindow
      return @window
  end
  
  def getEntry
    return @chaine
  end
  
  def listenerDestroy # Listener fermeture fenetre
    @window.signal_connect('delete_event') {
    @ctrl.destructionFen
    }
  end
  
  def listenerBouton #listener appuie validation
    @chaine = " "
    @b.signal_connect('clicked'){ 
    @chaine = @nom.text.to_s
    if (@chaine =="")
      m = Gtk::MessageDialog.new(Gtk::Window.new, Gtk::Dialog::DESTROY_WITH_PARENT,
			    Gtk::MessageDialog::ERROR,
			    Gtk::MessageDialog::BUTTONS_CLOSE,
			    "Erreur : Veuillez saisir un fichier ou dossier !")
	     m.run
	     m.destroy  
    else
      @chaine = "../fichier/" + @chaine
      if(File.directory?(@chaine))
        
          @ctrl.recupUrlsDoss(@chaine)
        

      else
      	if(File.exist?(@chaine))
      	  @ctrl.recupUrls(@chaine)
      	else
      	  d = Gtk::MessageDialog.new(Gtk::Window.new, Gtk::Dialog::DESTROY_WITH_PARENT,
      			      Gtk::MessageDialog::ERROR,
      			      Gtk::MessageDialog::BUTTONS_CLOSE,
      			      "Erreur :  Fichier ou dossier inexistant !")
      	  d.run
      	  d.destroy  
	       end
      end
    end
    }
  end
end
