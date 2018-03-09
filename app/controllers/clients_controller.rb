class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_admin!, only: [:home, :new, :create, :application_created]

  def home
  end

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        format.html { redirect_to application_created_path, notice: 'Thank you. Your application was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to clients_path, notice: 'Application was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Application was successfully deleted.' }
    end
  end

  def home

  end

  def update_admin

    @user = User.find(params[:user_id])
    if @user.admin?
      @user.admin = false
    else
      @user.admin = true
    end

    if @user.save
      redirect_to edit_settings_url, notice: "Admin privileges have been changed for #{@user.email}"
    else
      render edit_settings_url, notice: "There was an error updating user privileges for #{@user.email}"
    end

  end

  def application_created

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:case_number, :petitioner, :respondent, :garnishee, :name, :address, :bank_name, :bank_address)
    end

end
