class SubscriptionsSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :start_date, :billing_cycle
end
