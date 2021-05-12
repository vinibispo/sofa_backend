json.extract! plan, :id, :room, :area, :enterprise_id, :created_at, :updated_at
json.image polymorphic_url(plan.image) if plan.image.present?
