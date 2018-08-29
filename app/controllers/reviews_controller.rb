class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      reload_csv
      redirect_to thank_path
    else
      render :new
    end
  end

  private

  def reload_csv
    require 'csv'

    # csv_options = { col_sep: ';', force_quotes: true, quote_char: '"' }
    # filepath    = '/../db/items.csv'

    csv_file_path = File.expand_path('../../../db/reviews.csv', __FILE__)

    CSV.open(csv_file_path, 'wb') do |csv|
      csv << ['id', 'Content', 'Email']
      Review.all.each do |review|
        csv << [review.id, review.content, review.email]
      end
    end
  end

  def review_params
    params.require(:review).permit(:content, :email)
  end
end
