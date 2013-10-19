json.array!(@digital_object_identifiers) do |digital_object_identifier|
  json.extract! digital_object_identifier, :string_identifier, :integer_identifier, :description
  json.url digital_object_identifier_url(digital_object_identifier, format: :json)
end
