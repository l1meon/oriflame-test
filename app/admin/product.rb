ActiveAdmin.register Product do
  menu label: 'Продукты'

  controller do
    def permitted_params
      params.permit(:product => [:title, :description, :image_url, :about_product, :ingredients, :category_id, :price])
    end

  end

  form do |f|
    f.inputs "Детали" do
      f.input :category_id, label:'Категория', :as => :select, :collection => Category.all.map{|c| ["#{c.name}", c.id]}
      f.input :title, label: 'Наименование'
      f.input :image_url, label: "Картинка"
      f.input :description, label: "Описание"
      f.input :about_product, label: "О продукте"
      f.input :ingredients, label: "Ингредиенты"
      f.input :price, label: "Стоимость"
    end
    f.actions
  end


  index title: 'Продукты' do
    column :id
    column "Категория", :category
    column "Название", :title
    column 'Управление' do |resource|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.view'), resource_path(resource), class: 'btn btn-success white'

      links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource),
                       :class => 'btn btn-info white'
      links += link_to I18n.t('active_admin.delete'), resource_path(resource),
                       :method => :delete,
                       :confirm => I18n.t('active_admin.delete_confirmation'), class: 'btn btn-danger white'
      links
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
