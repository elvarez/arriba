class Topic < ActiveRecord::Base

# Don't know why this doesn't work
# include PagMod 


  has_many :posts


  def self.paginate (pagehash)
self.limit(pagehash[:per_page]).offset(pagehash[:per_page]*((pagehash[:page].to_i)-1))
  end

end
