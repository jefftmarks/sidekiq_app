# frozen_string_literal: true

require 'faker'

class PlayWithCatJob
  include Sidekiq::Job

  class ArgumentError < StandardError; end

  def perform(cat_id)
    unless cat_id.is_a?(Integer)
      raise ArgumentError, message: 'Cat ID must be integer value'
    end

    @cat = find_cat_by_id(cat_id)
    play_with_cat
  end

  private

  def find_cat_by_id(id)
    Cat.find_or_create_by(id: id) do |cat|
      cat.name = generate_name
      cat.age = rand(1..20)
      cat.save!
    end
  end

  def generate_name
    Faker::Name.name
  end

  def play_with_cat
    puts "Meow! #{@cat.name.titlecase} is having fun!"
  end
end
