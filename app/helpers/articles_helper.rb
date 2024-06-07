module ArticlesHelper
    def create_edit_btn(article)
      out = ''
      if user_signed_in? && current_user == article.user
        out << link_to('Edit', edit_article_path(article), class: 'float-right mr-2 btn btn-outline-secondary')
      end
      out.html_safe
    end

    def create_destroy_btn(article)
        out = ''
        if user_signed_in? && current_user == article.user
          out << link_to('Destroy', article_path(article), data: { turbo_method: :delete, turbo_confirm: "Are you sure?" }, class: 'float-right mr-2 btn btn-outline-secondary')
        end
        out.html_safe
      end

 end

