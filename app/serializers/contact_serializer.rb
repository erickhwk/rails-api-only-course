class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate_iso

  belongs_to :category do
    link(:related) { category_url(object.category.id) }
  end
  has_many :phones
  has_one :address

  link(:self) { contact_url(object.id) }

  def birthdate_iso
    object.birthdate.to_time.iso8601 unless object.birthdate.blank?
  end
end
