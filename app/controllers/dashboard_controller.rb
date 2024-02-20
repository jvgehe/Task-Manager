# frozen_string_literal: true

class DashboardController < ApplicationController

  def login; end

  def index
    @status = %w[open in_progress done]
  end

end
