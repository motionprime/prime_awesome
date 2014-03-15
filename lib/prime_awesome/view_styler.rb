module PrimeAwesome
  module ViewStyler

    def self.included(base)
      base.class_eval do
        alias_method :_prepare_options!, :prepare_options!
        def prepare_options!
          if icon = options.delete(:fa_icon)
            options[:attributed_text] = attributed_string(
              font: 'FontAwesome'.uifont(options.delete(:fa_size) || 14),
              text: MotionAwesome.hex_for_icon(icon.to_s.gsub('_', '-'))
            )
          end
          _prepare_options!
        end
      end
    end
  end
end

MotionPrime::ViewStyler.send :include, PrimeAwesome::ViewStyler