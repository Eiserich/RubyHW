# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.create([
                  {
                    title: "EPL"
                  },
                  {
                    title: "Seria A"
                  },
                  {
                    title: "Bundesliga"
                  },

                ])

Product.create([
                 {
                   name: "Arsenal",
                   description: "Arsenal is a professional football club based in Islington, London, England. Arsenal plays in the Premier League, the top flight of English football. The club has won 13 league titles (including one unbeaten title), a record 14 FA Cups, two League Cups, 16 FA Community Shields, one European Cup Winners' Cup, and one Inter-Cities Fairs Cup. In terms of trophies won, it is the third-most successful club in English football.",
                   price: 150000000,
                   image: "https://pro-football.com.ua/content/images/41/390x390l80mc0/77403063720940.webp",
                   category_id: 1
                 },
                 {
                   name: "Leeds United",
                   description: "Leeds United Football Club is a professional football club based in Leeds, West Yorkshire in England. The club competes in the Premier League, the highest level of the English football league system, and plays its home matches at Elland Road. Leeds United have won the League Championship three times, four Second Division titles, the FA Cup once, the EFL Cup once, the Charity Shield twice and the Inter-Cities Fairs Cup twice. The club had their most successful period under the management of Don Revie in the 1960s and 1970s, when they won the League title twice, the FA Cup once, the League Cup once and the Inter-Cities Fairs Cup twice. The club have also been runners-up five times in the League Championship, three times in the FA Cup, once each in the EFL Cup, the Charity Shield, the Inter-Cities Fairs Cup, the Cup Winners' Cup and the European Cup, and lost the play-off to keep the Inter-City Fairs Cup trophy.",
                   price: 650000000,
                   image: "https://shop.leedsunited.com/media/catalog/product/g/t/gt7059-white-f.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=520&width=520&canvas=520:520",
                   category_id: 1
                 },
                 {
                   name: "A.S. Roma",
                   description: "Roma is a professional football club based in Rome, Italy. Founded by a merger in 1927, Roma has participated in the top tier of Italian football for all of its existence, except for the 1951–52 season. Roma has won Serie A three times, in 1941–42, 1982–83 and 2000–01, as well as nine Coppa Italia titles and two Supercoppa Italiana titles. In European competitions, Roma won the UEFA Europa Conference League in 2021–22, the Inter-Cities Fairs Cup in 1960–61 and was runner-up in the 1983–84 European Cup and the 1990–91 UEFA Cup.",
                   price: 500000000,
                   image: "https://pro-football.com.ua/content/images/44/240x240l85nn0/32443435787441.webp",
                   category_id: 2
                 },
                 {
                   name: "Inter",
                   description: "Founded in 1908 following a schism within the Milan Cricket and Football Club (now AC Milan), Inter won its first championship in 1910. Since its formation, the club has won 34 domestic trophies, including 19 league titles, 8 Coppa Italia and 7 Supercoppa Italiana. From 2006 to 2010, the club won five successive league titles, equalling the all-time record at that time. They have won the Champions League three times: two back-to-back in 1964 and 1965 and then another in 2010. Their latest win completed an unprecedented Italian seasonal treble, with Inter winning the Coppa Italia and the Scudetto the same year.The club has also won three UEFA Cups, two Intercontinental Cups and one FIFA Club World Cup.",
                   price: 760,
                   image: "https://pro-football.com.ua/content/images/10/240x240l85nn0/66385519124511.webp",
                   category_id: 2
                 },
                 {
                   name: "Bayern",
                   description: "Squad cost:",
                   price: 900,
                   image: "https://pro-football.com.ua/content/images/10/240x240l85nn0/50067543661104.webp",
                   category_id: 3
                 },
                 {
                   name: "Dortmund",
                   description: "des",
                   price: 850,
                   image: "https://pro-football.com.ua/content/images/10/240x240l85nn0/82939259191099.webp",
                   category_id: 3
                 }
               ])

User.create!(email: 'user@ukr.com', password: 'password', password_confirmation: 'password')
AdminUser.create!(email: 'admin@ukr.com', password: 'password', password_confirmation: 'password') if Rails.env.development?