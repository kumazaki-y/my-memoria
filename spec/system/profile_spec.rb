require 'rails_helper'

RSpec.describe "プロフィールページ", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:article) { create(:article, :with_image, user: user) }

  before do
    driven_by(:selenium_chrome_headless)
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'LOGIN'
    visit profile_path
  end

  it 'ユーザーの投稿した記事の画像が表示されている' do
    expect(page).to have_selector('.article-image')
  end
end
