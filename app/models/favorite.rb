# frozen_string_literal: true
class Favorite < ApplicationRecord
  extend ActsAsFavoritor::FavoriteScopes

  belongs_to :favoritable, polymorphic: true
  belongs_to :favoritor, polymorphic: true

  validates :favoritable_type, presence: true
  validates :favoritable_id, presence: true
  validates :favoritor_type, presence: true
  validates :favoritor_id, presence: true
  validates :scope, presence: true

  # Remove the uniqueness validation to allow duplicates
  # Commented out to disable the uniqueness validation
  # validates :favoritable_type, uniqueness: { scope: [:favoritable_id, :favoritor_type, :favoritor_id, :scope] }validates :favoritable_type, uniqueness: { scope: [:favoritable_id, :favoritor_type, :favoritor_id, :scope] }
  # validates :favoritable_type, :favoritable_id, :favoritor_type, :favoritor_id, presence: true

  def block!
    update!(blocked: true)
  end
end
