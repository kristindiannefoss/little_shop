class PagesController < ApplicationController
  layout false
  # layout 'application', :except => :view
  def splash
    @disable_nav = true
  end

end
