# frozen_string_literal: true

class CatSerializer < ActiveModel::Serializer
  attributes :name, :age
end
