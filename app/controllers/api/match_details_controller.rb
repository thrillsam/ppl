class Api::MatchDetailsController < Api::BaseController
	before_action :find_match_detail, only: :show

	def index
		render json: MatchDetail.all		
	end

	def show
		render json: @match_detail
	end

	private
		def find_match_detail
			MatchDetail.find(params[:id])
		end
end