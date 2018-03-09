class SettingsController < ApplicationController
  before_action :set_setting, only: [:edit, :update]

  # GET /settings/edit
  def edit
  end

  # POST /settings
  def create
    @settings = Setting.new(setting_params)

    respond_to do |format|
      if @settings.save
        format.html { redirect_to @settings, notice: 'Setting was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @settings.update(setting_params)
        format.html { redirect_to edit_settings_path, notice: 'Settings were successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @settings = Setting.find(1)
      @users = User.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params.require(:setting).permit(:jc_number, :county_name)
    end
end
