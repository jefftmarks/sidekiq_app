# frozen_string_literal: true

class CatsController < ApplicationController
  def index
    render json: Cat.all
  end
end
