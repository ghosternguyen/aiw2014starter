ActiveAdmin.register Post do
  menu :parent => "Manage Blog"

  permit_params :category_id, :title, :body, :description, :image

    show do |ad|
      attributes_table do
        row :id
        row :category_id
        row :title
        row :body
        row :description
        row :image do
          image_tag post.image_url(:thumb)
        end
        row :created_at
        row :updated_at
      end
      active_admin_comments
    end



    form :html => {:multipart => true} do |f|
      f.inputs "Create Post..." do
        f.input :category_id, :as => :select, :collection => Category.all, :label => "Category"
        f.input :title, required: true
        f.input :body, required: true
        f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url)
        f.input :description, as: :wysihtml5
      end
      f.actions
    end
end
