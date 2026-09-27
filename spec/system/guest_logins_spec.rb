require "rails_helper"

RSpec.describe "ゲストログイン" ,type: :system do
  it "ゲストログインボタンでログインができ、一覧が表示される" do
    visit new_user_session_path
    click_button "ゲストログイン", match: :first

    expect(page).to have_content "ゲストとしてログインしました"
    expect(page).to have_content "登録中のサブスク"
    expect(page).to have_content "guest@example.com"
  end

end