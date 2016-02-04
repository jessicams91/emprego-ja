require 'delegate'

class CompanyDecorator < SimpleDelegator
  include Rails.application.routes.url_helpers

  def to_json(options = {})
    company_json = JSON.parse(__getobj__.to_json(options))
    company_json.merge('jobs_path' =>
                        jobs_api_company_path(__getobj__)).to_json
  end
end
