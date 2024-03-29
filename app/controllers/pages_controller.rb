class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
    @contact_form = ContactForm.new
  end

  def submit_contact
    @contact_form = ContactForm.new(contact_params)
    if @contact_form.save
      flash[:notice] = "Thank you for your message, we will contact you soon."
      redirect_to contact_path
    else
      flash[:alert] = "Failed to submit the form. Please check the errors."
      render :contact
    end
  end

  private

  def contact_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end



