module Api
    class AnswersController < Api::BaseController

        private

            def answer_params
                params.require(:answer).permit(:title, :body, :question_id)
            end

            def query_params
                params.permit(:title)
            end
    end
end