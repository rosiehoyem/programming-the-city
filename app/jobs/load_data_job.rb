require 'csv'
require 'open-uri'

class LoadDataJob
  def self.run
    load_people
    load_companies
    load_initiatives
    load_media
    load_concepts
  end

  private

  def self.load_people
    dir = "data"
    file = File.join(dir, "people.csv")
    CSV.parse(open(file).read, headers: true) do |row|
      person = person.where(id: row['id']).first_or_initialize
      person.first_name = row['first_name']
      person.last_name = row['last_name']
      person.website_url = (row['website_url'])
      person.image_url = row['image_url']
      person.description = row['description']
      person.save!
      puts "Updated info for person.#{person.id}"
    end
  end

  def self.load_companies
    dir = "data"
    file = File.join(dir, "companies.csv")
    CSV.parse(open(file).read, headers: true) do |row|
      company = company.where(id: row['id']).first_or_initialize
      company.name = row['name']
      company.website_url = (row['website_url'])
      company.location = row['location']
      company.description = row['description']
      company.save!
      puts "Updated info for company.#{company.id}"
    end
  end

  def self.load_initiatives
    dir = "data"
    file = File.join(dir, "initiatives.csv")
    CSV.parse(open(file).read, headers: true) do |row|
      initiative = initiative.where(id: row['id']).first_or_initialize
      initiative.name = row['name']
      initiative.website_url = (row['website_url'])
      initiative.organizer = (row['organizer'])
      initiative.location = row['location']
      initiative.description = row['description']
      initiative.save!
      puts "Updated info for initiative.#{initiative.id}"
    end
  end

  def self.load_media
    dir = "data"
    file = File.join(dir, "media.csv")
    CSV.parse(open(file).read, headers: true) do |row|
      medium = medium.where(id: row['id']).first_or_initialize
      medium.name = row['name']
      medium.url = (row['url'])
      medium.type = (row['type'])
      medium.author_id = row['author_id']
      medium.description = row['description']
      medium.save!
      puts "Updated info for medium.#{medium.id}"
    end
  end

  def self.load_concepts
    dir = "data"
    file = File.join(dir, "concepts.csv")
    CSV.parse(open(file).read, headers: true) do |row|
      concept = concept.where(id: row['id']).first_or_initialize
      concept.name = row['name']
      concept.description = row['description']
      concept.save!
      puts "Updated info for concept.#{concept.id}"
    end
  end

end