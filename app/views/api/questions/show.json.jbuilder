json.(@question, :id, :title, :body, :published, :created_at, :updated_at)
json.answers @question.answers, :id, :title, :body, :created_at, :updated_at