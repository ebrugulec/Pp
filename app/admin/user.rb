ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :full_name, :email

index do
  selectable_column
  id_column
  column :email
  column :full_name
  column :current_sign_in_at
  column :sign_in_count
  column :created_at
  actions

end

controller do
    def create
      user = params[:user]
      User.invite!(email: user['email'])
      redirect_to new_admin_user_path
    end
  end

form do |f|
    inputs 'Invite People ' do
      input :email, label: "Email"
    end
    actions
  end
end
