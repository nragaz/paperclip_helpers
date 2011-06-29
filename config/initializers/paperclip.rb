Paperclip::Attachment.default_options[:convert_options] = {
  all: "-strip -quality 40 -colors 256"
}

module Paperclip
  class Attachment
    def current_path(style=:original)
      @queued_for_write[style].try(:path) || path(style)
    end
  end
end