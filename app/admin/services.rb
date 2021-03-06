ActiveAdmin.register Service do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
permit_params :name, :price, :description, :image

  form do |f|
   f.semantic_errors # shows errors on :base
   f.inputs do
     # f.select :category
     f.input :name
     f.input :price
     f.input :description
     f.input :image, as: :file
     f.actions
   end
 end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
