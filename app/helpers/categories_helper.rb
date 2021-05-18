module CategoriesHelper
		def matches_won(player)
			Match.where(winner: player).count
		end
		def total_matches(player)
			Match.where(player_1: player).count + Match.where(player_2: player).count  
		end
end
