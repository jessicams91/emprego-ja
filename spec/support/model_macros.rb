module ModelsMacros
  def create_company(name: nil)
    name ||= 'Campus Code'
    Company.create(name: name,
                   location: 'São Paulo',
                   phone: '11 2369 3476',
                   mail: 'contato@campuscode.com.br')
  end

  def create_category(attrs = {})
    Category.create({ name: 'Desenvolvedor' }.merge(attrs))
  end

  def create_job_type
    JobType.create(name: 'CLT')
  end

  def create_job(title: nil, company: nil, category: nil, job_type: nil, location: nil, description: nil)
    company ||= create_company
    category ||= create_category
    job_type ||= create_job_type
    location ||= 'São Paulo'
    description ||= 'Desenvolvedor Full Stack Rails'
    title ||= 'Desenvolvedor Rails'
    company.jobs.create(title:       title,    description: description,
                        location:    location, category:    category,
                        job_type:    job_type)
  end

  def sign_in
    user = User.create(username:              'John Doe',
                       email:                 'johndoe@yahoo.com.br',
                       password:              'senhabruta',
                       password_confirmation: 'senhabruta')

    visit root_path

    click_on 'Entrar'

    fill_in 'Email',                  with: user.email
    fill_in 'Senha',                  with: user.password

    click_button 'Entrar'
  end
end
