class PersonalHistories::InternshipBackGroundsController < PersonalHistories::ApplicationController
  before_action :set_internship_back_ground, only: %i[update destroy]

  def index
    render json: @personal_history.internship_back_grounds
  end

  def create
    new_internship_back_ground = InternshipBackGround.create!(internship_back_ground_params)

    render json: new_internship_back_ground, status: :ok
  end

  def update
    @internship_back_ground.update!(internship_back_ground_params)

    render json: @internship_back_ground, status: :ok
  end

  def destroy
    @internship_back_ground.destroy!

    render json: @internship_back_ground
  end

  private

  def set_internship_back_ground
    @internship_back_ground = @personal_history.internship_back_grounds.find(params[:id])
  end

  def internship_back_ground_params
    params.require(:internship_back_ground).permit(:description,
                                                   :happened_on)
  end
end
