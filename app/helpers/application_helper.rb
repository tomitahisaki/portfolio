module ApplicationHelper
  
  def page_title(page_title = '')
    base_title = 'Round Planner'
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def default_meta_tags
    {
      site: 'Round Planner',
      title: '入国前情報を提供するサービス',
      reverse: true,
      separator: '|',
      description: '入国準備はできていますか？ 査証や出入国情報を手に入れて、安全な旅をしよう！',
      keywords: '旅行,バックパッカー,安全対策基礎データ,入国手続き',
      charset: 'UTF-8',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        {href: image_url('favicon.png'), sizes: '32x32'}
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: 'request.original_url',
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@alltime68471657',
        image: image_url('ogp.png')
      }
    }
  end
end
