json.array!(@pages) do |page|
  json.extract! page, :id, :book_id, :text
  json.url page_url(page, format: :json)
end
