class PersonalHistories::EducationalBackGroundsController < PersonalHistories::ApplicationController
  before_action :set_educational_back_grounds, only: %i[update destroy]

  def index
    render json: @personal_history.educational_back_grounds, status: :ok
  end

  def create
    new_educational_back_ground = EducationalBackGround.create!(educational_back_ground_params)

    render json: new_educational_back_ground, status: :ok
  end

  def update
    @educational_back_ground.update!(educational_back_ground_params)

    render json: @educational_back_ground, status: :ok
  end

  def destroy
    @educational_back_ground.destroy!

    render json:  @educational_back_ground, status: :ok
  end

  private

  def set_educational_back_grounds
    @educational_back_ground = @personal_history.educational_back_grounds.find(params[:id])
  end

  def educational_back_ground_params
    params.require(:educational_back_ground).permit(:description,
                                                    :happened_on)
  end
end
