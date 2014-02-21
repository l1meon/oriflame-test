ActiveAdmin.register Category do
  menu label: 'Категории'
  controller do
    def permitted_params
      params.permit(:category => [:name])
    end

  end

  index title: 'Категории' do
    column :id
    column 'Имя категории', :name
    column 'Дата Создания', :created_at
    #actions defaults: false do |cat|
    #  link_to 'Открыть', admin_category_path(cat), class: 'btn btn-success white'
    #  link_to 'Изменить', edit_admin_category_path(cat), class: 'btn btn-info white'
    #  link_to 'Удалить', admin_category_path(cat), class: 'btn btn-danger white', method: :delete, data: { confirm: 'Are you sure?'}
    #end
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
