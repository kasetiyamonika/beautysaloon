ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :category_id, :description, :mrp, :discount, :discount_type, :image

  form do |f|
   f.semantic_errors # shows errors on :base
   f.inputs do
     # f.select :category
     f.input :name
     f.input :category, as: :select
     f.input :description
     f.input :mrp
     f.input :discount
     f.input :discount_type
     f.input :image, as: :file
     f.actions
   end
 end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :category_id, :description, :mrp, :discount, :discount_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
