module Jekyll
  class Mermaid < Liquid::Block

    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
      @config = context.registers[:site].config['mermaid']

      out = <<-HELLO
        <script type="module">
          import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs';
        </script>
        <div class=\"mermaid\">#{super}</div>
      HELLO
      
      out
    end
  end
end

Liquid::Template.register_tag('mermaid', Jekyll::Mermaid)
