require 'delegate'

class JobDecorator < SimpleDelegator
include Rails.application.routes.url_helpers

  def to_json(options = {})
      job_json = JSON.parse(__getobj__.to_json(options))
      
      job_json.delete("company_id")
      job_json.delete("category_id")

      job_json.merge("company_path" => api_company_path(__getobj__)).merge("category_path" => api_category_path(__getobj__)).to_json
  end
end
