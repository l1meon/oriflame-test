ActiveAdmin.register Order do


  show title: proc{"Заказчик #{@order.last_name} " " #{@order.first_name}"} do |order|
    panel "Детали Заказчика" do
      attributes_table_for order do
        [:id, :first_name, :last_name, :email, :phone, :adress, :created_at].each do |column|

        end
        row "Идентификатор" do
          order.id
        end
        row "Имя" do
          order.first_name
        end
        row "Фамилия" do
          order.last_name
        end
        row "Дата Заказа" do
          order.created_at
        end
        row "Контактый номер" do
          order.phone
        end
        row "Адрес доставки" do
          order.adress
        end
        row "Електронная почта" do
          order.email
        end
      end
    end

    panel "Товары этого заказа" do
      table_for(order.items) do
        column "Товары" do |item|
          item.product.title
        end

        column "Цена" do |item|
          item.product.price
        end

        column "Количество" do |item|
          item.quantity
        end
        column "Всего" do |item|
          item.total_price
        end
      end
    end

  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
