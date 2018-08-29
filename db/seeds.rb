require 'open-uri'
require 'nokogiri'
require 'csv'

puts 'destroying all items, assemblies, materials, categories'
Item.destroy_all
Assembly.destroy_all
Material.destroy_all
Category.destroy_all
puts 'destroying all reviews'
BrandReview.destroy_all
puts 'destroying all sources'
Source.destroy_all
puts 'destroying all brands'
Brand.destroy_all
Theme.destroy_all

puts 'creating themes'
THEMES = [
  { name: "Artisanat et savoir-faire local", traduction: "Local craftsmanship", scope: "Homme", icon: "fa-certificate", greencomment: "Excellence", english_greencomment: "Excellence" },
  { name: "Bien-être animal", traduction: "Animal welfare", scope: "Animaux", icon: "fa-feather", greencomment: "Engagement fort", redcomment: "Pas d'engagements", english_greencomment: "Strong commitment", english_redcomment: "No commitment"},
  { name: "Conditions salariales", traduction: "Working conditions", scope: "Homme", icon: "fa-user-friends", greencomment: "Engagement fort" , orangecomment: "Un début d'engagament", redcomment: "Pas d'engagements", english_greencomment: "Strong commitment" , english_orangecomment: "It's a start", english_redcomment: "No commitment" },
  { name: "Toxicité", traduction: "Toxicity", scope: "Homme", icon: "fa-allergies", greencomment: "Risques très limités", orangecomment: "Risques limités", redcomment: "Pas de prévention", english_greencomment: "Very low risk", english_orangecomment: "Low risk", english_redcomment: "No prevention" },
  { name: "Recyclage", traduction: "Recycling", scope: "Environnement", icon: "fa-recycle", greencomment: "Utilisation du recyclage", orangecomment: "Adhésion à la filière de recyclage", english_greencomment: "Use of recycled materials", english_orangecomment: "Recycling branch adherent" },
  { name: "Transparence de la marque", traduction: "Transparency", scope: "Homme", icon: "fa-tasks", greencomment: "Bon niveau", orangecomment: "Un début", redcomment: "Pas assez", english_greencomment: "Good level", english_orangecomment: "It's a start", english_redcomment: "Not sufficiently transparent" },
  { name: "Agriculture biologique", traduction: "Organic production", scope: "Environnement", icon: "fa-leaf", greencomment: "Labellisé biologique", english_greencomment: "Labelled Organic" }
]

THEMES.each do |theme|
  Theme.create(theme)
end

puts 'creating sources'

sources = [
  { name: "Source1", url: "#", theme_name: "Conditions salariales" },
  { name: "Source2", url: "#", theme_name: "Conditions salariales" },
  { name: "Source", url: "#", theme_name: "Recyclage", color: "green" },
  { name: "Source3", url: "#", theme_name: "Artisanat et savoir-faire local" },
  { name: "Source4", url: "#", theme_name: "Conditions salariales" },
  { name: "Source5", url: "#", theme_name: "Conditions salariales" },
  { name: "Source6", url: "#", theme_name: "Conditions salariales" },
  { name: "Source7", url: "#", theme_name: "Transparence de la marque" },
  { name: "Source8", url: "#", theme_name: "Conditions salariales" },
  { name: "Source9", url: "#", theme_name: "Conditions salariales" },
  { name: "Source10", url: "#", theme_name: "Toxicité" },
  { name: "Source11", url: "#", theme_name: "Toxicité" },
  { name: "Source12", url: "#", theme_name: "Toxicité" },
  { name: "Source13", url: "#", theme_name: "Transparence de la marque" },
  { name: "Source14", url: "#", theme_name: "Transparence de la marque" },
  { name: "Source15", url: "#", theme_name: "Toxicité" },
  { name: "Source16", url: "#", theme_name: "Artisanat et savoir-faire local" },
  { name: "Source17", url: "#", theme_name: "Transparence de la marque" },
  { name: "Source18", url: "#", theme_name: "Bien-être animal" },
  { name: "Source19", url: "#", theme_name: "Conditions salariales" },
  { name: "Source20", url: "#", theme_name: "Transparence de la marque" },
  { name: "Source21", url: "#", theme_name: "Conditions salariales" },
  { name: "Source22", url: "#", theme_name: "Toxicité" }
]

sources.each do |source|
  puts source[:name]
  new_source = Source.new(name: source[:name], url: source[:url])
  puts source[:theme_name]
  new_source.theme = Theme.where(name: source[:theme_name]).first
  unless source[:mark].nil?
    new_source.mark = source[:mark]
  end
  new_source.save!
end

puts 'creating brand_reviews'
csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }

filepath = File.expand_path('../brand_reviews.csv', __FILE__)
CSV.foreach(filepath, csv_options) do |row|
  brand_review = BrandReview.new(mark: row['mark'].to_i, comment: row['comment'])
  puts "brand : #{row['brand_name']}"
  if  Brand.where(name: row['brand_name']).first
    brand_review.brand = Brand.where(name: row['brand_name']).first
  else
    brand_review.brand = Brand.create(name: row['brand_name'])
  end
  puts "source : #{row['source_name']}"
  brand_review.source = Source.where(name: row['source_name']).first
  brand_review.save!
end

puts 'creating materials'

filepath = File.expand_path('../materials.csv', __FILE__)
CSV.foreach(filepath, csv_options) do |row|
  p name = row['name'].downcase
  p recycled = row['recycled'] == "TRUE"
  p carbonimpact = row['carbonimpact'].to_f
  p eutrophisation = row['eutrophisation'].to_f
  Material.create(name: name, recycled: recycled, carbonimpact: carbonimpact, eutrophisation: eutrophisation, traduction: row['traduction'])
end

puts 'creating categories'
categories = [
  { name: "Tops & T-shirts", url: "#", traduction: "Tops and T-shirts" } ,
  { name: "Robes", url: "#", traduction: "Dresses" } ,
  { name: "Pulls & Gilets", url: "#", traduction: "Jumpers & Cardigans" } ,
  { name: "Vestes", url: "#", traduction: "Jackets" } ,
  { name: "Manteaux", url: "#",traduction: "Coats" } ,
  { name: "Chemises, Chemisiers & Tuniques", url: "#", traduction: "Blouses & Tunics" } ,
  { name: "Pantalons & Leggings", url: "#", traduction: "Trousers & Leggings" } ,
  { name: "Jupes", url: "#", traduction: "Skirts" } ,
  { name: "Jeans", url: "#", traduction: "Jeans" } ,
  { name: "Shorts", url: "#", traduction: "Shorts" } ,
  { name: "Chaussettes & Collants", url: "#", traduction: "Tights & Socks" } ,
  { name: "Sous-vêtements", url: "#", traduction: "Lingerie" } ,
  { name: "Pyjamas", url: "#", traduction: "Nightwear" } ,
  { name: "Maillots de bain & Peignoirs", url: "#", traduction: "Swimwear" } ,
  { name: "Vêtements sport", url: "#", traduction: "Sports Clothing" }
]

categories.each do |category|
  Category.create(name: category[:name], traduction: category[:traduction])
end
