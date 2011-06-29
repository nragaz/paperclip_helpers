module Hms::Concerns::SetGeometry
  # e.g. set_geometry_for :pdf, :thumbnail
  def set_geometry_for(attachment, style, column=nil)
    column ||= :"#{style}_size"
    file_path = send(attachment).current_path(style)
    
    if file_path && File.exist?(file_path)
      output = Hms::Run.command('identify', "\"#{file_path}\"").split(" ")[2]
      send "#{column}=", output
      output
    end
  end
end
