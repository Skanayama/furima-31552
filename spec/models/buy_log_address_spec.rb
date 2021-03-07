require 'rails_helper'

describe BuyLogAddress do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_log_address = FactoryBot.build(:buy_log_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'postal_codeとdeliver_area_id、city、house_number、phone_number、tokenが存在すれば登録できる' do
        expect(@buy_log_address).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @buy_log_address.building_name = nil
        expect(@buy_log_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @buy_log_address.postal_code = ''
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'deliver_area_idが空だと登録できない' do
        @buy_log_address.deliver_area_id = ''
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Deliver area can't be blank")
      end
      it 'cityが空だと登録できない' do
        @buy_log_address.city = ''
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("City can't be blank")
      end
      it 'deliver_area_idが1だと登録できない' do
        @buy_log_address.deliver_area_id = 1
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include('Deliver area must be other than 1')
      end
      it 'phone_numberが空だと登録できない' do
        @buy_log_address.phone_number = ''
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeにハイフンがないと登録できない' do
        @buy_log_address.postal_code = '1660025'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'phone_numberが11桁以内出ないと登録できない' do
        @buy_log_address.phone_number = '123456789012'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが英数字混合では登録できない' do
        @buy_log_address.phone_number = 'a23456789012'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @buy_log_address.token = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空では登録できないこと" do
        @buy_log_address.user_id = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @buy_log_address.item_id = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Item can't be blank")
      end

    end

  end
end

