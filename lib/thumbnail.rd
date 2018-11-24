# Generates a thumbnail to an image and renders an image tag.

require 'mini_magick'

class Jekyll::Thumbnail < Liquid::Tag
  # look up liquid variables
  # source: http://stackoverflow.com/a/8771374/1489823
  def look_up(context, name)
    lookup = context

    name.split(".").each do |value|
      lookup = lookup[value]
    end

    lookup
  end
  
  def initialize(tag_name, markup, tokens)
    if /(?<source>[^\s]+)\s+(?<dimensions>[^\s]+)/i =~ markup
      @source = source
      @dimensions = dimensions
    end
    super
  end

  def render(context)
    if @source

      # parking
      # also put the parameters into the liquid parser again, to allow variable paths
      source = @source
      source = look_up context, source unless File.readable?(source)
      dimensions = @dimensions

      source_path = "#{source}"
      raise "#{source_path} is not readable" unless File.readable?(source_path)
      ext = File.extname(source)
      desc = dimensions.gsub(/[^\da-z]+/i, '')
      dest_dir = "#{File.dirname(source)}/thumbs"
      Dir.mkdir dest_dir unless Dir.exists? dest_dir
      dest = "#{dest_dir}/#{File.basename(source, ext)}_#{desc}#{ext}"
      dest_path = "#{dest}"

      # only thumbnail the image if it doesn't exist tor is less recent than the source file
      # will prevent re-processing thumbnails for a ton of images...
      if !File.exists?(dest_path) || File.mtime(dest_path) <= File.mtime(source_path)
        # puts ENV.inspect

        # don't generate images in preview mode whenever possible
        if ENV['OCTOPRESS_ENV'] == 'preview' && /(?<width>\d+)?x(?<height>\d+)?/ =~ dimensions
          html = "<img src='#{source}' style='"
          html << "max-width: #{width}px; " unless width.nil? || width.empty?
          html << "max-height: #{height}px;" unless height.nil? || height.empty?
          html << "' />"
          return html
        end

        puts "Thumbnailing #{source} to #{dest} (#{dimensions})"

        image = MiniMagick::Image.open(source_path)
        image.strip
        image.resize dimensions
        image.quality 60

        second_image = MiniMagick::Image.new("img/watermark-#{dimensions}.png")

        result = image.composite(second_image) do |c|
          c.compose "Over"    # OverCompositeOp
          c.geometry "+20+20" # copy second_image onto first_image from (20, 20)
        end

        result.write dest_path
      end

      """<img src='#{dest}' />"""

      # TODO support relative paths
    else
      "Could not create thumbnail for #{source}. Usage: thumbnail /path/to/local/image.png 50x50<"
    end
  end
end



Liquid::Template.register_tag('thumbnail',   Jekyll::Thumbnail)