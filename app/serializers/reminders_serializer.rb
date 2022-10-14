class RemindersSerializer < ActiveModel::Serializer
  attributes :id, :provider :category, :subscription
end
