require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'nameとtext、category_idとstate_id、deliver_fee_id、deliver_area_id、deliver_date_id、price、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'state_idが空だと登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it 'state_idが1だと登録できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end
      it 'deliver_fee_idが空だと登録できない' do
        @item.deliver_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliver fee can't be blank")
      end
      it 'deliver_fee_idが1だと登録できない' do
        @item.deliver_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Deliver fee must be other than 1')
      end
      it 'deliver_area_idが空だと登録できない' do
        @item.deliver_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliver area can't be blank")
      end
      it 'deliver_area_idが1だと登録できない' do
        @item.deliver_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Deliver area must be other than 1')
      end
      it 'deliver_date_idが空だと登録できない' do
        @item.deliver_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliver date can't be blank")
      end
      it 'deliver_date_idが1だと登録できない' do
        @item.deliver_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Deliver date must be other than 1')
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満だと登録できない' do
        @item.price = rand(0..299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10,000,000以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが英字では登録できない' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが全角ひらがなでは登録できない' do
        @item.price = 'かな'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが全角カタカナでは登録できない' do
        @item.price = 'カナ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが漢字では登録できない' do
        @item.price = '漢字'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

    end

  end
end
