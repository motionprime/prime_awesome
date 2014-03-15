module PrimeAwesome
  module LabelDrawElement

    def self.included(base)
      base.class_eval do
        alias_method :draw_options!, :draw_options
        def draw_options
          if icon = computed_options[:fa_icon]
            draw_options!.merge(
              text: MotionAwesome.hex_for_icon(icon.to_s.gsub('_', '-')), 
              force_attributed: true, 
              font: 'FontAwesome'.uifont(computed_options[:fa_size] || 14)
            )
          else 
            draw_options!
          end
        end
      end
    end
  end
end

MotionPrime::LabelDrawElement.send :include, PrimeAwesome::LabelDrawElement