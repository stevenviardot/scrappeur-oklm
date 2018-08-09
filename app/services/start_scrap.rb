require 'rubygems'
require 'nokogiri'
require 'open-uri'

class StartScrap

  def initialize
    # @scrap = StartScrap.new.perform
    # @scrap.save
  end

  def get_all_the_crypo_name #Méthode qui récupère la devise des crypto monnaies

     @array_name = [] #Création d'un array "@array_name" vide

     page = Nokogiri::HTML(open("https://coinmarketcap.com"))
     page.css('a.currency-name-container').each do |node|

      @array_name << node.text #Ajoute dans l'array chaque devise
     end

  end


  def get_all_the_crypo_val #Méthode qui récupère la valeur des crypto monnaies

     @array_value = [] #Création d'un array "@array_value" vide

     page = Nokogiri::HTML(open("https://coinmarketcap.com"))
     page.css('a.price').each do |node|
        @array_value << node.text #Ajoute dans l'array chaque devise
     end


  end


  def perform
    get_all_the_crypo_name
    get_all_the_crypo_val

    puts monhash = Hash[@array_name.zip(@array_value)]

    monhash.each do |k, v|
      Cryptocurrency.create!(
          name: k,
          value: v
      )
    end
  end



end
