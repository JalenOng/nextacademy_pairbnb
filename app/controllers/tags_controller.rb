class TagsController < ApplicationController
  def show
    # byebug
    @tag = Tag.find(params[:id])
  end
end
