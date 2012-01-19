# encoding: utf-8

module OfficesHelper
  def offices_count
    count = Office.count
    "#{count} офисов продаж"
  end
end
