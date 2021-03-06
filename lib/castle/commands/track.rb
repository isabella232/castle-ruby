# frozen_string_literal: true

module Castle
  module Commands
    class Track
      class << self
        # @param options [Hash]
        # @return [Castle::Command]
        def build(options = {})
          Castle::Validators::Present.call(options, %i[event])
          context = Castle::Context::Sanitize.call(options[:context])

          Castle::Command.new(
            'track',
            options.merge(context: context, sent_at: Castle::Utils::GetTimestamp.call),
            :post
          )
        end
      end
    end
  end
end
