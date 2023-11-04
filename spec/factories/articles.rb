include ActionDispatch::TestProcess

FactoryBot.define do
  factory :article do
    association :user

    transient do
      images_count { 0 }
    end

    trait :with_image do
        after(:create) do |article|
          article.images.attach(io: File.open(Rails.root.join('spec/fixtures/files/sample_image.png')), filename: 'sample_image.png', content_type: 'image/png')
        end
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
