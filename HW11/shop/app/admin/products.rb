ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :price, :image,
                product_categories_attributes: %i[id product_id category_id _destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs 'Products category' do
      f.input :name
      f.input :description
      f.input :price
      f.input :image
      f.has_many :product_categories, allow_destroy: true do |n_f|
        n_f.input :category
      end

      f.actions
    end
  end
end
