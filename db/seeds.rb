ShopStatus.destroy_all
User.destroy_all
Order.destroy_all
OrderItem.destroy_all
Product.destroy_all
Category.destroy_all
Polygon.destroy_all

# // SHOP STATUS //
print "setting shop status"

status = ShopStatus.new(
  active: false,
  message: "🚧 Le site est actuellement en maintenance 🚧 Pour passer commande, contactez-nous au +262 262 51 71 78 !"
)

status.save!

# // CREATING POLYGON //
print "creating polygon (delivery area)"

polygon = Polygon.new(
  coordinates: "[[55.570173292706755,-21.307458141080446],[55.56021697082355,-21.31321538839633],[55.554723827715236,-21.323769755595023],[55.54751407738701,-21.339120207636967],[55.526228147843284,-21.340399339469457],[55.511465325741256,-21.339439991641],[55.49395593208584,-21.335282745200786],[55.48090971720379,-21.331125380937323],[55.46546025221383,-21.32760751916527],[55.45413064455323,-21.331125380937323],[55.447950858556936,-21.342957569665955],[55.46443028788033,-21.360863931099033],[55.49258264630839,-21.35702703782985],[55.510092039965315,-21.36054419383143],[55.523824897733846,-21.365659906370695],[55.54957400605241,-21.372693719351005],[55.5554104706047,-21.379727194424248],[55.581846221811276,-21.378768104087115],[55.60072890124414,-21.377169606228037],[55.60210218702011,-21.36597963247175],[55.60004225835468,-21.35319004408541],[55.58596607914217,-21.347434365109578],[55.58596607914217,-21.337841064646767],[55.57944297170039,-21.32760751916527],[55.577383043034956,-21.313535228852047],[55.570173292706755,-21.307458141080446]]",
  name: "delivery_area"
)

polygon.save!
print "delivery area OK"

# // CREATING USERS //

print "creating users"

admin_password = ENV.fetch("ADMIN_SEED_PASSWORD") do
  raise "Set ADMIN_SEED_PASSWORD in your .env before running db:seed"
end

admin = User.new(
  email: 'laurie@solsticefleurs.com',
  first_name: "Laurie",
  last_name: "Solstice",
  phone: "+262 262 51 71 79",
  password: admin_password,
  password_confirmation: admin_password,
  admin: true
)
admin.save!
print "1 user"

francois = User.new(
  email: 'fdhaene@gmail.com',
  first_name: 'François',
  last_name: "D'Haene",
  phone: "+262 262 51 71 79",
  address: '4 Rue Sainte-Rose, 97410, Saint-Pierre, La Réunion',
  password: 'password',
  password_confirmation: 'password',
  admin: false
)
francois.save!
print "1 user"

kilian = User.new(
  email: 'kjornet@gmail.com',
  first_name: 'Kilian',
  last_name: "Jornet",
  phone: "+262 262 51 71 80",
  address: '15 Lotissement Le Cap, 97429, Petite-Île, La Réunion',
  password: 'password',
  password_confirmation: 'password',
  admin: false
)
kilian.save!
print "1 user"

antoine = User.new(
  email: 'antoine.guillon@gmail.com',
  first_name: 'Antoine',
  last_name: "Guillon",
  phone: "+262 262 51 71 81",
  address: '17 Rue Des Cerises, 97429, Petite-Île, La Réunion',
  password: 'password',
  password_confirmation: 'password',
  admin: false
)
antoine.save!
print "1 user"

# // CREATING CATEGORIES AND PRODUCTS //

bouquet = Category.new(
  name: "Bouquets",
  position: 1,
  display: true)
print "1 category / "

bouquet.save!

bouquet_bisou = Product.new(
  name: "Bouquet Bisou",
  description: "Envie de déclarer votre flamme avec des fleurs ? Choisissez ce délicieux mélange de fleurs rouges et roses pour déployer le romantisme qui sommeille en vous.",
  min_price_cents: 3500,
  position: 1,
  available: true,
  category: bouquet,
  product_type: "Custom"
)
file = URI.open("https://res.cloudinary.com/dyag21cke/image/upload/v1699950002/bouquet-bisou_zcfbnx.jpg")
bouquet_bisou.photos.attach(io: file, filename: "image.png", content_type: "image/png")

bouquet_bisou.save!
print "1 product / "

bouquet_tendre = Product.new(
  name: "Bouquet Tendre",
  description: "Pour toutes les occasions, ce bouquet frais, romantique et doux fera fondre le coeur de l'être que vous souhaitez gâter.",
  min_price_cents: 3500,
  position: 2,
  available: true,
  category: bouquet,
  product_type: "Custom"
)
file = URI.open("https://res.cloudinary.com/dyag21cke/image/upload/v1699950002/bouquet-tendre_j4tqmw.jpg")
bouquet_tendre.photos.attach(io: file, filename: "image.png", content_type: "image/png")

bouquet_tendre.save!
print "1 product / "

bouquet_soleil = Product.new(
  name: "Bouquet Soleil",
  description: "Une composition solaire et chaude, aux couleurs chatoyantes qui apportera une belle dose de bonne humeur au destinataire de ce chaleureux bouquet.",
  min_price_cents: 3500,
  position: 3,
  available: true,
  category: bouquet,
  product_type: "Custom"
)
file = URI.open("https://res.cloudinary.com/dyag21cke/image/upload/v1699950002/bouquet-soleil_gnjjuc.jpg")
bouquet_soleil.photos.attach(io: file, filename: "image.png", content_type: "image/png")

bouquet_soleil.save!
print "1 product / "

