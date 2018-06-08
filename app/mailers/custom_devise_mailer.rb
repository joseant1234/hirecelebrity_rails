class CustomDeviseMailer < Devise::Mailer

  def reset_password_instructions(record,token, opts={})
  	mail = super
  	@token = token
  	mail(subject: "Reset password instructions") do |format|
  		format.html { render 'admins/mailer/reset_password_instructions'}
  	end
  	mail
  end
end
