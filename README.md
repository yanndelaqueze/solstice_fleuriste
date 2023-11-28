# Solstice Fleuriste

Solstice is a flower shop located in Petite Île, south of Reunion Island (France) in the Pacific Ocean. 
Solstice specializes in creating bouquets for all occasions. The arrangements are crafted based on the seasons, available stock, using high-quality and fresh flowers.
Solstice also offers potted plants, orchids, dried flowers, and special arrangements (by quote) to adorn various events (weddings, funerals, baptisms, receptions...).


www.solstice-fleuriste.fr

## Site Features :

Solstice Fleuriste e-Commerce website allows users to browse Solstice Fleuriste catalog creations, order flower bouquets by customizing them (setting budget, occasion, message, adding options) or other non-customizable products (potted plants, orchids...)
Solstice offers delivery options when geographically eligible or click&collect. 

### As a Visitor I can : 

- Place an order without logging in / signing up (no constraint)
- Create an account if I want to (and if I want to be able to retrieve past orders) 
- Check if my address is eligible for delivery
- Choose a product and set my budget + customize it (when relevant, mostly for bouquets)
- Define if I want delivery (if eligible) or Click & Collect
- Receive an email when an order is confirmed and when it is ready for collection
- Contact the shop for custom creations / quotes
- Check my past orders and their status (if I placed orders while not signed in, all those orders will be later attached to my account when it is created, by email matching)

### As Site administrator I can : 

- Create new Categories (name, position, display true/false) and Products (add photos, set minimum price, display order, display true/false) 
- Open / Close my eShop (i.e. make the order confirmation impossible when the shop is closed/on annual leave, while allowing users to browse products) 
- Manage my orders, update their infos and their status (paid, under preparation, ready for collection/delivery, collected/delivered, cancelled, refunded)
- Edit the delivery area (by drawing a Mapbox polygon on map)

## Tech Stack :
- HTML/CSS (with a -very- litte bit of Bootstrap)
- Ruby on Rails
- JS (Stimulus controllers)
- DB : PostgreSQL / Active Record / Active Storage (cloudinary service)
- Gems & Services used : Mapbox (geocoding), Devise (authentication), Stripe (payment), FriendlyID (urls)
