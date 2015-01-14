class PlacesController < ApplicationController

  def update_now
    Kernel.system "cd #{Rails.root} && git submodule update --remote"
    show
  end

  def show
    renderer = nil
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, tables: true, autolink: true)
    @diary = markdown.render(IO.read("places/readme.md"))
    render html: @diary.html_safe, layout: "plain"
  end
end