module PaperclipHelpers::Attachments
  extend ActiveSupport::Concern

  private

  def attach(obj, attachment, style, expected_format=:png, filename=nil, opts={})
    return status_404 unless obj.send(attachment).file?

    filename ||= "#{obj.id}_#{style}.#{expected_format}"

    path = obj.send(attachment).path(style)
    path.gsub!(/\.\w\w\w$/i, ".#{expected_format}")

    disposition = opts[:disposition] ||
                  ( expected_format == :pdf ? 'attachment' : 'inline' )

    return status_404 unless File.exist?(path)

    send_file path,
              type: MIME::Types.type_for(path).first.content_type,
              disposition: disposition,
              filename: filename
  end

  def status_404
    render :file => "#{Rails.root}/public/404", :status => 404, :formats => [:html]
  end
end