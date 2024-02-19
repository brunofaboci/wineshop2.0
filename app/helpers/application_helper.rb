# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def render_flash_stream
    turbo_stream.update 'flash', partial: 'layouts/flash'
  end

  def content_id
    "#{controller_name.underscore}_#{action_name}"
  end
end
