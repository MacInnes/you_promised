class WelcomeController < ApplicationController
  def index
    @promise = Promise.new
    @promises = Promise.all
  end
end
