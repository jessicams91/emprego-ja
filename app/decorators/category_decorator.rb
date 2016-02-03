require 'delegate'

class CategoryDecorator < SimpleDelegator
include Rails.application.routes.url_helpers

  def to_json(options = {})
      category_json = JSON.parse(__getobj__.to_json(options))
      category_json.merge("jobs_path" => jobs_api_category_path(__getobj__)).to_json
  end
end
