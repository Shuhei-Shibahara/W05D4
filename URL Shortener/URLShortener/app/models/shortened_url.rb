# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :short_url, uniqueness: true, presence: true
    validates :long_url, presence: true
    validates :user_id, presence: true

    def self.random_code
        new_code = SecureRandom.urlsafe_base64
        until !self.short_url.has_value(new_code)
    end
end
