class StaticPagesController < ApplicationController
  def home
    @reading_lists = ReadingList.all
    @books = Book.all

  end

  def help
  end

  def about
  end

  def contact
  end
end
