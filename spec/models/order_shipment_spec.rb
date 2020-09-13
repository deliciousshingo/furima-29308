require 'rails_helper'

RSpec.describe OrderShipment, type: :model do
  describe '購入情報の保存' do
    before do
      @order_shipment = FactoryBot.build(:order_shipment)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_shipment).to be_valid
    end
    it 'postalが空だと保存できないこと' do
      @order_shipment.postal = nil
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include ("Postal can't be blank")
    end
    it 'postalが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_shipment.postal = '1234567'
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include ("Postal is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @order_shipment.prefecture_id = nil
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include
    end
    it 'cityはが空だと保存できないこと' do
      @order_shipment.city = nil
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include ("City can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @order_shipment.house_number = nil
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include ("House number can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @order_shipment.building = nil
      expect(@order_shipment).to be_valid
    end
    it "phone_numberが11文字以内であれば保存できること" do
      @order_shipment.phone_number = '09000000000'
      expect(@order_shipment).to be_valid
    end
    it "phone_numberが9文字以下であれば保存できないこと" do
      @order_shipment.phone_number = '090000000'
      expect(@order_shipment.errors.full_messages).to include
    end
    it 'tokenが空だと保存できないこと' do
      @order_shipment.token = nil
      expect(@order_shipment.errors.full_messages).to include
    end
    
  end
end
