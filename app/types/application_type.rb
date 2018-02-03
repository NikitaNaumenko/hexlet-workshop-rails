module ApplicationType
  extend ActiveSupport::Concern

  module ClassMethods
    delegate :model_name, to: :superclass

    delegate :name, to: :superclass

    def permit(*args)
      @_args = args
    end

    def progress(*args)
      @_progress_args = args
    end

    def _progress_args
      @_progress_args
    end

    def _args
      @_args
    end
  end

  def assign_attributes(attrs = {}, _options = {})
    raise ArgumentError, 'expected hash' if attrs.nil?
    if attrs.respond_to? :permit
      permitted_attrs = attrs.send :permit, self.class._args
      super(permitted_attrs)
    else
      super(attrs)
    end
  end

  def total_fields
    attributes.select { |name, _val| self.class._progress_args.include?(name.to_sym) }
  end

  def completed_fields
    total_fields.select { |_key, val| val.present? }
  end

  def progress
    (completed_fields.count / total_fields.count.to_f * 100).to_i
  end
end
