# coding: utf-8
class Page < ApplicationRecord
  validates :name, :content, presence: true
  validates :name, uniqueness: true
  validates :name, format: { with: /[a-zA-zа-яА-Я0-9]/xi }
  validates :name, length: { minimum: 2 }
  has_many :subpages, class_name: "Page"
end
