ActiveAdmin.register News do
  menu :parent => "Manage Blog"

  permit_params :title, :content, :credit, :image

  index do
    selectable_column
    id_column
    column :title
    column :image
    column :created_at
    column :updated_at
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Create News..." do
      f.input :title
      f.input :content
      f.input :credit
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url)
     end
    f.actions
  end

end
