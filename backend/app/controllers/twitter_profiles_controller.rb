class TwitterProfilesController < ApplicationController
    before_action :set_prof, only: [:show, :update, :destroy]

    def index
        @profs = TwitterProfile.all
        render json: @profs
    end
    # def show
    #     render json: @prof
    # end
    def create
        @prof = TwitterProfile.create!(prof_params)
        if params[:offense_categories]
            params[:offense_categories].each do |offense|
                @prof.offense_categories << OffenseCategory.find_by_id(offense)
            end
        end

        render json: @prof
    end
    def update
        @prof.update(prof_params)
        head :no_content
    end
    def destroy
        @prof.destroy
        head :no_content
    end

    private

    def prof_params
        params.require(:twitter_profile).permit(:username, :user_id, :display_name)
    end

    def set_prof
        @prof = TwitterProfile.find_by_id(params['id'])
    end
end