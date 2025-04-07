class SearchSpotsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :spot_name, :string
  attribute :tag_name, :string
  attribute :category, :integer
  attribute :address, :string
  attribute :tag_id, :integer

  def search
    relation = Spot.includes(:image_attachment, :tags).distinct

    spot_name_words.each do |word|
      relation = relation.spot_name_contain(word)
    end

    tag_name_words.each do |word|
      relation = relation.tag_name_contain(word)
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

    def tag_name_words
      tag_name.present? ? tag_name.split(nil) : []
    end

    def address_words
      address.present? ? address.split(nil) : []
    end
end
