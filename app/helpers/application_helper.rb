module ApplicationHelper

def my_name
"Jose Alvarez"
end

def div_class_select(errors)
  if errors.any?
    "form-group-has-error"
  else
    "form-group"
  end
end

end


