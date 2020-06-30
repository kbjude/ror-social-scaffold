RSpec.describe 'First page', type: :system do
  context 'Before accesing the post page' do
    it "redirects to the home page with 'sign up'" do
      visit root_path
      expect(page).to have_content('Sign up')
    end
  end
end
