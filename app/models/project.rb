class Project < ApplicationRecord
  acts_as_tenant :organization
  belongs_to :team, optional: true
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, uniqueness: {scope: :organization_id, case_sensitive: false}
  broadcasts_refreshes
end
