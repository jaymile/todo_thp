class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create
    @email = Email.new(email_params)
    if @email.save
      flash[:success] = "Email enregistré"
      redirect_to emails_path
    else
      flash[:danger] = "Erreur!"
      redirect_to new_email_path
    end
  end

  def index
    @emails = Email.all
    @read = @emails.where(read: true)
    @unread = @emails.where(read: false)
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    if @email.update(read: true)
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = "Erreur!"
      redirect_to @email
    end
  end

  def show
    @email = Email.find(params[:id])
    @index =params[:index]

    respond_to do |format|
      @email.read = true
      format.js {render layout: false}
    end
  end

  def destroy
    @email=Email.find(params[:id])
    respond_to do |format|
      format.js
      # flash[:success] = "Email supprimé!"
      # redirect_to emails_path
      # @email.destroy
    end
  end

  private

  def email_params
    params.require(:email).permit(:object, :body, :read)
  end
end
