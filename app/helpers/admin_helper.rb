# frozen_string_literal: true

module AdminHelper
  def more_than_one_admin?(a)
    a.admins.count > 1
  end
end
