Order.destroy_all
OrderItem.destroy_all
Product.destroy_all
Category.destroy_all

bouquet = Category.new(
  name: "Bouquets",
  position: 10,
  display: true
)
print "1 category / "

bouquet_printemps = Product.new(
  name: "Bouquet Printemps",
  description: "Un somptueux bouquet de fleurs composé par Solstice avec des fleurs de saison sur le thème du printemps. Il s’agit d’une idée cadeau idéale pour un anniversaire ou pour remercier vos proches de leur soutien. Vous pouvez entièrement personnaliser ce bouquet en fonction de vos préférences et de votre budget.",
  min_price: 35,
  position: 10,
  available: true,
  category: bouquet
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609863/Solstice/Bouquet_Printemps_apdtox.jpg")
file2 = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694699688/Solstice/Bouquet_Printemps2_br3b9g.jpg")
bouquet_printemps.photos.attach(io: file, filename: "image.png", content_type: "image/png")
bouquet_printemps.photos.attach(io: file2, filename: "image.png", content_type: "image/png")

bouquet_printemps.save!
print "1 product / "

bouquet_rose_pale = Product.new(
  name: "Bouquet Rose Pâle",
  description: "Un somptueux bouquet de fleurs composé par Solstice avec des fleurs de saison . Il s’agit d’une idée cadeau idéale pour un anniversaire ou pour remercier vos proches de leur soutien. Vous pouvez entièrement personnaliser ce bouquet en fonction  de votre budget.",
  min_price: 40,
  position: 20,
  available: true,
  category: bouquet
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609860/Solstice/Bouquet_Rose_Pa%CC%82le_bcj2lv.jpg")
bouquet_rose_pale.photos.attach(io: file, filename: "image.png", content_type: "image/png")
bouquet_rose_pale.save!
print "1 product / "

bouquet_violet = Product.new(
  name: "Bouquet Violet",
  description: "Un somptueux bouquet de fleurs composé par Solstice avec des fleurs de saison . Il s’agit d’une idée cadeau idéale pour un anniversaire ou pour remercier vos proches de leur soutien. Vous pouvez entièrement personnaliser ce bouquet en fonction  de votre budget.",
  min_price: 45,
  position: 30,
  available: true,
  category: bouquet
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609864/Solstice/Bouquet_Violet_ctggh2.jpg")
bouquet_violet.photos.attach(io: file, filename: "image.png", content_type: "image/png")
bouquet_violet.save!
print "1 product / "

bouquet_jaune = Product.new(
  name: "Bouquet Jaune",
  description: "Un somptueux bouquet de fleurs composé par Solstice avec des fleurs de saison . Il s’agit d’une idée cadeau idéale pour un anniversaire ou pour remercier vos proches de leur soutien. Vous pouvez entièrement personnaliser ce bouquet en fonction  de votre budget.",
  min_price: 40,
  position: 40,
  available: true,
  category: bouquet
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609859/Solstice/Bouquet_Jaune_h0pwcl.jpg")
bouquet_jaune.photos.attach(io: file, filename: "image.png", content_type: "image/png")
bouquet_jaune.save!
print "1 product / "

bouquet_orange = Product.new(
  name: "Bouquet Orange",
  description: "Un somptueux bouquet de fleurs composé par Solstice avec des fleurs de saison . Il s’agit d’une idée cadeau idéale pour un anniversaire ou pour remercier vos proches de leur soutien. Vous pouvez entièrement personnaliser ce bouquet en fonction  de votre budget.",
  min_price: 30,
  position: 50,
  available: true,
  category: bouquet
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609865/Solstice/Bouquet_Orange_vpjga8.jpg")
bouquet_orange.photos.attach(io: file, filename: "image.png", content_type: "image/png")
bouquet_orange.save!
print "1 product / "

bouquet_rose_fuchsia = Product.new(
  name: "Bouquet Rose Fuchsia",
  description: "Un somptueux bouquet de fleurs composé par Solstice avec des fleurs de saison . Il s’agit d’une idée cadeau idéale pour un anniversaire ou pour remercier vos proches de leur soutien. Vous pouvez entièrement personnaliser ce bouquet en fonction  de votre budget.",
  min_price: 40,
  position: 60,
  available: true,
  category: bouquet
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609864/Solstice/Bouquet_Rose_Fuchsia_kyygki.jpg")
bouquet_rose_fuchsia.photos.attach(io: file, filename: "image.png", content_type: "image/png")
bouquet_rose_fuchsia.save!
print "1 product / "

bouquet_colore = Product.new(
  name: "Bouquet Coloré",
  description: "Un somptueux bouquet de fleurs composé par Solstice avec des fleurs de saison . Il s’agit d’une idée cadeau idéale pour un anniversaire ou pour remercier vos proches de leur soutien. Vous pouvez entièrement personnaliser ce bouquet en fonction  de votre budget.",
  min_price: 50,
  position: 70,
  available: true,
  category: bouquet
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609860/Solstice/Bouquet_Colore%CC%81_lkuxom.jpg")
bouquet_colore.photos.attach(io: file, filename: "image.png", content_type: "image/png")
bouquet_colore.save!
print "1 product / "

bouquet_amour = Product.new(
  name: "Bouquet Amour",
  description: "Un somptueux bouquet de fleurs composé par Solstice avec des fleurs de saison . Il s’agit d’une idée cadeau idéale pour un anniversaire ou pour remercier vos proches de leur soutien. Vous pouvez entièrement personnaliser ce bouquet en fonction  de votre budget.",
  min_price: 50,
  position: 80,
  available: true,
  category: bouquet
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609862/Solstice/Bouquet_Amour_d4hryj.jpg")
bouquet_amour.photos.attach(io: file, filename: "image.png", content_type: "image/png")
bouquet_amour.save!
print "1 product / "

bouquet_rose_pastel = Product.new(
  name: "Bouquet Rose Pastel",
  description: "Un somptueux bouquet de fleurs composé par Solstice avec des fleurs de saison . Il s’agit d’une idée cadeau idéale pour un anniversaire ou pour remercier vos proches de leur soutien. Vous pouvez entièrement personnaliser ce bouquet en fonction  de votre budget.",
  min_price: 50,
  position: 90,
  available: true,
  category: bouquet
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609859/Solstice/Bouquet_Rose_Pastel_spbhlx.jpg")
bouquet_rose_pastel.photos.attach(io: file, filename: "image.png", content_type: "image/png")
bouquet_rose_pastel.save!
print "1 product / "

bouquet_rouge_grenat = Product.new(
  name: "Bouquet Rouge Grenat",
  description: "Un somptueux bouquet de fleurs composé par Solstice avec des fleurs de saison . Il s’agit d’une idée cadeau idéale pour un anniversaire ou pour remercier vos proches de leur soutien. Vous pouvez entièrement personnaliser ce bouquet en fonction  de votre budget.",
  min_price: 50,
  position: 100,
  available: true,
  category: bouquet
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609867/Solstice/Bouquet_Rouge_Grenat_gn2ixi.jpg")
bouquet_rouge_grenat.photos.attach(io: file, filename: "image.png", content_type: "image/png")
bouquet_rouge_grenat.save!
print "1 product / "

box_paniers = Category.new(
  name: "Box & Paniers",
  position: 20,
  display: true
)
print "1 category / "

flower_box = Product.new(
  name: "Flower Box",
  description: "Flowers box composé avec des fleurs fraiches, de saison",
  min_price: 30,
  position: 10,
  available: true,
  category: box_paniers
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609865/Solstice/Flower_Box_rwxiuh.jpg")
flower_box.photos.attach(io: file, filename: "image.png", content_type: "image/png")
flower_box.save!
print "1 product / "

paniers_fleuris = Product.new(
  name: "Paniers Fleuris",
  description: "Un magnifique panier fleuris de saison réalisé par Solstice à offrir à l'occasion de la fête des grands-mères. Vous pouvez demander à votre fleuriste de le personnaliser en fonction de votre budget et de vos préférences",
  min_price: 35,
  position: 20,
  available: true,
  category: box_paniers
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609858/Solstice/Paniers_Fleuris_rwtzli.jpg")
paniers_fleuris.photos.attach(io: file, filename: "image.png", content_type: "image/png")
paniers_fleuris.save!
print "1 product / "

mega_flower_box = Product.new(
  name: "Mega Flower Box",
  description: "Flowers box composé avec des fleurs fraiches, de saison",
  min_price: 50,
  position: 30,
  available: true,
  category: box_paniers
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609867/Solstice/Mega_Flower_Box_plu0br.jpg")
mega_flower_box.photos.attach(io: file, filename: "image.png", content_type: "image/png")
mega_flower_box.save!
print "1 product / "

mega_flower_box_passion = Product.new(
  name: "Mega Flower Box Passion",
  description: "Nos Flowers Box spécial ST Valentin sont créés spécialement pour vous  ! Cette boîte a chapeau garni par de magnifiques fleurs de saison . Avec celle ci vous êtes sur de faire plaisir à la personne qui vous est chère",
  min_price: 60,
  position: 40,
  available: true,
  category: box_paniers
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609864/Solstice/Mega_Flower_Box_Passion_oap7uw.jpg")
mega_flower_box_passion.photos.attach(io: file, filename: "image.png", content_type: "image/png")
mega_flower_box_passion.save!
print "1 product / "

mega_flower_box_amour = Product.new(
  name: "Mega Flower Box Amour",
  description: "Nos Flowers Box spécial ST Valentin sont créés spécialement pour vous  ! Cette boîte a chapeau garni par de magnifiques fleurs de saison . Avec celle ci vous êtes sur de faire plaisir à la personne qui vous est chère",
  min_price: 70,
  position: 50,
  available: true,
  category: box_paniers
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609862/Solstice/Mega_Flower_Box_Amour_r3n5df.jpg")
mega_flower_box_amour.photos.attach(io: file, filename: "image.png", content_type: "image/png")
mega_flower_box_amour.save!
print "1 product / "

fleurs_sechees = Category.new(
  name: "Fleurs Séchées",
  position: 30,
  display: true
)
print "1 category / "

bouquet_fleurs_sechees = Product.new(
  name: "Bouquet de Fleurs Séchées",
  description: "Quelle que soit l'occasion à célébrer, ce somptueux bouquet de fleurs séchées ravira vos proches ou votre intérieur.",
  min_price: 35,
  position: 10,
  available: true,
  category: fleurs_sechees
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609859/Solstice/Bouquet_de_Fleurs_Se%CC%81che%CC%81es_a4724s.jpg")
bouquet_fleurs_sechees.photos.attach(io: file, filename: "image.png", content_type: "image/png")
bouquet_fleurs_sechees.save!
print "1 product / "

orchidees = Category.new(
  name: "Orchidées",
  position: 40,
  display: true
)
print "1 category / "

coupe_orchidees = Product.new(
  name: "Coupe d'Orchidées",
  description: "Ces orchidée Phalaenopsis sont de véritable accroche-regard dans votre maison. Vous pensez offrir une orchidée  sans parvenir à vous décider? Nous allons vous aider! L’orchidée est la meilleure idée de cadeau pour prouver sa tendresse et son admiration envers quelqu’un. Elle fait partie des fleurs que vous pouvez offrir aussi bien à votre partenaire qu’à un parent ou un ami, car les sentiments qu’elle évoque ne sont pas uniquement liés à l’amour de couple.",
  min_price: 40,
  position: 10,
  available: true,
  category: orchidees
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609859/Solstice/Coupe_d_Orchide%CC%81es_hmcmv9.jpg")
coupe_orchidees.photos.attach(io: file, filename: "image.png", content_type: "image/png")
coupe_orchidees.save!
print "1 product / "

orchidee_blanche = Product.new(
  name: "Orchidée Blanche",
  description: "Ces orchidée Phalaenopsis sont de véritable accroche-regard dans votre maison. Vous pensez offrir une orchidée  sans parvenir à vous décider? Nous allons vous aider! L’orchidée est la meilleure idée de cadeau pour prouver sa tendresse et son admiration envers quelqu’un. Elle fait partie des fleurs que vous pouvez offrir aussi bien à votre partenaire qu’à un parent ou un ami, car les sentiments qu’elle évoque ne sont pas uniquement liés à l’amour de couple.",
  min_price: 30,
  position: 20,
  available: true,
  category: orchidees
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609858/Solstice/Orchide%CC%81e_Blanche_rxmqr7.jpg")
orchidee_blanche.photos.attach(io: file, filename: "image.png", content_type: "image/png")
orchidee_blanche.save!
print "1 product / "

deuil = Category.new(
  name: "Deuil",
  position: 50,
  display: true
)
print "1 category / "

coussin_deuil = Product.new(
  name: "Coussin Deuil",
  description: "Coussin funéraire dédié à un être cher, un dernier hommage pour l'accompagner jusqu'au repos éternel ! Une composition élaborée avec des fleurs fraîches de saison .",
  min_price: 90,
  position: 10,
  available: true,
  category: deuil
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609866/Solstice/Coussin_Deuil_xkq9un.jpg")
coussin_deuil.photos.attach(io: file, filename: "image.png", content_type: "image/png")
coussin_deuil.save!
print "1 product / "

coussin_conique_deuil = Product.new(
  name: "Coussin Conique Deuil",
  description: "Coussin conique de fleurs pour deuil composée de fleurs de saison (coloris au choix ) . Une croix de deuil est réalisée pour témoigner de sentiments les plus profonds et de regrets.",
  min_price: 120,
  position: 20,
  available: true,
  category: deuil
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609861/Solstice/Coeur_Deuil_dwf5hu.jpg")
coussin_conique_deuil.photos.attach(io: file, filename: "image.png", content_type: "image/png")
coussin_conique_deuil.save!
print "1 product / "

raquette_deuil = Product.new(
  name: "Raquette Deuil",
  description: "Une belle et ample composition de deuil réalisée par Langage Des Fleurs pour rendre un dernier hommage à vos proches disparus",
  min_price: 150,
  position: 30,
  available: true,
  category: deuil
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609858/Solstice/Raquette_Deuil_jhblzw.jpg")
raquette_deuil.photos.attach(io: file, filename: "image.png", content_type: "image/png")
raquette_deuil.save!
print "1 product / "

coeur_deuil = Product.new(
  name: "Coeur Deuil",
  description: "Le cœur porte une forte symbolique et il serait dommage d'y renoncer en période de deuil. Pour exprimer votre attachement au défunt en lui rendant un dernier hommage . ",
  min_price: 80,
  position: 40,
  available: true,
  category: deuil
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609861/Solstice/Coeur_Deuil_dwf5hu.jpg")
coeur_deuil.photos.attach(io: file, filename: "image.png", content_type: "image/png")
coeur_deuil.save!
print "1 product / "

devant_tombe_deuil = Product.new(
  name: "Devant de Tombe Deuil",
  description: "Un devant de tombe est positionné devant le cercueil lors de la cérémonie puis il est déplacé au pied de la tombe au cimetière. Il s'agit d'une composition élégante de fleur piquées, construite en hauteur mais cependant bien stable, ce qui lui permet d'être disposée en extérieur après les funérailles afin de fleurir le cimetière.",
  min_price: 130,
  position: 50,
  available: true,
  category: deuil
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609863/Solstice/Devant_de_Tombe_Deuil_mmijou.jpg")
devant_tombe_deuil.photos.attach(io: file, filename: "image.png", content_type: "image/png")
devant_tombe_deuil.save!
print "1 product / "

croix_deuil = Product.new(
  name: "Croix Deuil",
  description: "Croix de fleurs pour deuil composée de fleurs de saison (coloris au choix ) . Une croix de deuil est réalisée pour témoigner de sentiments les plus profonds et de regrets.",
  min_price: 50,
  position: 60,
  available: true,
  category: deuil
)
file = URI.open("https://res.cloudinary.com/dqfgqm3cn/image/upload/v1694609859/Solstice/Croix_Deuil_qingux.jpg")
croix_deuil.photos.attach(io: file, filename: "image.png", content_type: "image/png")
croix_deuil.save!
print "1 product / "
