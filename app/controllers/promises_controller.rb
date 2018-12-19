class PromisesController < ApplicationController

  def create
    Promise.create(
      name: params[:promise][:name],
      person: params[:promise][:person]
    )
    redirect_to '/'
  end

end
