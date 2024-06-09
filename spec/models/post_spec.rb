require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿の保存' do
    context '投稿が投稿できる場合' do
      it '画像とテキストを投稿できる' do
        expect(@post).to be_valid
      end
    end

    context '投稿できない場合' do
      it 'タイトルが空では投稿できない' do
        @post.post_title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Post title を入力してください")
      end

      it '投稿文が空では投稿できない' do
        @post.post_text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Post text を入力してください")
      end 

      it '画像が空では投稿できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image を入力してください")
      end  

      it 'ユーザーが紐付いていなければ投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User を入力してください")
      end
    end
  end
end
