class ListItem
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :quantity, type: String
  belongs_to :list
end
