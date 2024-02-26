class Product < ApplicationRecord
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true, length: { minimum: 10 }
  validates :price, numericality: {
    greater_than_or_equal_to: 0.01,
    message: 'must be greater than or equal to 0.01 - we don\'t do freebies',
  }


  # allow_blank: means we're not checking for presence twice,
  # because it's already checked by the validates(presence: true)
  # call above.
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be a URL for GIF, JPG, or PNG image.'
  }

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end

end
