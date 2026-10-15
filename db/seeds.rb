categories = {
  "Fantasy" => "Heroes, creatures, and scenery from imaginary worlds.",
  "Science fiction" => "Spacecraft, robots, and explorers of the future.",
  "Historical" => "Vehicles and characters inspired by history."
}
categories.each { |name, description| Category.find_or_create_by!(name: name) { |c| c.description = description } }
[
  ["Forest guardian", "Fantasy", "Aurora Studio", "Ancient Woods", "32 mm", "painted", 1],
  ["Orbital explorer", "Science fiction", "Lunar Workshop", "Orbit Nine", "28 mm", "in_progress", 1],
  ["Scout tank", "Historical", "Horizon Models", "Historical collection", "1:72", "unpainted", 2],
  ["Mountain dragon", "Fantasy", "Aurora Studio", "Ancient Woods", "75 mm", "unpainted", 1],
  ["Maintenance robot", "Science fiction", "Lunar Workshop", "Orbit Nine", "28 mm", "painted", 3],
  ["Traveling knight", "Historical", "Horizon Models", "Medieval collection", "54 mm", "in_progress", 1]
].each do |name, category, maker, universe, scale, status, quantity|
  Miniature.find_or_create_by!(name: name) do |miniature|
    miniature.assign_attributes(category: Category.find_by!(name: category), manufacturer: maker, universe: universe, scale: scale, painting_status: status, quantity: quantity, notes: "Fictional sample record for exploring the catalog.")
  end
end
