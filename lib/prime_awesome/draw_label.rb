module PrimeAwesome
  module LabelDrawElement

    def self.included(base)
      base.class_eval do
        def computed_options
          @computed_options || begin
            super
            icon = computed_options[:fa_icon]
            @computed_options.merge!({
              text: MotionAwesome.hex_for_icon(icon.to_s.gsub('_', '-')),
              force_attributed: true,
              font: 'FontAwesome'.uifont(computed_options[:fa_size] || 14)
            }) if icon
            @computed_options
          end
        end
      end
    end
  end
end

MotionPrime::LabelDrawElement.send :include, PrimeAwesome::LabelDrawElement