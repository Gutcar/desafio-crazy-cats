class Reaction < ApplicationRecord
  belongs_to :article
  belongs_to :user

  # validates :kind, acceptance: { accept: %w[like dislike boring neutral uninterested interested]}
  validates :kind, inclusion: { in: ['Me gusta', 'No me gusta'] }
  def self.kinds
    #%w[like dislike boring neutral uninterested interested]
    ['Me gusta', 'No me gusta']
  end

end
