require 'rails_helper'

describe MessagesController, type: :controller do
let(:user) { create(:user)}
let(:group) { create(:group)}
  describe 'GET #index' do
    context 'log in' do
      before do
        login_user user
        get :index, params: { group_id: group.id }
      end
      it "assigns @message," do
        expect(assigns(:message)).to be_a_new(Message)
      end
      it "renders @group" do
        expect(assigns(:group)).to eq group
      end
      it "renders index " do
        expect(response).to render_template :index
      end
    end
    context 'not log in' do
      before do
        get :index, params: { group_id: group.id }
      end

      it 'redirect_to new_user_sesion_path' do
        expect(response).to redirect_to( new_user_session_path)
      end
    end
  end
  describe 'GET #create' do
    # paramsを擬似的に作成する必要がある。
    let(:params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message) } }

    context 'log in' do
      before do
        login_user user
      end
      context 'save failure' do
          let(:invalid_params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message, message: nil, image: nil) } }

          subject {
            post :create,
            params: invalid_params
          }
        it "do not count up" do
            expect{ subject }.not_to change(Message, :count)
        end
        it "renders the :index template" do
          subject
          expect( response ).to render_template :index
        end
      end
      context 'save sucess' do
        subject {
          post :create,
          params: params
        }
        it "count up message " do
          expect{ subject }.to change(Message, :count).by(1)
        end
        it "redirect_to group_messages_path" do
          subject
          expect(response).to redirect_to( group_messages_path( group ))
        end
      end
    end
    context 'not log in' do
      it 'redirect_to new_user_sesion_path' do
        post :create, params: params
        expect(response).to redirect_to( new_user_session_path )
      end
    end
  end
end
