require 'rails_helper'

RSpec.describe Record, type: :model do
  describe '投稿の保存' do
    context '投稿が投稿できる場合' do
      it '画像とテキストを投稿できる' do
        record = FactoryBot.build(:record)
        expect(record).to be_valid
      end
    end

    context '投稿できない場合' do
      it '投稿文が空では投稿できない' do
        record = FactoryBot.build(:record, record_text: '')
        record.valid?
        expect(record.errors[:record_text]).to include("を入力してください")
      end

      it '画像が空では投稿できない' do
        record = FactoryBot.build(:record)
        record.record_image = nil
        record.valid?
        expect(record.errors[:record_image]).to include("を入力してください")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        record = FactoryBot.build(:record, user: nil)
        record.valid?
        expect(record.errors[:user]).to include("を入力してください")
      end
    end
  end
end
