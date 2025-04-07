class SearchSpotsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :spot_tag_name, :string
  attribute :category, :integer
  attribute :address, :string
  attribute :tag_id, :integer

  def search
    relation = Spot.includes(:image_attachment, :tags).distinct

    key_words.each do |word|
      relation = relation.spot_tag_name_contain(word)
    end

    relation = relation.by_category(category) if category.present?

    address_words.each do |word|
      relation = relation.address_contain(word)
    end

    relation
  end

  private

    def key_words
      spot_tag_name.present? ? spot_tag_name.split(nil) : []
    end

    def address_words
      address.present? ? address.split(nil) : []
    end
end
