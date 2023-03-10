class PersonalHistories::ApplicationController < ApplicationController
  before_action :set_personal_history

  def set_personal_history
    @personal_history = PersonalHistory.find_by!(uuid: params[:personal_history_id])
  end
end
