require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '購入情報の保存' do
    context '購入情報の保存ができるとき' do
      it 'token、郵便番号、都道府県、市区町村、番地、電話番号が存在すれば保存できる' do
        expect(@user_order).to be_valid
      end
    end

    context '購入情報の保存ができないとき' do
      it 'tokenが空だと保存できない' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフン(-)が含まれていないと保存できない' do
        @user_order.postal_code = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が選択されていないと保存できない' do
        @user_order.prefectures_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Prefectures must be other than 1')
      end
      it '市区町村が空だと保存できない' do
        @user_order.municipality = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと保存できない' do
        @user_order.address = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11桁以内でなければ保存できない' do
        @user_order.phone_number = '123456789012'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it '電話番号が英数混在していると保存できない' do
        @user_order.phone_number = '12345678abc'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが空だと保存できない' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
