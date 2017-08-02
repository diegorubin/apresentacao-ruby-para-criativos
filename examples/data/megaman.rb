require 'httparty'
require 'nokogiri'

class MegaMan
  include HTTParty
  base_uri 'megaman.wikia.com/wiki/'

  def master(name)
    @name = name
    to_master(self.class.get('/' + name.gsub(' ', '_')).body)
  end

  private
  def to_master(content)
    document = Nokogiri::HTML(content)
    {
      name: @name,
      avatar: get_avatar(document),
      damage: get_damage(document)
    }
  end

  def get_avatar(document)
    img = document.css("a[title='#{@name}']").css('img').first
    img['data-src'] if img
  end

  def get_damage(document)
    table = {}
    begin
      element = document.css("#Damage_Data_Chart").first.parent
      element = element.next until element.name == 'table'
      rows = element.css('tr')

      weapons  = rows[1].css('td').collect {|w| w.text.strip}
      damage = rows[2].css('td').collect {|d| d.text.strip}

      weapons.each_with_index { |w, i| table[w] = damage[i] }
    rescue
      puts "data chart not found"
    end
    table
  end
end

