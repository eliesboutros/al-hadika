class ContactMailer < ApplicationMailer
  default from: "contact@al-hadika.com" # This will be the "from" address

  def contact_email(contact_params)
    @first_name = contact_params[:first_name]
    @last_name = contact_params[:last_name]
    @email = contact_params[:email]
    @phone = contact_params[:phone]
    @service = contact_params[:service]
    @message = contact_params[:message]

    mail(
      to: "Al-Hadika@outlook.com",
      subject: "New Contact Form Submission - #{@service}",
      reply_to: @email
    )
  end
end
