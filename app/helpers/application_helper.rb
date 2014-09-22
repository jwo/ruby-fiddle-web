module ApplicationHelper
  def embedded_svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'

    if options[:class].present?
      svg['class'] = options[:class]
    end

    if options["data-fallback-image"].present?
      svg['data-fallback-image'] = options["data-fallback-image"]
    end

    doc.to_html.html_safe
  end
end
