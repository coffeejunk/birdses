require 'gollum'

module Birdses
  module Page
    extend self
    WIKI_FORMAT = :markdown

    def all
      wiki.pages
    end

    def new
      Struct.new(:name, :raw_data).new('New Page', '')
    end

    def create(page_name, content, user)
      wiki.write_page(page_name, WIKI_FORMAT, content,
                      build_commit(user, "creating #{page_name}"))
    end

    def update(page_name, content, user)
      page = find_by_name(page_name)
      wiki.update_page(page, page.name, page.format, content,
                       build_commit(user, "updating #{page_name}"))
    end

    def destroy(page_name, user)
      page = find_by_name(page_name)
      wiki.delete_page(page, build_commit(user, "delete #{page_name}"))
    end

    def find_by_name(name)
      wiki.page(name)
    end

    private

    def wiki
      Gollum::Wiki.new(Rails.root.join('wiki'))
    end

    def build_commit(user, message)
      {
        message: message,
        name:    user['name'],
        email:   user['email']
      }
    end
  end
end
