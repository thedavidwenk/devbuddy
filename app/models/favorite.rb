# frozen_string_literal: true
class Favorite < ApplicationRecord
  extend ActsAsFavoritor::FavoriteScopes

  belongs_to :favoritable, polymorphic: true
  belongs_to :favoritor, polymorphic: true

  validates :favoritable_type, :favoritable_id, :favoritor_type, :favoritor_id, presence: true

  def block!
    update!(blocked: true)
  end
end
