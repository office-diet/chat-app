require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end
    
    it "nameが空では登録できないこと" do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name translation missing: ja.activerecord.errors.models.user.attributes.name.blank")
    end
    
    it "emailが空では登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email translation missing: ja.activerecord.errors.models.user.attributes.email.blank")
    end
    
    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password translation missing: ja.activerecord.errors.models.user.attributes.password.blank")  
    end
    
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation translation missing: ja.activerecord.errors.models.user.attributes.password_confirmation.confirmation")
    end
    
    it "passwordが6文字以上であれば登録できること" do  
      @user.password = "000000"
      @user.password_confirmation = @user.password
      expect(@user).to be_valid
    end
    
    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "00000"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password translation missing: ja.activerecord.errors.models.user.attributes.password.too_short")  
    end
    
    it "重複したemailが存在する場合登録できないこと" do
      user = User.new()
      user.name = @user.name
      user.password = @user.password
      user.password_confirmation = @user.password
      user.email = @user.email
      user.save

      user = User.new()
      user.name = @user.name
      user.password = @user.password
      user.password_confirmation = @user.password
      user.email = @user.email
      user.valid? 
      expect(user.errors.full_messages).to include("Email translation missing: ja.activerecord.errors.models.user.attributes.email.taken")
    end
    
  end
end