json.array!(@problem_lists) do |problem_list|
  json.extract! problem_list, :id, :title, :description
  json.url problem_list_url(problem_list, format: :json)
end
