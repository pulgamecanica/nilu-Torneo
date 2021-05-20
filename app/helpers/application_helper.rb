module ApplicationHelper
	def aoe_civilizations
		['', 'Chinese', 'Persians', 'Aztecs', 'Mayans', 'Malians', 'Huns', 'Khmer', 'Britons', 'Incas', 'Franks', 'Slavs', 'Mongols', 'Celts', 'Lithuanians', 'Japanese', 'Spanish', 'Magyars', 'Berbers', 'Cumans', 'Byzantines', 'The Ethiopians', 'Bulgarians', 'Vikings', 'Saracens', 'Teutons', 'Indians', 'Burmese', 'Koreans', 'Portuguese', 'Tatars', 'Italians', 'Malay', 'Vietnamese', 'Turks', 'Goths'].freeze
	end
	def get_random_background
		backgrounds = ['background_1.png', 'background_2.png', 'background_3.png', 'background_4.png', 'background_5.png', 'background_6.png']
		backgrounds[rand(backgrounds.length)]
	end
end
