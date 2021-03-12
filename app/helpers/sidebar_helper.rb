module SidebarHelper
  def menu_active?(name)
    controller.controller_name == name ? 'sidebar__item--active' : ''
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
    ].freeze
  end
end
