module ApplicationHelper
  def assign_meta_tags
    if @spot.blank?
      {
        site: "Morning Hub",
        title: "朝活スポット検索アプリ - Morning Hub",
        reverse: true,
        charset: "utf-8",
        description: "朝活を充実させたい方必見！カフェ、ワークスペース、公園など全国の朝活スポットを簡単に検索できるアプリ。理想の朝をスタートさせましょう。",
        keywords: "朝活, スポット検索, カフェ, ワークスペース, 公園, 朝の活動",
        canonical: request.original_url,
        separator: "|",
        icon: [
          { href: image_url("favicon.ico") },
          { href: image_url("favicon.webp"), rel: "apple-touch-icon", sizes: "180x180", type: "image/png" }
        ],
        og: {
          site_name: :site,
          title: :title,
          description: :description,
          type: "website",
          url: request.original_url,
          image: image_url("top_image.webp"),
          local: "ja-JP"
        },
        twitter: {
          card: "summary_large_image",
          site: "@yuya_ujiie",
          image: image_url("top_image.webp")
        }
      }
    else
      {
        site: "Morning Hub",
        title: "#{@spot.spot_name}",
        reverse: true,
        charset: "utf-8",
        description: "#{@spot.body}",
        keywords: "朝活, スポット検索, カフェ, ワークスペース, 公園, 朝の活動",
        canonical: request.original_url,
        separator: "|",
        icon: [
          { href: image_url("favicon.ico") },
          { href: image_url("favicon.webp"), rel: "apple-touch-icon", sizes: "180x180", type: "image/png" }
        ],
        og: {
          site_name: :site,
          title: :title,
          description: :description,
          type: "website",
          url: request.original_url,
          image: image_url(@spot.image.persisted? ? url_for(@spot.image) : "top_image.webp"),
          local: "ja-JP"
        },
        twitter: {
          card: "summary_large_image",
          site: "@yuya_ujiie",
          image: image_url(@spot.image.persisted? ? url_for(@spot.image) : "top_image.webp")
        }
      }
    end
  end
end
