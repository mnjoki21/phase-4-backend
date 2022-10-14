class UsersSerializer < ActiveModel::Serializer
  attributes :id, :password_digest
end
