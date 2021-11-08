# == Schema Information
#
# Table name: responses
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  choice_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Response < ApplicationRecord
    validates :user_id, :choice_id, presence: true 
    validate :cannot_answer_twice

    def cannot_answer_twice
        if self.already_answered?
            errors[:user_id] << 'Can\'t answer the same question twice'
        end
    end

    belongs_to :answer_choice,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :choice_id 

    belongs_to :respondent,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id 

    has_one :question,
    through: :answer_choice,
    source: :question

    def sibling_responses
        question.responses.where.not(id: self.id)
    end

    def already_answered?
        self.sibling_responses.exists?(user_id: self.user_id)
    end
    
end 
