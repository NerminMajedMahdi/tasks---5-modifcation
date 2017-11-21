
class StaticPagesController < ApplicationController

 def landing_page
  	#if Product.first
  		@featured_product = Product.first
  		@products = Product.limit(3)
   # else
     # @products = nil
  	#end
  end


  def index
  end

   def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  ActionMailer::Base.mail(from: @email,
      to: 'mahdi.nirmeen@gmail.com',
      subject: "A new contact form message from #{@name}",
      body: @message).deliver_now
end
end

