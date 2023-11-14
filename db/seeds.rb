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

admin = User.new(
  email: 'admin@solstice.com',
  first_name: "Admin",
  last_name: "Solstice",
  phone: "+262 262 51 71 79",
  password: 'password',
  password_confirmation: 'password',
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

bouquet_bisou = Product.new(
  name: "Bouquet Bisou",
  description: "",
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
  description: "",
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
  description: "",
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
  description: "",
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
  description: "",
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

paniers_fleuris = Category.new(
  name: "Paniers fleuris",
  position: 2,
  display: true)
print "1 category / "

panier_fleuri = Product.new(
  name: "Panier fleuri",
  description: "",
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


puts "Finished !!"
