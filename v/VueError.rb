class VueError
  def initialize(pMsgErr)
   @d = Gtk::MessageDialog.new(Gtk::Window.new, Gtk::Dialog::DESTROY_WITH_PARENT,
                           Gtk::MessageDialog::ERROR,
                           Gtk::MessageDialog::BUTTONS_CLOSE,
			   "Erreur :  #{pMsgErr}")
  end
  
   def getDialog
     return @d
  end
end