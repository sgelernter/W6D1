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
    validate :cannot_answer_twice, :cannot_answer_self

    def cannot_answer_twice
        if self.already_answered?
            errors[:user_id] << 'Can\'t answer the same question twice'
        end
    end

    def cannot_answer_self
        if self.my_poll?
            errors[:user_id] << 'cannot put their thumb on the scales'
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

    def my_poll?
        self.question.poll.author_id == self.respondent.id
    end
    
end 
