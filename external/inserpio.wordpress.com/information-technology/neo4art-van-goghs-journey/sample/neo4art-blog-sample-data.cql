CREATE (a:ARTIST {first_name: 'Vincent', second_name: 'Willem', last_name: 'Van Gogh', born: 18530330, died: 18900729});
CREATE CONSTRAINT ON (a:ARTIST) ASSERT a.last_name IS UNIQUE;
MATCH (a:ARTIST {last_name: 'Van Gogh'}) CREATE (a)-[:BORN_IN]->(c:CITY {name: 'Zundert', province: 'North Brabant', country: 'Netherland', latitude: 51.466667, longitude: 4.666667});
MATCH (a:ARTIST {last_name: 'Van Gogh'}) CREATE (a)-[:DIED_IN]->(c:CITY {name: 'Auvers-sur-Oise', region: 'Île-de-France', country: 'France', latitude: 49.0725, longitude: 2.175});
MATCH (a:ARTIST {last_name: 'Van Gogh'}) CREATE (a)-[:BELONGS_TO]->(m:ART_MOVEMENT {name: 'Post-Impressionism', wikipedia: 'http://en.wikipedia.org/wiki/Post-Impressionism'});


MATCH (a:ARTIST {last_name: 'Van Gogh'}) CREATE (a)-[:MOVED_TO]->(s:STAGE {from: 188312, to: 188511});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(stage:STAGE)
WITH last(collect(stage)) as last_stage
CREATE (last_stage)-[:IN]->(c:CITY {name: 'Neuen', province: 'North Brabant', country: 'Netherland', latitude: 51.473333, longitude: 5.546667});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(stage:STAGE)
WITH last(collect(stage)) as last_stage
CREATE (last_stage)-[:MOVED_TO]->(:STAGE {from: 188512, to: 188602});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(stage:STAGE)
WITH last(collect(stage)) as last_stage
CREATE (last_stage)-[:IN]->(c:CITY {name: 'Antwerp', region: 'Flemish Region', country: 'Belgium', latitude: 51.216667, longitude: 4.4});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(stage:STAGE)
WITH last(collect(stage)) as last_stage
CREATE (last_stage)-[:MOVED_TO]->(:STAGE {from: 188603, to: 188802 });
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(stage:STAGE)
WITH last(collect(stage)) as last_stage
CREATE (last_stage)-[:IN]->(c:CITY {name: 'Paris', region: 'Île-de-France', country: 'France', latitude: 48.8567, longitude: 2.3508});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(stage:STAGE)
WITH last(collect(stage)) as last_stage
CREATE (last_stage)-[:MOVED_TO]->(:STAGE {from: 188802, to: 188905 });
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(stage:STAGE)
WITH last(collect(stage)) as last_stage
CREATE (last_stage)-[:IN]->(c:CITY {name: 'Arles', region: 'Provence-Alpes-Côte d\'Azur', country: 'France', latitude: 43.6767, longitude: 4.6278});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(stage:STAGE)
WITH last(collect(stage)) as last_stage
CREATE (last_stage)-[:MOVED_TO]->(:STAGE {from: 188905, to: 189005 });
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(stage:STAGE)
WITH last(collect(stage)) as last_stage
CREATE (last_stage)-[:IN]->(c:CITY {name: 'Saint-Rémy de Provence', region: 'Provence-Alpes-Côte d\'Azur', country: 'France', latitude: 43.79, longitude: 4.8325});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(stage:STAGE)
WITH last(collect(stage)) as last_stage
CREATE (last_stage)-[:MOVED_TO]->(:STAGE {from: 189005, to: 189007 });
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(stage:STAGE)
WITH last(collect(stage)) as last_stage
MATCH (c:CITY {name: 'Auvers-sur-Oise'})
CREATE (last_stage)-[:IN]->(c);


