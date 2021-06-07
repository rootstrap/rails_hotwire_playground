module Navigable
  extend ActiveSupport::Concern

  def next
    self.class.where('id > ?', id).order(id: :asc).first
  end

  def previous
    self.class.where('id < ?', id).order(id: :desc).first
  end
end
