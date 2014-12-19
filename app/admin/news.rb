ActiveAdmin.register News do
  menu :parent => "Manage Blog"

  permit_params :title, :content, :credit, :image

  index do
    selectable_column
    column :title, :sortable => :title do |news|
      link_to news.title, [ :admin, news]
    end
    column :created_at
    column :updated_at 
    actions
  end 
  show do
    attributes_table do
      row :title
      row :content
      row :image
      row :credit
    end
  end 

  form(:html => { :multipart => true }) do |f|
    f.inputs "Create News..." do
      f.input :title
      f.input :content, as: :wysihtml5
      f.input :credit
      f.input :image, :as => :file, :hint => f.object.image.present? \
        ? f.template.image_tag(f.object.image.url(:thumb))
        : f.template.content_tag(:span, "No image yet")
      f.input :image_cache, :as => :hidden
     end
    f.actions
  end

end
