# source: https://robots.thoughtbot.com/automatically-wait-for-ajax-with-capybara
module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def reload_page
    visit page.current_url
  end

  def wait_and_reload_page
    wait_for_ajax
    reload_page
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end
