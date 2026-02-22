module ApplicationHelper
  def nav_link_class(path)
    base_classes = "text-[#0F4D23] hover:text-[#1E7A3A] hover:bg-[#CFE8B3] px-3 py-2 rounded-lg text-base font-medium transition duration-200"
    active_classes = "bg-[#9BBF78] text-white shadow-lg ring-2 ring-[#1E7A3A] ring-offset-2"
    
    current_page?(path) ? "#{base_classes} #{active_classes}" : base_classes
  end

  def mobile_nav_link_class(path)
    base_classes = "text-[#0F4D23] hover:bg-[#CFE8B3] hover:text-[#1E7A3A] block px-4 py-3 rounded-lg text-base font-medium transition text-center"
    active_classes = "bg-[#9BBF78] text-white shadow-md"
    
    current_page?(path) ? "#{base_classes} #{active_classes}" : base_classes
  end
end