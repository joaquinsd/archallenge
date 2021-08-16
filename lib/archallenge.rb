require "archallenge/version"

module Archallenge
  class Error < StandardError; end

  class ADSelector
    attr_accessor :file

    def initialize(file)
      @file = file
      raise StandardError, 'JSON file not valid' unless file_not_valid
    end

    def select(items_to_select = 4)
      selection = []
      file_item_size = file.values.flatten.uniq.length
      while selection.length < items_to_select && selection.length < file_item_size
        file.each do |key, value|
          break if selection.length >= items_to_select
          next if value.empty?

          item_to_select = file[key].shift
          selection.push(item_to_select) unless selection.include?(item_to_select)
        end
      end
      selection.map { |item| item[:token].to_i }
    end

    def file_not_valid
      if file.is_a?(Hash)
        file.all? do |_key, value|
          is_array = value.is_a?(Array)
          are_hashes = value.all? do |item|
            item.is_a?(Hash) && !item[:token].nil?
          end
          is_array && are_hashes
        end
      else
        false
      end
    end
  end
end
