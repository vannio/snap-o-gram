json.array!(@pictures) do |picture|
  json.extract! picture, :id, :file_path, :caption
  json.url picture_url(picture, format: :json)
end
