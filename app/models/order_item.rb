class OrderItem < ApplicationRecord
  OCCASIONS = ["Spontané", "Bonne fête !", "Remerciement", "Mariage", "Anniversaire", "Anniversaire de mariage", "Deuil", "Saint Valentin", "Commémoration", "Bon rétablissement", "Fête des mères", "Pour se faire plaisir", "Fête des grands-mères"]
  COLORS = ["Pas de préférence","Blanc", "Bleu", "Jaune", "Rouge", "Orange", "Rose", "Vert", "Violet", "Multicolore"]
  belongs_to :product
  belongs_to :order
  belongs_to :user, optional: true
  validates :occasion, inclusion: { in: OCCASIONS }
  validates :color, inclusion: { in: COLORS }
  validates :price, presence: true, numericality: { greater_than: 0, message: 'Ne peut pas être vide' }
end
