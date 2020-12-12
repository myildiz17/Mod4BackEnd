class NoteSerializer < ActiveModel::Serializer
  attributes :title, :content, :id

  belongs_to :user
end
