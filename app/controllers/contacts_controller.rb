class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(secure_params)
    if @contact.valid?
      UserMailer.contact_email(@contact).deliver_now
      flash[:notice] = "Thanks for the email #{@contact.name}, Matt is pleased you took the time to email him and will respond soon."
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def secure_params
    # set requirements and permissions for params
    params.require(:contact).permit(:name, :email, :content)
  end
end
