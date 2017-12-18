class WelcomeController < ApplicationController
  def index
  end
  def hello
    @titles = Title.all
  end
end
