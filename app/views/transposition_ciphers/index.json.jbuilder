json.array!(@transposition_ciphers) do |transposition_cipher|
  json.extract! transposition_cipher, :id, :input, :user_id, :keyword, :output
  json.url transposition_cipher_url(transposition_cipher, format: :json)
end
