class Contact < ApplicationRecord
  belongs_to :category # , optional: true
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  # def birthdate_br
  #   I18n.l(birthdate) unless birthdate.blank?
  # end

  # def author
  #   'Erick Valente'
  # end

  # def category_description
  #   category.description
  # end

  # def as_json(_args = {})
  #   super(
  #     root: true,
  #     methods: %i[author category_description]
  #     include: { category: { only: :description }} -> Para visualização aninhada
  #   )
  # end
end
