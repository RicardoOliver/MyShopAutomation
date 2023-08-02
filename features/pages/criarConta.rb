class User < SitePrism::Page
    #endpoint
    set_url 'index.php?controller=authentication&back=my-account#account-creation'

    #elements tela de login - Page

    element :email_create, '#email_create'
    element :btn_create, '#SubmitCreate'


    #methods tela de login - Page
    #fake email

    def fake_email
        Faker::Internet.email
    end

    def criar_conta
        email_create.set fake_email
        btn_create.click
    end

end