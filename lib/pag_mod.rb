module PagMod
  def self.paginate (pagehash)
self.limit(pagehash[:per_page]).offset(pagehash[:per_page]*((pagehash[:page].to_i)-1))
  end
end
