class PagesController < ApplicationController
  def index
    @people = Person.take(4)
    @initiatives = Initiative.take(6)
  end
end
