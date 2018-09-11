Rails.application.routes.draw do
  root 'murmurs#top'
    resources:murmurs do
      collection do
          post:confirm
      end
    end
end
