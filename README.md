# Union Shop Flutter App

---

## Recent Updates

- December 2025: Full codebase scan and clean-up completed
- Removed deprecated code and duplication
- Applied automated formatting and fixes to all Dart files
- Refactored for clarity and maintainability

---

A cross-platform shop app for the University of Portsmouth Students’ Union.  
Browse official merchandise, view collections, and explore products in a modern, responsive interface.

---

## Table of Contents

- [Features](#features)
- [Planned Features](#planned-features)
- [Installation & Setup](#installation--setup)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Navigation](#navigation)
- [Cart Functionality](#cart-functionality)
- [Data Management](#data-management)
- [Technologies Used](#technologies-used)
- [Known Issues / Limitations](#known-issues--limitations)
- [Future Improvements](#future-improvements)
- [Contribution Guidelines](#contribution-guidelines)
- [Contact](#contact)

---

## Features

- Responsive design for desktop and mobile
- Reusable header, navigation bar (collapsible on mobile), and footer
- Static homepage with featured products and navigation buttons
- About Us page with university and shop info
- Collections page with dynamic navigation to all product categories
- Single collection and single product pages with back navigation
- Shopping cart with quantity selection, validation, and editing
- Cart page with order placement (no payment required)
- Persistent navigation via buttons, navbars, and URLs
- Footer with dummy links and contact info
- Mobile-friendly menu with all navigation options, including cart

---

## Planned Features

- Sale collection page
- Authentication UI (login/signup screens — no backend needed)
- Print Shack page
- Full authentication system
- Account dashboard
- Cart management improvements (badges, persistence)
- Search and filter system
- Product reviews and ratings
- Stock status and sale price display

---

## Installation & Setup

### Prerequisites

- Windows, macOS, or Linux
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Git](https://git-scm.com/)
- An IDE (VS Code recommended)

### Clone the Repository

```bash
git clone https://github.com/jaketh444/union_shop.git
cd union_shop
```

### Run the Project

```bash
flutter pub get
flutter run
```

---

## Usage

- Browse the homepage for featured products and quick navigation.
- Use the navigation bar or mobile menu to access About, Collections, and Cart.
- Click "Browse Products" or "View All Products" to see all collections.
- Select a collection to view its products.
- Click a product to view details, select size/color, and add to cart.
- Edit cart items, adjust quantity, and place orders.
- Use back buttons to return to previous pages.
- The layout adapts for mobile and desktop screens.

---

## Project Structure

```
lib/
  main.dart                    # App entry point and homepage
  about_page.dart              # About Us page
  product_page.dart            # Product details page
  collections_page.dart        # Collections page
  single_collection_page.dart  # Single collection page
  single_product_page.dart     # Single product page
  cart_page.dart               # Shopping cart page
  models/
    nav_bar.dart               # Responsive navigation bar widget
    header.dart                # Reusable header widget
    footer.dart                # Reusable footer widget
    cart_item.dart             # Cart item model
    collection.dart            # Collection model
    product.dart               # Product model
  data/
    product_list.dart          # Product data
    collection_list.dart       # Collection data
assets/
  # Images and static files
checklist.md                   # Coursework checklist
README.md                      # Project documentation
```

---

## Navigation

- **Navbar:** Persistent at the top, collapses to a menu on mobile. Includes links to Home, Collections, About, Auth, and Cart.
- **Footer:** Contains links to About, Auth, and dummy contact info.
- **Buttons:** "Browse Products" and "View All Products" on homepage, back buttons on product and collection pages.
- **Routing:** Uses named routes for all main pages (`/`, `/about`, `/collections`, `/cart`, etc.).
- **Mobile Menu:** All navigation options, including Cart, are available in the dropdown.

---

## Cart Functionality

- Add products to cart with selected size, color, and quantity.
- Edit cart items directly (change size, color, quantity).
- Remove items from cart.
- Cart page displays all items, subtotals, and total price.
- "Place Order" button clears the cart and shows confirmation (no payment).
- Validation ensures size and color are selected before adding to cart.
- Planned: Cart persistence across app restarts.

---

## Data Management

- Product and collection data stored in `lib/data/` as static lists.
- Models for products, collections, and cart items in `lib/models/`.
- Easy to extend with new products or collections.
- Planned: Dynamic data loading and backend integration.

---

## Technologies Used

- Flutter
- Dart
- VS Code

---

## Known Issues / Limitations

- Product and collection data is static (no backend integration yet)
- Some pages and features are placeholders
- Cart persistence is planned but not yet implemented
- Accessibility improvements ongoing
- No payment integration (orders are simulated)

---

## Future Improvements

- Complete all checklist features (see `checklist.md`)
- Dynamic product and collection pages
- Shopping cart persistence
- User authentication
- Search and filter features
- Product reviews and ratings
- Stock status and sale price display
- More pages and features as per coursework checklist

---

## Contribution Guidelines

- Commit regularly with small, meaningful messages
- Keep code clean and organized
- Follow project structure and naming conventions
- Document new features in the README

---

## Contact

Created by [Jake Friend]  
Email: jakefriend3012@gmail.com  
GitHub: [Jaketh444](https://github.com/jaketh444)

---

_This README will be updated as new features are added._