class List
  include Mongoid::Document
  include Mongoid::Timestamps
  field :day, type: Date
  field :paid, type: Mongoid::Boolean
  field :cost, type: BigDecimal
  field :comment, type: String
  has_many :list_items, dependent: :destroy
end
