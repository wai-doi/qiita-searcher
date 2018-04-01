class SearchersController < ApplicationController
  QUERY_OPTIONS = %w(title body code user tag stocks created updated)
  INTEGER_QUERY_OPTIONS = %w(stocks created updated)
  def index
  end

  def free_search
    if ! params['free'].empty?
      redirect_to "https://qiita.com/search?q=#{params['free']}"
    else
      redirect_to "https://qiita.com/"
    end
  end

  def search
    if querys_empty?
      redirect_to "https://qiita.com/"
    else
      options = querys.keys
      query_part = options.map{|option| make_part(option)}.compact.join(" ")
      redirect_to "https://qiita.com/search?q=#{query_part}"
    end
  end

  private
  def querys
    params.select{|k, _| QUERY_OPTIONS.include?(k)}
  end

  def querys_empty?
    querys.values.all?(&:empty?)
  end

  def make_part(option)
    return nil if params[option].empty?
    if INTEGER_QUERY_OPTIONS.include?(option)
      "#{option}:" + params["#{option}_inequality"] + params[option]
    else
      params[option].split.map{|q| "#{option}:#{q}"}
    end
  end
end
