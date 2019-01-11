require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#message' do
    it "is valid message without image"do
      # user    = create(:user)
      # user    = create(:group)
      message = build(:message, image: nil)
      message.valid?
    end
  end
  describe '#message' do
      it "is valid message with image" do
      # user    = create(:user)
      # group   = create(:group)
      message = build(:message)
      message.valid?
    end
  end
  describe '#message' do
    it "is valid image without message" do
      # user    = create(:user)
      # group   = create(:group)
      message = build(:message, message: nil)
      message.valid?
    end
  end
  describe '#message' do
    it "is invalid no message without image" do
      # user    = create(:user)
      # group   = create(:group)
      message = build(:message, image: nil, message: nil)
      message.valid?
      expect(message.errors[:message]).to include("を入力してください")
    end
  end
  describe '#message' do
    it "is invalid no group_id" do
      # user    = create(:user)
      # group   = create(:group)
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group]).to include("を入力してください")
    end
  end
  describe '#message' do
    it "is invalid no user_id" do
      # user    = create(:user)
      # group   = create(:group)
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user]).to include("を入力してください")
    end
  end
end
