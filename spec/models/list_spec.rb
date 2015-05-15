require 'rails_helper'

RSpec.describe List, type: :model do

  it { should have_many(:todos).dependent(:destroy) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }

  it 'should add new list' do
    List.create(title: 'Some other title')
    expect(List.count).to eq 1
  end

  it 'should not add list when title is not present' do
    List.create(title: '')
    expect(List.count).to eq 0
  end
end
