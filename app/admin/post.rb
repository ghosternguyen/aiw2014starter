ActiveAdmin.register Post do
  menu :parent => "Manage Blog"

  permit_params :category_id, :title, :body, :description, :image

  index do
    selectable_column
    column :title, :sortable => :title do |post|
      link_to post.title, [ :admin, post]
    end
    column :category_id do |post|
      link_to post.category.name, [ :admin, post ]
    end
    column :created_at
    column :updated_at 
    actions
  end 

  show do
    attributes_table do
      row :title
      row :body
      row :image
      row :category_id
    end
  end 



  form :html => {:multipart => true} do |f|
    f.inputs "Add/Edit Post" do
      f.input :category_id, :as => :select, :collection => Category.all, :label => "Category"
      f.input :title, required: true
      f.input :body, required: true, as: :wysihtml5
      f.input :image, :as => :file, :hint => f.object.image.present? \
        ? f.template.image_tag(f.object.image.url(:thumb))
        : f.template.content_tag(:span, "No image yet")
      f.input :image_cache, :as => :hidden
      f.input :description, as: :wysihtml5
    end
    f.actions
  end
end
