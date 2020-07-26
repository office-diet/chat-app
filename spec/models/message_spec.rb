require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
      @message.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'contentとimageが存在していれば保存できること' do
      expect(@message).to be_valid
    end
    it 'contentが存在していれば保存できること' do
      message = FactoryBot.build(:message)
      expect(message).to be_valid
    end
    it 'imageが存在していれば保存できること' do
      @message.content = ""
      expect(@message).to be_valid
    end
    it 'contentとimageが空では保存できないこと' do
      message = FactoryBot.build(:message)
      message.content = ""
      message.valid?
      # binding.pry
      expect(message.errors.full_messages).to include("Content translation missing: ja.activerecord.errors.models.message.attributes.content.blank") 
    end
  end
end