class Word < ApplicationRecord
  has_many :word_answers, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :word_answers

  validates :content, presence: true, length: {maximum: 50}

  def correct_answer
  	answers = self.word_answers
  	answers.each {|answer| return answer.content if answer.is_correct? }
  end
end
