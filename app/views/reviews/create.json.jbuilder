if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {plant: @review.plant, review: Review.new})
  json.inserted_review render(partial: "plants/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {plant: @review.plant, review: @review})
end