bouquet_champetre = Product.new(
  name: "Bouquet Champêtre",
  description: "Offrez du peps et de la légèreté avec ce bouquet alliant fleurs fraîches et végétaux secs. Colorée et destructurée, cette composition est une vraie ballade à travers champs en été.",
  min_price_cents: 4000,
  position: 4,
  available: true,
  category: bouquet,
  product_type: "Custom"
)
file = URI.open("https://res.cloudinary.com/dyag21cke/image/upload/v1699950002/bouquet-champetre_ekx88n.jpg")
bouquet_champetre.photos.attach(io: file, filename: "image.png", content_type: "image/png")

bouquet_champetre.save!
print "1 product / "

bouquet_pur = Product.new(
  name: "Bouquet Pur",
  description: "Ce bouquet élégant se prête à toutes les occasions, il traduira avec simplicité vos émotions les plus sincères.",
  min_price_cents: 3500,
  position: 5,
  available: true,
  category: bouquet,
  product_type: "Custom"
)
file = URI.open("https://res.cloudinary.com/dyag21cke/image/upload/v1699950002/bouquet-pur_pybkf2.jpg")
bouquet_pur.photos.attach(io: file, filename: "image.png", content_type: "image/png")

bouquet_pur.save!
print "1 product / "

bouquet_tropical = Product.new(
  name: "Bouquet Tropical",
  description: "Un bouquet de fleurs 100% local avec des fleurs et feuillages de la Réunion, coloré et frais comme nout péi.",
  min_price_cents: 3500,
  position: 6,
  available: true,
  category: bouquet,
  product_type: "Custom"
)
file = URI.open("https://res.cloudinary.com/dyag21cke/image/upload/v1700495702/bouquet-tropical_ykfnu4.jpg")
bouquet_tropical.photos.attach(io: file, filename: "image.png", content_type: "image/png")

bouquet_tropical.save!
print "1 product / "

bouquet_test = Product.new(
  name: "Bouquet Test",
  description: "Bouquet Test",
  min_price_cents: 100,
  position: 7,
  available: true,
  category: bouquet,
  product_type: "Custom"
)

bouquet_test.save!
print "1 product / "

paniers_fleuris = Category.new(
  name: "Paniers fleuris",
  position: 2,
  display: true)
print "1 category / "

paniers_fleuris.save!

panier_fleuri = Product.new(
  name: "Panier fleuri",
  description: "Offrez une délicate attention avec ce panier tressé composé d'un joli mélange de fleurs merveilleuses et odorantes.
  ",
  min_price_cents: 6000,
  position: 1,
  available: true,
  category: paniers_fleuris,
  product_type: "Custom"
)
file = URI.open("https://res.cloudinary.com/dyag21cke/image/upload/v1699950002/panier-fleuri_kub6nh.jpg")
panier_fleuri.photos.attach(io: file, filename: "image.png", content_type: "image/png")

panier_fleuri.save!
print "1 product / "


deuil = Category.new(
  name: "Deuil",
  position: 3,
  display: true)
deuil.save!
print "1 category / "


plantes = Category.new(
  name: "Plantes",
  position: 3,
  display: true)
plantes.save!
print "1 category / "

roses_eternelles = Category.new(
  name: "Roses éternelles",
  position: 3,
  display: true)
roses_eternelles.save!
print "1 category / "

fleurs_sechees = Category.new(
  name: "Fleurs séchées",
  position: 3,
  display: true)
fleurs_sechees.save!
print "1 category / "


order1 = Order.new(
  user: francois,
  status: "En Attente de Paiement",
  transport: "Livraison",
  delivery_first_name: "Courtney",
  delivery_last_name: "Dauwalter",
  first_name: francois.first_name,
  last_name: francois.last_name,
  email: francois.email,
  delivery_address: francois.address,
  delivery_instructions: "Au fond de l'allée",
  phone: francois.phone,
  date: DateTime.now + 3
)
order1.save!

orderitem1 = OrderItem.new(
  product: bouquet_bisou,
  order: order1,
  message: "Joyeux Anniversaire !!",
  occasion: "Anniversaire",
  price_cents: 5000
)
orderitem1.save!

order2 = Order.new(
  user: kilian,
  status: "Payée",
  transport: "Livraison",
  delivery_first_name: "Katie",
  delivery_last_name: "Schide",
  first_name: kilian.first_name,
  last_name: kilian.last_name,
  email: kilian.email,
  delivery_address: "2 Rue des Oliviers, Petite Île 97429, La Réunion",
  delivery_instructions: "",
  phone: "+262692084408",
  date: DateTime.now + 3
)
order2.save!

orderitem2 = OrderItem.new(
  product: bouquet_tendre,
  water_bubble: true,
  order: order2,
  message: "Je t'aime",
  occasion: "Saint Valentin",
  price_cents: 9000
)
orderitem2.save!

order3 = Order.new(
  user: kilian,
  status: "Payée",
  transport: "Click & Collect",
  first_name: kilian.first_name,
  last_name: kilian.last_name,
  email: kilian.email,
  phone: kilian.phone,
  date: DateTime.now + 2
)
order3.save!

orderitem3 = OrderItem.new(
  product: bouquet_bisou,
  order: order3,
  message: "",
  occasion: "Spontané",
  price_cents: 6000,
  water_bubble: true
)
orderitem3.save!

orderitem4 = OrderItem.new(
  product: bouquet_soleil,
  order: order3,
  message: "",
  occasion: "Spontané",
  price_cents: 10000
)
orderitem4.save!

puts "Finished !!"
