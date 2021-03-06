ActiveAdmin.register BusinessPartner, :namespace => false do
  menu :parent => "Partners"
  actions :all, :except => [:destroy]
  config.filters = false

  index do
    column :id
    column :name
    column :phone
    column :email, :sortable => false
    column :business_partner_type, :sortable => false
    column :shipping, :sortable => false
    column :credit_limit do |rec|
      number_to_currency rec.credit_limit, :unit => "$"
    end
    column :credit_balance do |rec|
      number_to_currency rec.credit_balance, :unit => "$"
    end

    default_actions
  end

  show :title => :name do |bp|
    attributes_table do
      row :id
      row :name
      row :phone
      row :email
      row :billing_address
      row :shipping_address
      row :business_partner_type
      row :shipping
      row :credit_limit do |rec|
        number_to_currency rec.credit_limit, :unit => "$"
      end
      row :credit_balance do |rec|
        number_to_currency rec.credit_balance, :unit => "$"
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :phone
      f.input :email
      f.input :billing_address,       :input_html => { :rows => 4 }
      f.input :shipping_address,      :input_html => { :rows => 4 }
      f.input :business_partner_type
      f.input :shipping
      f.input :credit_limit
      f.input :credit_balance
    end
    f.buttons
  end
end
