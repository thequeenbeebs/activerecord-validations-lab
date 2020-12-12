class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :must_be_clickbait

    def must_be_clickbait
        if title != nil && title.exclude?("Won't Believe") && title.exclude?("Secret") && title.exclude?("Top") && title.exclude?("Guess")
            errors.add(:title, "Must be clickbait")
        end
    end


end
