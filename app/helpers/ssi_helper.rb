module SsiHelper

  def ssi(path={})
    if path.is_a? Hash
      url = url_for(path)
    elsif path.is_a? Symbol
      url = url_for(:controller => "ssi", :action => path.to_s)
    elsif path.is_a? String
      url = url_for(:controller => "ssi", :action => path)
    end
    "<!--# include file='#{url}' -->".html_safe
  end
end