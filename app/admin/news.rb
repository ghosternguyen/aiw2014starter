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

  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      f.input :credit
      f.input :image, :as => :file
     end
    f.actions
  end

end
