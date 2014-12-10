ActiveAdmin.setup do |config|

  config.site_title = "Techie History Alltime Apple products"

  config.namespace :admin do |admin|
    admin.build_menu :utility_navigation do |menu|
      menu.add label: "GhoSter..,Inc", url: "http://www.thinghost.co.vu", html_options: { target: :blank }
      admin.add_current_user_to_menu  menu
      admin.add_logout_button_to_menu menu
    end
    admin.site_title = "Admin SiteArea"
  end

  config.namespace :super_admin do |super_admin|
    super_admin.site_title = "Super Admin SiteArea"
  end

  config.authentication_method = :authenticate_admin_user!

  config.current_user_method = :current_admin_user

  config.logout_link_path = :destroy_admin_user_session_path

  config.batch_actions = true

end

ActiveAdmin.register Post do
  permit_params :title, :body, :photo
end
