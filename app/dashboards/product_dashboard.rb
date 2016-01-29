require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    merchant: Field::BelongsTo,
    catalog: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    description: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    detail_page_url: Field::String,
    manufacturer: Field::String,
    list_price: Field::Number,
    title: Field::String,
    small_image_url: Field::String,
    medium_image_url: Field::String,
    price: Field::Number,
    amount_saved: Field::Number,
    percentage_saved: Field::Number,
    is_supersaver_shipping: Field::Boolean,
    is_prime: Field::Boolean,
    ASIN: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :merchant,
    :catalog,
    :id,
    :name,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :merchant,
    :catalog,
    :id,
    :name,
    :description,
    :created_at,
    :updated_at,
    :detail_page_url,
    :manufacturer,
    :list_price,
    :title,
    :small_image_url,
    :medium_image_url,
    :price,
    :amount_saved,
    :percentage_saved,
    :is_supersaver_shipping,
    :is_prime,
    :ASIN,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :merchant,
    :catalog,
    :name,
    :description,
    :detail_page_url,
    :manufacturer,
    :list_price,
    :title,
    :small_image_url,
    :medium_image_url,
    :price,
    :amount_saved,
    :percentage_saved,
    :is_supersaver_shipping,
    :is_prime,
    :ASIN,
  ]

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(product)
  #   "Product ##{product.id}"
  # end
end
