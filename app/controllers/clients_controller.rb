
class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :in_session?, only: [:validate_registration_stage]
  skip_before_action :authenticate_admin!, only: [:home, :new, :create, :application_created, :step_1, :step_2, :step_4, :payment, :register_step_1, :register_step_2, :register_step_4]

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

  def step_1
    @client = Client.new
  end

  def step_2
    validate_registration_stage(1)
    @client = Client.find(session[:client_id])
  end

  def payment
    validate_registration_stage(2)
  end

  def register_step_1
      @client = Client.new(register_step_1_params)
      if @client.save(context: :register_step_1)
        session[:client_id] = @client.id # We need the client id to persist through multiple registration actions
        # flash[:errors] = nil # Reset error messages from previous requests
        flash[:step_1_success] = "You have successfully completed step 1. Good job!"
        render step_2_path
      else
        flash[:step_1_errors] = @client.errors.full_messages
        render step_1_path
      end
  end

  def register_step_2
      validate_registration_stage(1)
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
      @client.registration_step = 2

      if @client.save(context: :register_step_2)
          flash[:step_2_success] = "You made it this far! Keep up the great work!"
          redirect_to payment_path
      else
          flash[:step_2_errors] = @client.errors.full_messages
          render step_2_path
      end
  end

  #This is step 3

  def step_4
    validate_registration_stage(3)
    @client = Client.find(session[:client_id])
  end

  def register_step_4
    validate_registration_stage(3)
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
