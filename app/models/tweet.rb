class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :original_user, class_name: 'User'#, foreign_key: :original_user_id

  validates_length_of :content, :within => 1..140,
    :too_long => "You may enter up to 140 characters",
    :too_short => "You must enter at least 1 character"

  default_scope { order('created_at DESC') }
end
