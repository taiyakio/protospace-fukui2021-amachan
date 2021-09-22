require 'rails_helper'

RSpec.describe Prototype, type: :model do
  before do
    @prototype = FactoryBot.build(:prototype)
  end

  describe 'プロトタイプ投稿' do
    context '投稿できるとき' do
      it 'nameとcatch_copyとconceptとimageが存在すれば登録できる' do
        expect(@prototype).to be_valid
      end
    end
    context '投稿できないとき' do
      it 'nameが空では登録できない' do
        @prototype.name = ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("プロトタイプの名称を入力してください")
      end
      it 'catch_copyが空では登録できない' do
        @prototype.catch_copy = ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("キャッチコピーを入力してください")
      end
      it 'imageが空では登録できない' do
        @prototype.image = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include( )
      end
      it 'userが紐付いていないと保存できない' do
        @prototype.user = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end