require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ログインしていない場合、サインページに移動する' do
    # トップページに遷移する
    visit root_path
    # ログインしていない場合、サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
  end
  
  it 'ログインに成功し、ルートパスに遷移する' do    
    # サインインページへ移動する
    visit root_path
    # ログインしていない場合、サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
    # すでに保存されているユーザーのemailとpasswordを入力する
    sign_in(@user)
  end
  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # サインインページへ移動する
    visit root_path
    # 誤ったユーザー情報を入力する
    fill_in 'Email', with: @user.email + "misstake"
    fill_in 'Password', with: @user.password   
    # ログインボタンをクリックする
    find('input[name="commit"]').click
    # サインインページに遷移していることを期待する
    expect(current_path).to eq new_user_session_path
  end
end