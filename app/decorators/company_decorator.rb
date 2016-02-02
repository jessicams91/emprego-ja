require 'delegate'

class CompanyDecorator < SimpleDelegator

  def to_json(options = {})
      company_json = JSON.parse(__getobj__.to_json(options))
      company_json.merge("jobs_path" => 'companies/1/jobs').to_json
  end
end
