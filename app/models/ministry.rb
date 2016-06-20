# == Schema Information
#
# Table name: ministries
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  church_id   :integer
#

class Ministry < ApplicationRecord
  has_many :charges, dependent: :destroy
  has_many :responsibilities, through: :charges
  has_many :attendances
  has_many :member_attendances, through: :attendances
  has_many :members, -> { distinct }, through: :charges

  belongs_to :church

  validates :name, :responsibilities, presence: true
  validates :name, uniqueness: true

  def self.by_church(church)
    where(church: church)
  end
end
