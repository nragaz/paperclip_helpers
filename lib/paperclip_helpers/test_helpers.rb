module PaperclipHelpers::TestHelpers
  extend ActiveSupport::Concern
  
  module ClassMethods
    def should_have_attached_file(attachment)
      klass = self.name.gsub(/Test$/, '').constantize
      
      context "For an attachment named #{attachment}, #{klass}" do
        should_have_db_column "#{attachment}_file_name",    type: :string
        should_have_db_column "#{attachment}_content_type", type: :string
        should_have_db_column "#{attachment}_file_size",    type: :integer
      end
      
      should "have an attachment named ##{attachment}" do
        assert klass.new.respond_to?(attachment.to_sym), 
          "@#{klass.name.underscore} doesn't have a field named #{attachment}"
        assert_equal Paperclip::Attachment,
          klass.new.send(attachment.to_sym).class
      end
    end
  end
  
  def count_pages(pdf_file_path)
    return nil unless pdf_file_path.last(4) == ".pdf"
    
    output = `identify \"#{pdf_file_path}\"`
    raise "Error counting pages in #{pdf_file_path}" unless $?.exitstatus == 0
    
    output.split("\n").count
  end
  
  def get_image_size(image_file_path)
    output = `identify \"#{image_file_path}\"`
    raise "Error getting size of #{image_file_path}" unless $?.exitstatus == 0
    
    output.split(" ")[2]
  end
end