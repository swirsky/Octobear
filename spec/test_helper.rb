module TestHelper

  def sign_in(user, extra_params={})
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)
    else
      user = setup_user(user, extra_params={})
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
    return user
  end

  def setup_user(user, extra_params={})
    user = User.create(email:'test@test.com')
    if extra_params[:add_links]
      l = Link.create(url:"http://www.google.com")
      user.links << l
    end
    return user
  end

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = User.create(email:"test@test.com")
    @user = double('user')
    allow(request.env['warden']).to receive(:authenticate!) { @user }
    allow(controller).to receive(:current_user) { @user }
  end

  def kill_user
    @user.destroy
  end
end
