class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait?

    def clickbait?
        click_bait_titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if title != nil 
            # if click_bait_titles.include?(title) 
            #     errors.add("title", "Must include 'Won't Believe', 'Secret', 'Top [number]', or 'Guess'")
            # end
            if click_bait_titles.none? {|t| title.include?(t)}
                errors.add("title", "Must include 'Won't Believe', 'Secret', 'Top [number]', or 'Guess'")
            end
        end
    end
end
