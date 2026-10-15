categories = {
  "Fantasia" => "Heróis, criaturas e cenários de mundos imaginários.",
  "Ficção científica" => "Naves, robôs e exploradores do futuro.",
  "Históricos" => "Veículos e personagens inspirados na história."
}
categories.each { |name, description| Category.find_or_create_by!(name: name) { |c| c.description = description } }
[
  ["Guardião da floresta", "Fantasia", "Ateliê Aurora", "Bosque Antigo", "32 mm", "painted", 1],
  ["Exploradora orbital", "Ficção científica", "Oficina Lunar", "Órbita 9", "28 mm", "in_progress", 1],
  ["Tanque de reconhecimento", "Históricos", "Modelos Horizonte", "Coleção histórica", "1:72", "unpainted", 2],
  ["Dragão das montanhas", "Fantasia", "Ateliê Aurora", "Bosque Antigo", "75 mm", "unpainted", 1],
  ["Robô de manutenção", "Ficção científica", "Oficina Lunar", "Órbita 9", "28 mm", "painted", 3],
  ["Cavaleiro viajante", "Históricos", "Modelos Horizonte", "Coleção medieval", "54 mm", "in_progress", 1]
].each do |name, category, maker, universe, scale, status, quantity|
  Miniature.find_or_create_by!(name: name) do |miniature|
    miniature.assign_attributes(category: Category.find_by!(name: category), manufacturer: maker, universe: universe, scale: scale, painting_status: status, quantity: quantity, notes: "Exemplo fictício para explorar o catálogo.")
  end
end
