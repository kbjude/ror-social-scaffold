# require 'rails_helper'

# RSpec.describe UsersController, type: :controller do
#     describe 'Check frienship and users' do
#         let(:created_user){User.create(:name => "Jude", :email => "kk@gmail.com", :password => "Heaven")}
#         let(:failed_user){User.create(:name => "Chris", :email =>" ", :password => " ")}
#         before do
#             created_user
#             failed_user
#         end
#         it 'get all registered users' do
#             get(:index)
#             expect(assigns(:created_user)).to eql([created_user])
#         end
#     end
# end