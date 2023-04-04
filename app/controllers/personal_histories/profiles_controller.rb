class PersonalHistories::ProfilesController < PersonalHistories::ApplicationController
  before_action :set_profile, only: %i[show update destroy]

  def show
    render json: @profile, status: :ok
  end

  def update
    begin
      @profile.update!(profile_params)
      render json: @profile, status: :ok
    rescue ActiveRecord::RecordInvalid => e
      render json: { message: e.message }, status: :unprocessable_entity
    rescue StandardError => e
      render json: { message: e.message }, status: :internal_server_error
    end
  end

  def destroy
    @profile.destroy!
    render status: :ok
  end

  private

  def set_profile
    @profile = @personal_history.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name,
                                    :first_name_kana,
                                    :last_name,
                                    :last_name_kana,
                                    :email,
                                    :phone_number,
                                    :birth_date_on,
                                    :age,
                                    :sex)
  end
end
