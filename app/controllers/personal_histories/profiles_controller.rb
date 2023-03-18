class PersonalHistories::ProfilesController < PersonalHistories::ApplicationController
  before_action :set_profile, only: %i[show update destroy]

  def show
    render json: @profile, status: 200
  end

  def update
    @profile.update!(profile_params)
    render json: @profile, status: 200
  end

  def destroy
    @profile.destroy!
    render status: 200
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
                                    :photo_number,
                                    :birth_date_on,
                                    :age,
                                    :sex)
  end
end
