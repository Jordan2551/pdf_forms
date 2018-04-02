
class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :in_session?, only: [:register_step_2, :register_step_4]
  skip_before_action :authenticate_admin!, only: [:home, :new, :create, :application_created, :register, :register_step_1, :register_step_2, :register_step_3, :payment]

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

  #Client registration

  def register
    @client = Client.new
  end

  def register_step_1
      @client = Client.new(register_step_1_params)
      respond_to do |format|
        if @client.save(context: :register_step_1)
          format.js{
            session[:client_id] = @client.id # We need the client id to persist through multiple registration actions
            flash[:errors] = nil # Reset error messages from previous requests
            flash[:success] = "You have successfully completed step 1. Good job!"
            render 'register_step_1'
          }
        else
          format.js{
            flash[:errors] = @client.errors.full_messages
            render 'register_step_1'
          }
        end
    end
  end

  def register_step_2

      #How to achieve a similar look to register_step_1 where .new sets all the params for us
      @client = Client.find(session[:client_id])
      @client.mailing_address = params[:client][:mailing_address]
      @client.county_name = params[:client][:county_name]
      @client.alimony_child_support_required = params[:client][:alimony_child_support_required]
      @client.home_phone_number = params[:client][:home_phone_number]
      @client.what_to_collect = params[:client][:what_to_collect]
      @client.how_much_money_owed = params[:client][:how_much_money_owed]
      @client.alimony_child_support_state = params[:client][:alimony_child_support_state]
      @client.receiving_payments = params[:client][:receiving_payments]
      @client.receiving_public_assistance = params[:client][:receiving_public_assistance]
      @client.receiving_public_assistance_description = params[:client][:receiving_public_assistance_description]

      respond_to do |format|
        if @client.save(context: :register_step_2)
          format.js{
            flash[:errors] = nil #reset error messages from previous requests
            flash[:success] = "You have successfully completed step 2. Good job!"
            redirect_to payment_path
          }
        else
          format.js{
            flash[:errors] = @client.errors.full_messages
            render 'register_step_2'
          }
      end
    end

  end

  #This is step 3
  def payment
  end

  def step_4
  end

  def register_step_4

  end

  #Client registration

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

    def register_step_1_params
      params.require(:client).permit(:first_name, :middle_name, :last_name, :phone_number, :email)
    end

    def register_step_2_params
      params.require(:client).permit(:mailing_address, :county_name, :alimony_child_support_required, :home_phone_number, :work_phone_number, :what_to_collect, :how_much_money_owed, :alimony_child_support_state, :receiving_payments, :receiving_public_assistance, :receiving_public_assistance_description)
    end

    def register_step_3_params
      params.require(:client).permit(:mailing_address, :county_name, :alimony_child_support_required, :home_phone_number, :work_phone_number, :what_to_collect, :how_much_money_owed, :alimony_child_support_state, :receiving_payments, :receiving_public_assistance, :receiving_public_assistance_description)
    end

end
