class Post < ActiveRecord::Base

# Don't know why this doesn't work
#  include PagMod

  has_many :comments
  belongs_to :user
    belongs_to :topic

  mount_uploader :image, ImageUploader

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true


  def self.paginate (pagehash)
self.limit(pagehash[:per_page]).offset(pagehash[:per_page]*((pagehash[:page].to_i)-1))
  end



end
