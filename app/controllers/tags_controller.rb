# frozen_string_literal: true

class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @book = Book.find(params[:id])
    @tag = Tag.find(params[:id])
  end
end
