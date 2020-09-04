require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能の登録' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('Railsの処理の流れ_0409.png')
    end

    it 'すべての値が正しく入力されていれば登録できること' do
      expect(@item).to be_valid
    end
    it 'titleが空だと登録できないこと' do
      @item.title = ""
      @item.valid?
      expect(@item.errors.full_messages).to include
    end
    it 'imageが空だと登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Image can't be blank")
    end
    it 'descriptionが空だと登録できないこと' do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include 
    end
    it 'categoryを選択していないと登録できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include 
    end
    it 'conditionを選択していないと登録できないこと' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include 
    end
    it 'ship_feeを選択していないと登録できないこと' do
      @item.ship_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include 
    end
    it 'regionを選択していないと登録できないこと' do
      @item.region_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include 
    end
    it 'ship_dateを選択していないと登録できないこと' do
      @item.ship_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include 
    end
    it 'priceが空だと登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price is invalid. Input half-width characters.")
    end
    it 'priceが300円未満では登録できないこと' do
      @item.price = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'priceが9,999,999円を超過すると登録できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'priceが全角数字だと登録できないこと' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
  end
end
