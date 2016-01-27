module ModelsMacros
  def create_company
    Company.create(name: 'Campus Code',
                   location: 'São Paulo',
                   phone: '11 2369 3476',
                   mail: 'contato@campuscode.com.br')
  end

  def create_category
    Category.create(name: 'Desenvolvedor')
  end

  def create_job(company = nil, category = nil)
    company ||= create_company
    category ||= create_category
    company.jobs.create(title: 'Desenvolvedor Rails',
               description: 'Desenvolvedor Full Stack Rails',
               location: 'São Paulo - SP',
               category: category)
  end

  def sign_in

    user = User.create(username:                'John Doe',
                       email:                   'johndoe@yahoo.com.br',
                       password:                'senhabruta',
                       password_confirmation:   'senhabruta')

    visit root_path

    click_on 'Entrar'

    fill_in 'Email',                  with: user.email
    fill_in 'Senha',                  with: user.password

    click_button 'Entrar'
    
  end


end
