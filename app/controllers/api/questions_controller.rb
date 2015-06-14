module Api
	class QuestionsController < Api::BaseController

		private

			def question_params
				params.require(:question).permit(:title, :body, :published)
			end

			def query_params
				params.permit(:title)
			end
	end
end