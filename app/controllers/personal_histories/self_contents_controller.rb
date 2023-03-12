class PersonalHistories::SelfContentsController < PersonalHistories::ApplicationController
  before_action :set_self_content, only: %i[show update destroy]

  def show
    render json: @self_content
  end

  def update
    @self_content.update!(self_content_params)
  end

  def destroy
    @self_content.destroy!
  end

  private

  def set_self_content
    @self_content = @personal_history.self_content
  end

  def self_content_params
    params.require(:self_content).permit(
      :description
    )
  end
end
