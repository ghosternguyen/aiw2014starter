ActiveAdmin.register Post do
  menu :parent => "Manage Blog"

  permit_params :category_id, :title, :body, :description, :image

  index do
    selectable_column
    column :title, :sortable => :title do |post|
      link_to post.title, [ :admin, post]
    end
    column :category_id do |post|
      link_to post.category.name, [ :admin, post]
    end
    column :created_at
    column :updated_at 
    actions
  end 

  show do |post|
    attributes_table do
      row :title
      row :category_id
      row :body do
        raw post.body
      end
      row :image do
        image_tag(post.image.url(:thumb))
      end
    end
  end 



  form :html => {:multipart => true} do |f|
    f.inputs "Add/Edit Post" do
      f.input :category_id, :as => :select, :collection => Category.all, :label => "Category"
      f.input :title, required: true
      f.input :body, required: true, :as => :ckeditor
      f.input :image, :as => :file, :hint => f.object.image.present? \
      ? f.template.image_tag(f.object.image.url(:thumb))
      : f.template.content_tag(:span, "No Image yet")
      if f.object.image?
        f.input :remove_image, :as => :boolean
      end
      f.input :image_cache, :as => :hidden
      f.input :description
    end
    f.actions
  end
end
