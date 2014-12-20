ActiveAdmin.register Slide do
  menu :parent => "Manage Main Slide"
  permit_params :title, :photo

  index do
    selectable_column
    column :title, :sortable => :title do |slide|
      link_to slide.title, [ :admin, slide]
    end
    column :created_at
    column :updated_at 
    actions
  end

  show do
    attributes_table do
      row :title
      row :photo
    end
  end

  form :html => {:multipart => true} do |f|
    f.inputs "Add/Edit Slide" do
      f.input :title, required: true
      f.input :photo, :as => :file
    end
    f.actions
  end


end
