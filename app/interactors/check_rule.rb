class CheckRule
  include Interactor::Organizer 
  interactors = []

  Rule.constants.each do |const|
    interactors << Rule.const_get(const)
  end
  
  organize interactors
end
