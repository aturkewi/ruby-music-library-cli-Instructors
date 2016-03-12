module Findable

  def find_by_name(search_name)
    all.find { | object | object.name ==  search_name }
  end

  def find_or_create_by_name(search_name)
    search_obj = find_by_name(search_name)
    search_obj ? search_obj : create(search_name) 
  end

end
