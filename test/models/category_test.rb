require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do
    @movie = movies(:one)
    @category = categories(:one)
  end

  test "must be valid for the category" do
    assert @category.valid?
  end

  test "must be category title length minimum 2" do
    assert (@category.title.length > 2)
  end

  test "destroy the category with movies" do
    @category.movies << @movie
    @category.destroy

    assert (@movie.destroyed?)
  end

  test "check value the 'to_param' method" do
    assert (@category.to_param == "#{@category.id}-#{@category.title.parameterize}")
  end
end
