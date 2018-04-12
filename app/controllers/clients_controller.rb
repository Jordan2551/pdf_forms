
class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :in_session?, only: [:step_2, :payment, :step_4, :register_step_2, :register_step_4]
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
    @client = Client.find(session[:client_id])
    set_register_step_2
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
    @client = Client.find(session[:client_id])
    set_register_step_4
    if @client.save(context: :register_step_4)
        flash[:msg] = "You have completed the application!"
        redirect_to home_path
    else
        flash[:step_4_errors] = @client.errors.full_messages
        render step_4_path
    end
  end

  #Client registration

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    debugger
    respond_to do |format|
      if @client.update(update_client_params)
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

    def register_step_1_params
      params.require(:client).permit(:first_name, :middle_name, :last_name, :suffix, :phone_number, :email)
    end

    def set_register_step_2
      @client.mailing_address = params[:client][:mailing_address]
      @client.mailing_city = params[:client][:mailing_city]
      @client.mailing_country = params[:client][:mailing_country]
      @client.mailing_county = params[:client][:mailing_county]
      @client.alimony_child_support_required = params[:client][:alimony_child_support_required]
      @client.home_phone_number = params[:client][:home_phone_number]
      @client.what_to_collect = params[:client][:what_to_collect]
      @client.how_much_money_owed = params[:client][:how_much_money_owed]
      @client.alimony_child_support_state = params[:client][:alimony_child_support_state]
      @client.receiving_payments = params[:client][:receiving_payments]
      @client.receiving_public_assistance = params[:client][:receiving_public_assistance]
      @client.receiving_public_assistance_description = params[:client][:receiving_public_assistance_description]
      @client.registration_step = 2
    end

    def set_register_step_4
      @client.alternate_contact_name = params[:client][:alternate_contact_name]
      @client.alternate_contact_phone_number = params[:client][:alternate_contact_phone_number]
      @client.birth_date = params[:client][:birth_date]
      @client.owes_money_race = params[:client][:owes_money_race]
      @client.owes_money_first_name = params[:client][:owes_money_first_name]
      @client.owes_money_last_name = params[:client][:owes_money_last_name]
      @client.owes_money_address = params[:client][:owes_money_address]
      @client.owes_money_apt = params[:client][:owes_money_apt]
      @client.owes_money_city = params[:client][:owes_money_city]
      @client.owes_money_county = params[:client][:owes_money_county]
      @client.owes_money_state = params[:client][:owes_money_state]
      @client.owes_money_zip = params[:client][:owes_money_zip]
      @client.owes_money_work_address = params[:client][:owes_money_work_address]
      @client.owes_money_phone_number = params[:client][:owes_money_phone_number]
      @client.owes_money_email = params[:client][:owes_money_email]
      @client.owes_money_is_in_jail = params[:client][:owes_money_is_in_jail]
      @client.owes_money_middle_name = params[:client][:owes_money_middle_name]
      @client.mother_full_name = params[:client][:mother_full_name]
      @client.mother_maiden_name = params[:client][:mother_maiden_name]
      @client.court_order_state = params[:client][:court_order_state]
      @client.court_order_county = params[:client][:court_order_county]
      @client.final_judgment_obtained_date = params[:client][:final_judgment_obtained_date]
      @client.court_case_filed_name = params[:client][:court_case_filed_name]
      @client.alternate_contact_email = params[:client][:alternate_contact_email]
      @client.alternate_contact_best_method = params[:client][:alternate_contact_best_method]
      @client.owes_money_first_nickname = params[:client][:owes_money_first_nickname]
      @client.owes_money_last_nickname = params[:client][:owes_money_last_nickname]
      @client.owes_money_country = params[:client][:owes_money_country]
      @client.owes_money_occupation = params[:client][:owes_money_occupation]
      @client.owes_money_birth_date = params[:client][:owes_money_birth_date]
      @client.owes_money_ssn = params[:client][:owes_money_ssn]
      @client.owes_money_work_phone_number = params[:client][:owes_money_work_phone_number]
      @client.owes_money_work_city = params[:client][:owes_money_work_city]
      @client.owes_money_work_state = params[:client][:owes_money_work_state]
      @client.owes_money_work_zip = params[:client][:owes_money_work_zip]
      @client.ssn = params[:client][:ssn]
      @client.case_number = params[:client][:case_number]
      @client.interested_services_details = params[:client][:interested_services_details]
      @client.liquidated_damages_amount = params[:client][:liquidated_damages_amount]
      @client.prejudgment_interest_amount = params[:client][:prejudgment_interest_amount]
      @client.taxable_court_costs_amount = params[:client][:taxable_court_costs_amount]
      @client.first_class_mailing_receipt_number = params[:client][:first_class_mailing_receipt_number]
      @client.certified_mailing_receipt_number = params[:client][:certified_mailing_receipt_number]
      @client.mailing_date = params[:client][:mailing_date]
      @client.account_number = params[:client][:account_number]
      @client.filing_date = params[:client][:filing_date]
      @client.suffix = params[:client][:suffix]
      @client.child_1_first_name = params[:client][:child_1_first_name]
      @client.child_1_last_name = params[:client][:child_1_last_name]
      @client.child_1_birth_date = params[:client][:child_1_birth_date]
      @client.child_1_ssn = params[:client][:child_1_ssn]
      @client.child_1_emancipation_date = params[:client][:child_1_emancipation_date]
      @client.child_2_first_name = params[:client][:child_2_first_name]
      @client.child_2_last_name = params[:client][:child_2_last_name]
      @client.child_2_birth_date = params[:client][:child_2_birth_date]
      @client.child_2_ssn = params[:client][:child_2_ssn]
      @client.child_2_emancipation_date = params[:client][:child_2_emancipation_date]
      @client.child_3_last_name = params[:client][:child_3_first_name]
      @client.child_3_last_name = params[:client][:child_3_last_name]
      @client.child_3_last_name = params[:client][:child_3_birth_date]
      @client.child_3_ssn = params[:client][:child_3_ssn]
      @client.child_3_emancipation_date = params[:client][:child_3_emancipation_date]
      @client.child_4_last_name = params[:client][:child_4_first_name]
      @client.child_4_last_name = params[:client][:child_4_last_name]
      @client.child_4_last_name = params[:client][:child_4_birth_date]
      @client.child_4_ssn = params[:client][:child_4_ssn]
      @client.child_4_emancipation_date = params[:client][:child_4_emancipation_date]
      @client.child_5_last_name = params[:client][:child_5_first_name]
      @client.child_5_last_name = params[:client][:child_5_last_name]
      @client.child_5_last_name = params[:client][:child_5_birth_date]
      @client.child_5_ssn = params[:client][:child_5_ssn]
      @client.child_5_emancipation_date = params[:client][:child_5_emancipation_date]
      @client.mailing_city = params[:client][:mailing_city]
      @client.mailing_state = params[:client][:mailing_state]
      @client.mailing_zip = params[:client][:mailing_zip]
      @client.mailing_country = params[:client][:mailing_country]
      @client.mailing_county = params[:client][:mailing_county]
      @client.owes_money_bank_name = params[:client][:owes_money_bank_name]
      @client.owes_money_account_number = params[:client][:owes_money_account_number]
      @client.court_order_modified = params[:client][:court_order_modified]
      @client.children_living_with_you = params[:client][:children_living_with_you]
      @client.children_not_living_with_you_explanation = params[:client][:children_not_living_with_you_explanation]
      @client.documentation_send_method = params[:client][:documentation_send_method]
      @client.owes_money_gender = params[:client][:owes_money_gender]
      # Hstores
      @client.owes_money_papers = params[:client][:owes_money_papers]
      @client.interested_services = params[:client][:interested_services]
      @client.interested_documents_to_generate = params[:client][:interested_documents_to_generate]
      @client.registration_step = 4
    end

    def update_client_params
      params.require(:client).permit(:first_name, :middle_name, :last_name, :suffix, :phone_number, :email, :mailing_address, :mailing_city, :mailing_country,
      :mailing_county, :alimony_child_support_required, :home_phone_number, :what_to_collect, :how_much_money_owed, :alimony_child_support_state, :receiving_payments,
      :receiving_public_assistance, :receiving_public_assistance_description, :alternate_contact_name, :alternate_contact_phone_number, :alternate_contact_email,
      :alternate_contact_best_method, :birth_date, :owes_money_race, :owes_money_first_name, :owes_money_last_name, :owes_money_address, :owes_money_apt, :owes_money_city, :owes_money_bank_name, :owes_money_account_number,
      :owes_money_country, :owes_money_county,  :owes_money_state, :owes_money_zip, :owes_money_work_address, :owes_money_phone_number, :owes_money_email, :owes_money_is_in_jail,
      :owes_money_middle_name, :mother_full_name, :mother_maiden_name, :court_order_state, :court_order_county, :final_judgment_obtained_date, :court_case_filed_name,
      :owes_money_first_nickname, :owes_money_last_nickname, :owes_money_occupation, :owes_money_birth_date, :owes_money_ssn, :owes_money_work_phone_number, :owes_money_work_city, :owes_money_gender,
      :owes_money_work_state, :owes_money_work_zip, :ssn, :case_number, :interested_services_details, :liquidated_damages_amount, :prejudgment_interest_amount, :taxable_court_costs_amount,
      :first_class_mailing_receipt_number, :certified_mailing_receipt_number, :mailind_date, :account_number, :filing_date, :suffix, :children_living_with_you, :children_not_living_with_you_explanation,
      :child_1_first_name, :child_1_last_name, :child_1_birth_date, :child_1_ssn, :child_1_emancipation_date,
      :child_2_first_name, :child_2_last_name, :child_2_birth_date, :child_2_ssn, :child_2_emancipation_date,
      :child_3_first_name, :child_3_last_name, :child_3_birth_date, :child_3_ssn, :child_3_emancipation_date,
      :child_4_first_name, :child_4_last_name, :child_4_birth_date, :child_4_ssn, :child_4_emancipation_date,
      :child_5_first_name, :child_5_last_name, :child_5_birth_date, :child_5_ssn, :child_5_emancipation_date,
      :mailing_city, :mailing_state, :mailing_zip, :mailing_country, :mailing_county, :court_order_modified,
      :documentation_send_method, :interested_services, :interested_documents_to_generate,
      :work_phone_number, :mailing_date)
    end

end
