require 'csv'

table = CSV.table(Rails.root.join('lib', 'seeds', 'matches.csv'))

cities = table[:city].uniq.map{|x| {name: x}}
City.create(cities)


umpires = (table[:umpire1] + table[:umpire2] + table[:umpire3]).uniq
umpires.map {|umpire| Umpire.create(name: umpire) }

seasons = table[:season].uniq.sort.map {|x| Season.create(year: x) }

def get_home_ground(team_name, city_name)
  team_name.split.include?(city_name)
end

def create_team(team_name, city)
  team = Team.find_or_initialize_by(name: team_name)
  team.city_id = city.id if city.present? && get_home_ground(team_name, city.name)
  team.save(validate: false)
  team
end

def create_venue(venue_name, city)
  venue = Venue.find_or_initialize_by(name: venue_name)
  venue.city_id = city.id if city.present?
  venue.save(validate: false)
  venue
end

table.each do |t|
  season = Season.find_by(year: t[:season])

  if t[:city].blank?
    city = City.find_or_create_by(name: "Dubai")
  else
    city = City.find_by(name: t[:city])
  end

  city_id = city.present? ? city.id : nil

  team1 = create_team(t[:team1], city)
  team2 = create_team(t[:team2], city)

  venue = create_venue(t[:venue], city)

  toss_winner = Team.find_by(name: t[:toss_winner])
  winner = Team.find_by(name: t[:winner])
  winner_id = winner.present? ? winner.id : nil

  umpire_1 = Umpire.find_by(name: t[:umpire1])
  umpire_2 = Umpire.find_by(name: t[:umpire2])
  umpire_3 = Umpire.find_by(name: t[:umpire3])

  result = t[:result].eql?("no result") ? "abandoned" : t[:result]

  MatchDetail.create({
    season_id: season.id,
    city_id: city_id,
    match_date: t[:date],
    team_1_id: team1.id,
    team_2_id: team2.id,
    toss_winner_id: toss_winner.id,
    toss_decision: t[:toss_decision],
    result: result,
    dl_applied: t[:dl_applied],
    match_winner_id: winner_id,
    win_by_runs: t[:win_by_runs],
    win_by_wickets: t[:win_by_wickets],
    player_of_match: t[:player_of_match],
    venue_id: venue.id,
    umpire_1_id:  umpire_1.id,
    umpire_2_id: umpire_2.id,
    umpire_3_id: umpire_3.id
  })
end
