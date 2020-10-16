class OffenseCategoriesController < ApplicationController
    before_action :set_offense, only: [:show, :update, :destroy]

    def index
        @offenses = OffenseCategory.all
        render json: @offenses
    end
    # def show
    #     render json: @offense
    # end
    def create
        @offense = OffenseCategory.create!(offense_params)
        render json: @offense
    end
    def update
        @offense.update(offense_params)
        head :no_content
        # { head :no_content }?
    end
    def destroy
        @offense.destroy
        head :no_content
    end

    private

    def offense_params
        params.require(:offense_category).permit(:name)
    end

    def set_offense
        @offense = OffenseCategory.find_by_id(params['id'])
    end
end
