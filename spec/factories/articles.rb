include ActionDispatch::TestProcess

FactoryBot.define do
  factory :article do
    association :user

    transient do
      images_count { 0 }
    end

    after(:build) do |article, evaluator|
      evaluator.images_count.times do
        article.images.attach(
          io: StringIO.new('dummy image content'),
          filename: 'dummy_image.jpg',
          content_type: 'image/jpg'
        )
      end
    end
  end
end
