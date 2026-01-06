class ContactsController < ApplicationController
  def new
    # Display the contact form (contact.html.erb)
  end

  def create
    # Get form parameters
    @contact_params = params.permit(:first_name, :last_name, :email, :phone, :service, :message)
    
    # Send email
    begin
      ContactMailer.contact_email(@contact_params).deliver_now
      
      redirect_to contact_path, notice: "Thank you! Your message has been sent successfully. We'll get back to you within 24 hours."
    rescue => e
      Rails.logger.error "Contact form error: #{e.message}"
      redirect_to contact_path, alert: "Sorry, there was an error sending your message. Please try calling us directly at +961 79 365 375."
    end
  end
end