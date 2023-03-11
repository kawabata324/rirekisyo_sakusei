class PersonalHistories::InternshipBackGroundsController < PersonalHistories::ApplicationController
  before_action :set_internship_back_ground, only: %i[index update destroy]

  def index
    render json: @personal_history.internship_back_grounds
  end

  def update
    @internship_back_ground.update!(internship_back_ground_params)
  end

  def destroy
    @internship_back_ground.destroy!
  end

  private

    def set_internship_back_ground
      @internship_back_ground = @personal_history.internship_back_grounds.find(params[:id])
    end

    def internship_back_ground_params
      params.require(:internship_back_ground).permit(:description,
                                                     :happened_on
      )
    end
end
