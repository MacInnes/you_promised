class PromisesController < ApplicationController

  def create
    Promise.create(
      name: params[:promise][:name],
      person: params[:promise][:person]
    )
    redirect_to '/'
  end

  def destroy
    Promise.find(params[:id]).destroy
    redirect_to '/'
  end
end
