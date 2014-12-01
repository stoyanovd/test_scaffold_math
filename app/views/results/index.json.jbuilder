json.array!(@results) do |result|
  json.extract! result, :id, :status, :student_id, :problem_id
  json.url result_url(result, format: :json)
end
