class ContactsController < ApplicationController
  def index
    # @contacts = Contact.where(user_id: session[:user_id])
    if params[:group]
      @contacts = Group.find_by(name: params[:group]).contacts.where(user_id: current_user.id)
    else
      @contacts = current_user.contacts
    end

    # if current_user
    #   @contacts = current_user.contacts
    # else
    #   flash[:warning] = "You are not logged in."
    #   redirect_to '/login'
    # end
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    if current_user && @current_user.id == @contact.user_id
      render 'show.html.erb'
    else
      redirect_to '/login'
    end
  end

  def new
  end

  def create
    address = params[:address]
    # coordinates = Geocoder.coordinates(address)
    # input_latitude = coordinates[0]
    # input_longitude = coordinates[1]
    contact = Contact.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone],
      user_id: current_user.id
      # latitude: input_latitude,
      # longitude: input_longitude
    )
    flash[:success] = "Contact created."
    redirect_to "/contacts/#{contact.id}"
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone]
    )
    flash[:success] = "Contact updated."
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    flash[:danger] = "Contact deleted."
    redirect_to "/"
  end

  def all_johns
    @contacts = Contact.all_johns
    render 'index.html.erb'
  end
end
