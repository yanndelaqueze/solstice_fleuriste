class Contact < ApplicationRecord
  SUBJECTS = ["Un mariage", "Un évènement", "Une commande", "Autre"]
  validates :subject, inclusion: { in: SUBJECTS }
end
