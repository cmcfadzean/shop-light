json.extract! site, :id, :title, :url, :shopify_url, :shopify_key, :logo, :primary_color, :created_at, :updated_at
json.url site_url(site, format: :json)
