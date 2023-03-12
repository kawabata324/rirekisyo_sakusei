class PersonalHistories::ProgramingBackGroundsController < PersonalHistories::ApplicationController
  before_action :set_programing_back_ground, only: %i[update destroy]

  def index
    render json: @personal_history.programing_back_grounds
  end

  def create
    new_programing_back_ground = ProgramingBackGround.create!(programing_back_ground_params)

    render json: new_programing_back_ground
  end

  def update
    @programing_back_ground.update!(programing_back_ground_params)
  end

  def destroy
    @programing_back_ground.destroy!
  end

  private

  def set_programing_back_ground
    @programing_back_ground = @personal_history.programing_back_grounds.find(params[:id])
  end

  def programing_back_ground_params
    params.require(:programing_back_ground).permit(:description,
                                                   :happened_on)
  end
end
