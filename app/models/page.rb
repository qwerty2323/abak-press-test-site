# coding: utf-8
class Page < ApplicationRecord
  validates :name, :title, :content, :slug, presence: true
  validates :name, uniqueness: true
  validates :name, format: { with: /[a-zA-zа-яА-Я0-9]/xi }
  validates :name, length: { minimum: 2 }
  has_many :subpages, class_name: "Page"
  before_validation :generate_slug

  def generate_slug
    name_as_slug = Russian.translit(name).parameterize
    if parent.present?
      self.slug = [parent.slug, (slug.blank? ? name_as_slug : slug.split('/').last)].join('/')
    else
      self.slug = name_as_slug if slug.blank?
    end
  end
end
