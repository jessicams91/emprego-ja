require 'rails_helper'

feature 'Visitor does not view expired jobs' do
  scenario 'successfully' do
    travel_to 100.days.ago do
      create_job
    end

    job = Job.first

    visit root_path

    expect(page).not_to have_content job.title
  end

  scenario "and sees a warning message at the job's page" do
    travel_to 100.days.ago do
      create_job
    end

    job = Job.first

    visit job_path(job)

    expect(page).to have_content 'Vaga Expirada'
  end
end
