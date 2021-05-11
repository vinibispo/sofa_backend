json.extract! enterprise, :id, :nome, :endereco, :created_at, :updated_at
json.url enterprise_url(enterprise, format: :json)
json.image polymorphic_url(enterprise.image) if enterprise.image.present?
