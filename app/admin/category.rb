ActiveAdmin.register Category do
  menu :parent => "Manage Blog"
  permit_params :name
end
