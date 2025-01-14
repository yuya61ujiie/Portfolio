class SearchSpotsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :spot_name, :string
  attribute :category, :integer
  attribute :address, :string
  attribute :tag_id, :integer

  ### バリデーション
  # validate :title...
  # このformでしか使用しないバリデーションがあればこちらに記述する。

    def search
      relation = Spot.distinct

      spot_name_words.each do |word|
        relation = relation.spot_name_contain(word)
      end
      relation = relation.by_category(category) if category.present?
      address_words.each do |word|
        relation = relation.address_contain(word)
      end
      relation = relation.by_tag(tag_id) if tag_id.present?
      relation
    end

    private

    def spot_name_words
      spot_name.present? ? spot_name.split(nil) : []
    end

    def address_words
      address.present? ? address.split(nil) : []
    end
  end
