module ApplicationHelper
  def default_meta_tags
    {
      site: 'PersonalShindan',
      title: '個性診断サービス',
      reverse: true,
      charset: 'utf-8',
      description: '個性の診断をすることができます',
      keywords: '診断,個性,性格',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        image: image_url('ogp.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
