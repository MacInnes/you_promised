class PromisesController < ApplicationController

  def create
    Promise.create(
      name: params[:promise][:name],
      person: params[:promise][:person]
    )
    redirect_to '/'
  end

  def edit
    @promise = Promise.find(params[:id])
  end

  def show
    @promise = Promise.find(params[:id])
  end

  def update
    promise = Promise.find(params[:id])
    promise.update(
      name: params[:promise][:name],
      person: params[:promise][:person],
      status: params[:promise][:status]
    )
    redirect_to '/'
  end

  def destroy
    Promise.find(params[:id]).destroy
    redirect_to '/'
  end
end
