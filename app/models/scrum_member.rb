class ScrumMember < ApplicationRecord
  belongs_to :project
  belongs_to :user
  #has_many   :alpha_evidence
  has_many :sprint_diaries
  attr_accessor :selected_item, :add_item

  SCRUM_MEMBER_ROLS = ["オーナー", "マスター", "開発チーム"]


  validates :role, presence: true
  validates :user_id, presence: true
  validates :project_id, presence: true

  def name
    #byebug
    self.user.name
  end

  def project_name
    #byebug
    self.project.name
  end
end
