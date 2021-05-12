json.extract! user, :id, :name, :email, :cpf, :born_date, :phone_1, :phone_2, :created_at, :updated_at
json.url user_url(user, format: :json)
