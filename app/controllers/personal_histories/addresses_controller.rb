class PersonalHistories::AddressesController < PersonalHistories::ApplicationController
  before_action :set_address, only: %i[show update destroy]

  def show
    render json: @address
  end

  def update
    @address.update!(address_params)
  end

  def destroy
    @address.destroy!
  end

  private

    def set_address
      @address = @personal_history.address
    end

    def address_params
      params.require(:address).permit(:postal_code,
                                      :content,
                                      :content_kana,
      )
    end
end
