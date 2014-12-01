json.array!(@problems) do |problem|
  json.extract! problem, :id, :number, :body, :problem_list_id
  json.url problem_url(problem, format: :json)
end
