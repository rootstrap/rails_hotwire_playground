module SidebarHelper
  def menu_active?(name)
    controller.controller_name == name ? 'active' : ''
  end

  def sidebar_sections
    [
      {
        name: 'boards',
        path: boards_path
      },
      {
        name: 'gallery',
        path: gallery_index_path
      }
    ]
  end
end
