require 'csv'
require 'pg'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "mass_health")
    yield(connection)
  ensure
    connection.close
  end
end


def csv_to_db
  data = []
  db_connection do |conn|
    CSV.foreach('mass-chip-data.csv', headers: true) do |row|
      data = row.to_h
      
      sql1 = "INSERT INTO town_health_records (geography, population, age_minor, age_senior, per_capita_income, below_poverty, percent_below_poverty, percent_ad_pren, percent_csec, num_infant_deaths, inf_mort, percent_low_bw, percent_mutli_birth, percent_pub_fin, percent_teen_births) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)"

      array = [data["Geography"], data["total pop, year 2005"], data["age 0-19, year 2005"], data["age 65+, year 2005"], data["Per Capita Income, year 2000"], data["Persons Living Below 200% Poverty, year 2000 "], data["% all Persons Living Below 200% Poverty Level, year 2000"], data["% adequacy prenatal care (kotelchuck)"], data["% C-section deliveries, 2005-2008"], data["Number of infant deaths, 2005-2008"], data["Infant mortality rate (deaths per 1000 live births), 2005-2008"], data["% low birthweight 2005-2008"], data["% multiple births, 2005-2008"], data["% publicly financed prenatal care, 2005-2008"], data["% teen births, 2005-2008"]]
      #
      # binding.pry

      array.map! {|thing| thing.gsub("NA","0")}
      array.map! {|x| x.gsub(',',"")}

      conn.exec_params(sql1,array)
    end

  end

end

csv_to_db
