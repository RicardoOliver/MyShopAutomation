Dado('que eu estou na página de login') do
    @user = User.new
    @user.load
    sleep(5)
  end
  
  Quando('eu insiro o email validos com sucesso') do
    @user.email_create.set @user.fake_email
    sleep(5)
  end
  
  Quando('clico no botão de create an account') do
    @user.btn_create.click
  end
  
  Então('eu visualizo a página de cadastro') do
    expect(page).to have_content('YOUR PERSONAL INFORMATION')
  end