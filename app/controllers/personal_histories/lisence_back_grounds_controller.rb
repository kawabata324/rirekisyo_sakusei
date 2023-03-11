class PersonalHistories::EducationalBackGroundsController < PersonalHistories::ApplicationController
  before_action :set_license_back_ground, only: %i[index update destroy]

  def index
    render json: @personal_history.license_back_grounds
  end

  def update
    @license_back_ground.update!(license_back_ground_params)
  end

  def destroy
    @license_back_ground.destroy!
  end

  private

    def set_license_back_ground
      @license_back_ground = @personal_history.license_back_grounds.find(params[:id])
    end

    def license_back_ground_params
      params.require(:license_back_ground).permit(:description,
                                                  :happened_on
      )
    end
end
