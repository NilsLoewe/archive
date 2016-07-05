module DataobjectsHelper

  def sti_dataobject_path(type = 'dataobject', dataobject = nil, action = nil)
    Rails.logger.info "FIFOU #{format_sti(action, type, dataobject)}_path"
    send "#{format_sti(action, type, dataobject)}_path", dataobject
  end

  def format_sti(action, type, dataobject)
    action || dataobject ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ''
  end

end
