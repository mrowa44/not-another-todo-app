require 'rails_helper'

RSpec.describe ListsController, type: :controller do

  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe 'GET #index'do
    it 'responds successfully with a 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template('index')
    end

    it "loads all user's lists into @lists" do
      list1 = user.lists.create(title: 'list1')
      list2 = user.lists.create(title: 'list2')
      get :index
      expect(assigns(:lists)).to match_array([list1, list2])
    end
  end

  describe 'GET #show' do
    before do
      @list = user.lists.create(title: 'list')
    end

    it 'renders show template' do
      get :show, id: @list.id
      expect(response).to render_template('show')
    end

    it 'loads all todos belonging to list in ascending order' do
      todo1 = @list.todos.create(task: 'Some task', state: true)
      todo2 = @list.todos.create(task: 'Another task', state: false)
      get :show, id: @list.id
      expect(assigns(:todos)).to match_array([todo2, todo1])
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'redirects to the new list' do
        post :create, list: { title: 'List' }
        expect(response).to redirect_to(List.last)
      end

      it 'creates a new list' do
        expect{ post :create, list: { title: 'List' } }.to change(List, :count).by 1
      end
    end

    context 'with invalid params' do
      it 're-renders index template' do
        post :create, list: { title: '' }
        expect(response).to render_template('index')
      end
    end
  end

  describe 'PATCH #update' do

    it 'redirects to list on successfull update' do
      list = user.lists.create!(title: 'Not changed title')
      patch :update, id: list.id, user_id: user.id, list: {title: 'Changed title' }
      last_changed = List.order('updated_at').last
      expect(response).to redirect_to(last_changed)
    end

    it 'renders edit template on unsuccessfull update' do
      list = user.lists.create!(title: "This won't work")
      patch :update, id: list.id, user_id: user.id, list: { title: '' }
      expect(response).to render_template('edit')
    end
  end

  describe 'DELETE #destroy' do
    before do
      @list = user.lists.create!(title: 'Delete this')
    end

    it 'destroys list' do
      expect{ delete :destroy, id: @list.id }.to change(List, :count).by -1
    end

    it 'redirects to lists index' do
      delete :destroy, id: @list.id
      expect(response).to redirect_to(lists_path)
    end
  end
end
