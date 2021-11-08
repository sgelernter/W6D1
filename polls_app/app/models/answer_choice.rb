# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  choice      :text             not null
#  question_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class AnswerChoice < ApplicationRecord

    validates :choice, :question_id, presence: true

    belongs_to :question,
    class_name: :Question,
    primary_key: :id,
    foreign_key: :question_id

    has_many :responses,
    class_name: :Response,
    primary_key: :id,
    foreign_key: :choice_id

end