CREATE (a:ARTIST {first_name: 'Peter', second_name: 'Paul', last_name: 'Rubens', born: 15770628, died: 16400530});
MATCH (a:ARTIST {last_name: 'Rubens'}) CREATE (a)-[:BELONGS_TO]->(m:ART_MOVEMENT {name: 'Baroque', wikipedia: 'http://en.wikipedia.org/wiki/Baroque'});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Antwerp'}), (influencer:ARTIST {last_name: 'Rubens'})
CREATE (s)-[:WHERE_WAS_INFLUENCED_BY]->(influencer);
CREATE (a:ARTIST {first_name: 'Henri', second_name: 'Marie', third_name: 'Raymond', last_name: 'Toulouse-Lautrec', born: 18641124, died: 19010909});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Paris'}), (influencer:ARTIST {last_name: 'Toulouse-Lautrec'})
CREATE (s)-[:WHERE_WAS_INFLUENCED_BY]->(influencer);
MATCH (a:ARTIST {last_name: 'Toulouse-Lautrec'}), (m:ART_MOVEMENT {name: 'Post-Impressionism'})
CREATE (a)-[:BELONGS_TO]->(m);
MATCH (a:ARTIST {last_name: 'Toulouse-Lautrec'})
CREATE (a)-[:BELONGS_TO]->(m:ART_MOVEMENT {name: 'Art Nouveau', wikipedia: 'http://en.wikipedia.org/wiki/Art_Nouveau'});
CREATE (a:ARTIST {first_name: 'Eugène', second_name: 'Henri', third_name: 'Paul', last_name: 'Gauguin', born: 18480711, died: 19030508});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Paris'}), (influencer:ARTIST {last_name: 'Gauguin'})
CREATE (s)-[:WHERE_WAS_INFLUENCED_BY]->(influencer);
MATCH (a:ARTIST {last_name: 'Gauguin'}), (m:ART_MOVEMENT {name: 'Post-Impressionism'})
CREATE (a)-[:BELONGS_TO]->(m);
CREATE (a:ARTIST {first_name: 'Émile', second_name: 'Henri', last_name: 'Bernard', born: 18680428, died: 19410416});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Paris'}), (influencer:ARTIST {last_name: 'Bernard'})
CREATE (s)-[:WHERE_WAS_INFLUENCED_BY]->(influencer);
MATCH (a:ARTIST {last_name: 'Bernard'}), (m:ART_MOVEMENT {name: 'Post-Impressionism'})
CREATE (a)-[:BELONGS_TO]->(m);
CREATE (a:ARTIST {first_name: 'Camille', last_name: 'Pissarro', born: 18300710, died: 19031113});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Paris'}), (influencer:ARTIST {last_name: 'Pissarro'})
CREATE (s)-[:WHERE_WAS_INFLUENCED_BY]->(influencer);
MATCH (a:ARTIST {last_name: 'Pissarro'}), (m:ART_MOVEMENT {name: 'Post-Impressionism'})
CREATE (a)-[:BELONGS_TO]->(m);
MATCH (a:ARTIST {last_name: 'Pissarro'})
CREATE (a)-[:BELONGS_TO]->(m:ART_MOVEMENT {name: 'Impressionism', wikipedia: 'http://en.wikipedia.org/wiki/Impressionism'});
CREATE (a:ARTIST {first_name: 'Georges-Pierre', last_name: 'Seurat', born: 18591202, died: 18910329});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Paris'}), (influencer:ARTIST {last_name: 'Seurat'})
CREATE (s)-[:WHERE_WAS_INFLUENCED_BY]->(influencer);
MATCH (a:ARTIST {last_name: 'Seurat'})
CREATE (a)-[:BELONGS_TO]->(m:ART_MOVEMENT {name: 'Neo-impressionism', wikipedia: 'http://en.wikipedia.org/wiki/Neo-impressionism'});
MATCH (a:ARTIST {last_name: 'Seurat'})
CREATE (a)-[:BELONGS_TO]->(m:ART_MOVEMENT {name: 'Pointillism', wikipedia: 'http://en.wikipedia.org/wiki/Pointillism'});
MATCH (a:ARTIST {last_name: 'Seurat'}), (m:ART_MOVEMENT {name: 'Post-Impressionism'})
CREATE (a)-[:BELONGS_TO]->(m);
CREATE (a:ARTIST {first_name: 'Oscar-Claude', last_name: 'Monet', born: 18401114, died: 19260526});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Paris'}), (influencer:ARTIST {last_name: 'Monet'})
CREATE (s)-[:WHERE_WAS_INFLUENCED_BY]->(influencer);
MATCH (a:ARTIST {last_name: 'Monet'}), (m:ART_MOVEMENT {name: 'Impressionism'})
CREATE (a)-[:BELONGS_TO]->(m);
CREATE (a:ARTIST {first_name: 'Eugène', last_name: 'Boch', born: 18550901, died: 19410103});
MATCH (a:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Arles'}), (influencer:ARTIST {last_name: 'Boch'})
CREATE (s)-[:WHERE_WAS_INFLUENCED_BY]->(influencer);


CREATE (v:VISUAL_ART {name: 'painting', wikipedia: 'http://en.wikipedia.org/wiki/Visual_arts#Painting'});
CREATE (a:ARTWORK {title: 'The Potato Eaters I', type: 'oil on canvas', year: 1885, month: 'April', thumbnail: 'http://www.vggallery.com/painting/f_0082.jpg', f_order: '82', jh_order: '764'});
MATCH (a:ARTIST {last_name: 'Van Gogh'}), (w:ARTWORK {title: 'The Potato Eaters I'})
CREATE (w)-[:AUTHOR]->(a);
MATCH (a:ARTWORK {title: 'The Potato Eaters I'}), (v:VISUAL_ART {name: 'painting'})
CREATE (a)-[:IS_A]->(v);
MATCH (:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Neuen'}), (a:ARTWORK {title: 'The Potato Eaters I'})
CREATE (s)-[:WHERE_REALIZED]->(a);
CREATE (a:ARTWORK {title: 'Backyards of Old Houses in Antwerp in the Snow', type: 'oil on canvas', year: 1885, month: 'December', thumbnail: 'http://www.vggallery.com/painting/f_0260.jpg', f_order: '260', jh_order: '970'});
MATCH (a:ARTIST {last_name: 'Van Gogh'}), (w:ARTWORK {title: 'Backyards of Old Houses in Antwerp in the Snow'})
CREATE (w)-[:AUTHOR]->(a);
MATCH (a:ARTWORK {title: 'Backyards of Old Houses in Antwerp in the Snow'}), (v:VISUAL_ART {name: 'painting'})
CREATE (a)-[:IS_A]->(v);
MATCH (:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Antwerp'}), (a:ARTWORK {title: 'Backyards of Old Houses in Antwerp in the Snow'})
CREATE (s)-[:WHERE_REALIZED]->(a);
CREATE (a:ARTWORK {title: 'Portrait of Père Tanguy III', type: 'oil on canvas', year: 1887, period: 'Autumn', thumbnail: 'http://www.vggallery.com/painting/f_0363.jpg', f_order: '363', jh_order: '1351'});
MATCH (a:ARTIST {last_name: 'Van Gogh'}), (w:ARTWORK {title: 'Portrait of Père Tanguy III'})
CREATE (w)-[:AUTHOR]->(a);
MATCH (a:ARTWORK {title: 'Portrait of Père Tanguy III'}), (v:VISUAL_ART {name: 'painting'})
CREATE (a)-[:IS_A]->(v);
MATCH (:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Paris'}), (a:ARTWORK {title: 'Portrait of Père Tanguy III'})
CREATE (s)-[:WHERE_REALIZED]->(a);
CREATE (a:ARTWORK {title: 'The Cafe Terrace on the Place du Forum, Arles, at Night', type: 'oil on canvas', year: 1888, month: 'September', thumbnail: 'http://www.vggallery.com/painting/f_0467.jpg', f_order: '467', jh_order: '1580'});
MATCH (a:ARTIST {last_name: 'Van Gogh'}), (w:ARTWORK {title: 'The Cafe Terrace on the Place du Forum, Arles, at Night'})
CREATE (w)-[:AUTHOR]->(a);
MATCH (a:ARTWORK {title: 'The Cafe Terrace on the Place du Forum, Arles, at Night'}), (v:VISUAL_ART {name: 'painting'})
CREATE (a)-[:IS_A]->(v);
MATCH (:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Arles'}), (a:ARTWORK {title: 'The Cafe Terrace on the Place du Forum, Arles, at Night'})
CREATE (s)-[:WHERE_REALIZED]->(a);
CREATE (a:ARTWORK {title: 'Starry Night', type: 'oil on canvas', year: 1889, month: 'June', thumbnail: 'http://www.vggallery.com/painting/f_0612.jpg', f_order: '612', jh_order: '1731'});
MATCH (a:ARTIST {last_name: 'Van Gogh'}), (w:ARTWORK {title: 'Starry Night'})
CREATE (w)-[:AUTHOR]->(a);
MATCH (a:ARTWORK {title: 'Starry Night'}), (v:VISUAL_ART {name: 'painting'})
CREATE (a)-[:IS_A]->(v);
MATCH (:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Saint-Rémy de Provence'}), (a:ARTWORK {title: 'Starry Night'})
CREATE (s)-[:WHERE_REALIZED]->(a);
CREATE (a:ARTWORK {title: 'Wheat Field with Crows', type: 'oil on canvas', year: 1890, month: 'July', thumbnail: 'http://www.vggallery.com/painting/f_0779.jpg', f_order: '779', jh_order: '2117'});
MATCH (a:ARTIST {last_name: 'Van Gogh'}), (w:ARTWORK {title: 'Wheat Field with Crows'})
CREATE (w)-[:AUTHOR]->(w);
MATCH (a:ARTWORK {title: 'Wheat Field with Crows'}), (v:VISUAL_ART {name: 'painting'})
CREATE (a)-[:IS_A]->(v);
MATCH (:ARTIST {last_name: 'Van Gogh'})-[:MOVED_TO*]->(s:STAGE)-[:IN]->(c:CITY {name: 'Auvers-sur-Oise'}), (a:ARTWORK {title: 'Wheat Field with Crows'})
CREATE (s)-[:WHERE_REALIZED]->(a);


CREATE (m:MUSEUM {name: 'Van Gogh Museum', director: 'Axel Rüger', address: 'Museumplein Amsterdam, Netherlands', website: 'http://www.vangoghmuseum.nl/', wikipedia: 'http://en.wikipedia.org/wiki/Van_Gogh_Museum'});
CREATE (c:CITY {name: 'Amsterdam', province: 'North Holland', country: 'Netherlands', longitude: 52.373056, latitude: 4.892222});
MATCH (m:MUSEUM {name: 'Van Gogh Museum'}), (c:CITY {name: 'Amsterdam'})
CREATE (m)-[:LOCATED_IN]->(c);
MATCH (m:MUSEUM {name: 'Van Gogh Museum'}), (a:ARTWORK {title: 'The Potato Eaters I'})
CREATE (a)-[:OFFICIAL_LOCATION]->(m);
MATCH (m:MUSEUM {name: 'Van Gogh Museum'}), (a:ARTWORK {title: 'Backyards of Old Houses in Antwerp in the Snow'})
CREATE (a)-[:OFFICIAL_LOCATION]->(m);
MATCH (m:MUSEUM {name: 'Van Gogh Museum'}), (a:ARTWORK {title: 'Wheat Field with Crows'})
CREATE (a)-[:OFFICIAL_LOCATION]->(m);
CREATE (m:MUSEUM {name: 'Musée Rodin', address: 'Hôtel Biron, 79, rue de Varenne, 75007 Paris, France', website: 'http://www.musee-rodin.fr/', wikipedia: 'http://en.wikipedia.org/wiki/Mus%C3%A9e_Rodin', latitude: 48.855278, longitude: 2.315833});
MATCH (m:MUSEUM {name: 'Musée Rodin'}), (c:CITY {name: 'Paris'})
CREATE (m)-[:LOCATED_IN]->(c);
MATCH (m:MUSEUM {name: 'Musée Rodin'}), (a:ARTWORK {title: 'Portrait of Père Tanguy III'})
CREATE (a)-[:OFFICIAL_LOCATION]->(m);
CREATE (m:MUSEUM {name: 'Kröller-Müller Museum', director: 'Lisette Pelsers', website: 'http://kmm.nl', wikipedia: 'http://en.wikipedia.org/wiki/Kr%C3%B6ller-M%C3%BCller_Museum', latitude: 52.095556, longitude: 5.816944});
CREATE (c:CITY {name: 'Otterlo', province: 'Gelderland', country: 'Netherlands', longitude: 52.1, latitude: 5.783333});
MATCH (m:MUSEUM {name: 'Kröller-Müller Museum'}), (c:CITY {name: 'Otterlo'})
CREATE (m)-[:LOCATED_IN]->(c);
MATCH (m:MUSEUM {name: 'Kröller-Müller Museum'}), (a:ARTWORK {title: 'The Cafe Terrace on the Place du Forum, Arles, at Night'})
CREATE (a)-[:OFFICIAL_LOCATION]->(m);
CREATE (m:MUSEUM {name: 'The Museum of Modern Art', director: 'Glenn D. Lowry', address: '11 West 53rd Street New York, NY 10019', website: 'http://www.moma.org/', wikipedia: 'http://en.wikipedia.org/wiki/The_Museum_of_Modern_Art', latitude: 40.761484, longitude: -73.977664});
CREATE (c:CITY {name: 'New York', county: ['Bronx', 'Kings', 'New York', 'Queens', 'Richmond'], state: 'New York', country: 'United States of America', longitude: 40.67, latitude: -73.94});
MATCH (m:MUSEUM {name: 'The Museum of Modern Art'}), (c:CITY {name: 'New York'})
CREATE (m)-[:LOCATED_IN]->(c);
MATCH (m:MUSEUM {name: 'The Museum of Modern Art'}), (a:ARTWORK {title: 'Starry Night'})
CREATE (a)-[:OFFICIAL_LOCATION]->(m);


CREATE (p:PERSON {first_name: 'Lorenzo', last_name: 'Speranzoni', born: 19741120});
CREATE (c:CITY {name: 'Mestre', province: 'Venice', region: 'Veneto', country: 'Italy'});
MATCH (lorenzo:PERSON {last_name: 'Speranzoni'}), (mestre:CITY {name: 'Mestre'})
CREATE (lorenzo)-[:LIVES_IN]->(mestre);
MATCH (lorenzo:PERSON {last_name: 'Speranzoni'}), (van_gogh:ARTIST {last_name: 'Van Gogh'})
CREATE (lorenzo)-[:LIKES]->(van_gogh);
MATCH (lorenzo:PERSON {last_name: 'Speranzoni'}), (the_potato_eaters:ARTWORK {title: 'The Potato Eaters I'})
CREATE (lorenzo)-[:LIKES]->(the_potato_eaters);


CREATE (m:MUSEUM {name: 'Musée d\'Orsay', director: 'Serge Lemoine', address: 'Rue de Lille 75343 Paris, France', website: 'http://www.musee-orsay.fr/en/', wikipedia: 'http://en.wikipedia.org/wiki/Mus%C3%A9e_d%27Orsay', latitude: 48.86, longitude: 2.327});
MATCH (m:MUSEUM {name: 'Musée d\'Orsay'}), (c:CITY {name: 'Paris'})
CREATE (m)-[:LOCATED_IN]->(c);
MATCH (lorenzo:PERSON {last_name: 'Speranzoni'}), (musee_orsay:MUSEUM {name: 'Musée d\'Orsay'})
CREATE (lorenzo)-[:LIKES]->(musee_orsay);
MATCH (lorenzo:PERSON {last_name: 'Speranzoni'}), (musee_orsay:MUSEUM {name: 'Musée d\'Orsay'})
CREATE (lorenzo)-[:VISITED {date: 20130828}]->(musee_orsay);
MATCH (lorenzo:PERSON {last_name: 'Speranzoni'}), (musee_orsay:MUSEUM {name: 'Musée d\'Orsay'})
CREATE (lorenzo)-[:POSTED {media_type: 'image', url: 'http://www.flickr.com/photos/inserpio/12340140213/' }]->(musee_orsay);
MATCH (lorenzo:PERSON {last_name: 'Speranzoni'}), (musee_orsay:MUSEUM {name: 'Musée d\'Orsay'})
CREATE (lorenzo)-[:POSTED {media_type: 'image', url: 'http://www.flickr.com/photos/inserpio/12340129353/' }]->(musee_orsay);
MATCH (lorenzo:PERSON {last_name: 'Speranzoni'}), (auvers_sur_oise:CITY {name: 'Auvers-sur-Oise'})
CREATE (lorenzo)-[:POSTED {media_type: 'image', url: 'http://www.flickr.com/photos/inserpio/12340356925/' }]->(auvers_sur_oise);
MATCH (lorenzo:PERSON {last_name: 'Speranzoni'}), (auvers_sur_oise:CITY {name: 'Auvers-sur-Oise'})
CREATE (lorenzo)-[:POSTED {media_type: 'image', url: 'http://www.flickr.com/photos/inserpio/12340339575/' }]->(auvers_sur_oise);
MATCH (lorenzo:PERSON {last_name: 'Speranzoni'}), (auvers_sur_oise:CITY {name: 'Auvers-sur-Oise'})
CREATE (lorenzo)-[:POSTED {media_type: 'image', url: 'http://www.flickr.com/photos/inserpio/12340350135/' }]->(auvers_sur_oise);
MATCH (lorenzo:PERSON {last_name: 'Speranzoni'}), (auvers_sur_oise:CITY {name: 'Auvers-sur-Oise'})
CREATE (lorenzo)-[:POSTED {media_type: 'image', url: 'http://www.flickr.com/photos/inserpio/12340481073/' }]->(auvers_sur_oise);
