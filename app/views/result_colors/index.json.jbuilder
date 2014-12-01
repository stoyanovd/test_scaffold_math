json.array!(@result_colors) do |result_color|
  json.extract! result_color, :id, :word, :color
  json.url result_color_url(result_color, format: :json)
end
