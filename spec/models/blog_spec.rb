require 'rails_helper'

RSpec.describe Blog, type: :model do
  before do
    @blog = FactoryBot.build(:blog)
  end

  describe '投稿の保存' do
    context '投稿が投稿できる場合' do
      it '画像とテキストを投稿できる' do
        expect(@blog).to be_valid
      end
    end

    context '投稿できない場合' do
      it 'タイトルが空では投稿できない' do
        @blog.blog_title = ''
        @blog.valid?
        expect(@blog.errors.full_messages).to include("blog title を入力してください")
      end

      it '投稿文が空では投稿できない' do
        @blog.blog_text = ''
        @blog.valid?
        expect(@blog.errors.full_messages).to include("blog text を入力してください")
      end 

      it '画像が空では投稿できない' do
        @blog.image = nil
        @blog.valid?
        expect(@blog.errors.full_messages).to include("Image を入力してください")
      end  

      it 'ユーザーが紐付いていなければ投稿できない' do
        @blog.user = nil
        @blog.valid?
        expect(@blog.errors.full_messages).to include("User を入力してください")
      end
    end
  end
end
