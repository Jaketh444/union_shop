# Union Shop Flutter App

A cross-platform shop app for the University of Portsmouth Students’ Union.  
Browse official merchandise, view collections, and explore products in a modern, responsive interface.

---

## Features

- Responsive design for desktop and mobile
- Reusable header, navigation bar (collapsible on mobile), and footer
- Static homepage with featured products
- About Us page
- Dummy collections page
- Footer with dummy links

> **Planned Features:**  
> - Dummy collection page (products in one collection)  
> - Dummy product page (details; dropdowns don't need to function)  
> - Sale collection page  
> - Authentication UI (login/signup screens — no backend needed)  
> - Dynamic collections and product pages  
> - Shopping cart  
> - Print Shack page  
> - Full navigation and URL routing  
> - Full authentication system  
> - Account dashboard  
> - Cart management  
> - Search system

---

## Installation & Setup

### Prerequisites

- Windows, macOS, or Linux
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Git](https://git-scm.com/)
- An IDE (VS Code recommended)

### Clone the Repository

```bash
git clone https://github.com/yourusername/union_shop.git
cd union_shop
```

### Run the Project

```bash
flutter pub get
flutter run
```

---

## Usage

- Browse the homepage for featured products.
- Use the navigation bar to access the About page and collections.
- The layout adapts for mobile and desktop screens.

---

## Project Structure

```
lib/
  main.dart            # App entry point and homepage
  about_page.dart      # About Us page
  product_page.dart    # Product details page
  collections_page.dart # Dummy collections page
  models/
    nav_bar.dart       # Reusable navigation bar widget
    header.dart        # Reusable header widget
    footer.dart        # Reusable footer widget
assets/
  # Placeholder for future images and static files
```

---

## Technologies Used

- Flutter
- Dart
- VS Code

---

## Known Issues / Limitations

- Product and collection data is static (no backend integration yet)
- Some pages and features are placeholders
- Accessibility improvements ongoing

---

## Future Improvements

- Complete all checklist features (see `checklist.md`)
- Dynamic product and collection pages
- Shopping cart and checkout
- User authentication
- Search and filter features
- More pages and features as per coursework checklist

---

## Contribution Guidelines

- Commit regularly with small, meaningful messages
- Keep code clean and organized
- Follow project structure and naming conventions

---

## Contact

Created by [Jake Friend]  
Email: jakefriend3012@gmail.com  
GitHub: [Jaketh444](https://github.com/jaketh444)

---

_This README will be updated as new features are added._