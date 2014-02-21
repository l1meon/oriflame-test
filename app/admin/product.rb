ActiveAdmin.register Product do
  menu label: 'Продукты'

  controller do
    def permitted_params
      params.permit(:product => [:title, :description, :image_url, :about_product, :ingredients, :category_id, :price])
    end

  end

  form partial: 'form'


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
  
end
