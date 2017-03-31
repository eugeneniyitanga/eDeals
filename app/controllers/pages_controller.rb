class PagesController < ApplicationController

  def about_us 
    render "about_us.html.erb"
  end

  def contact_us 
    render "contact_us.html.erb"
  end
end
