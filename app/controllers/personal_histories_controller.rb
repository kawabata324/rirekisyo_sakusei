class PersonalHistoriesController < ApplicationController
  def self.uuid
    SecureRandom.uuid
  end

  def index
    # TODO: current_userのに絞る必要がある, WIP
    @personal_histories = PersonalHistory.all
    render json: @personal_histories
  end

  def create
    ActiveRecord::Base.transaction do
      @personal_history = PersonalHistory.create!(
        uuid: PersonalHistoriesController.uuid
      )
      Profile.create!(
        personal_history: @personal_history
      )
      Address.create!(
        personal_history: @personal_history
      )
    end

    render json: { 'uuid' => @personal_history.uuid }
  end
end
