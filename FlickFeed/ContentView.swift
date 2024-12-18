//
//  ContentView.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isModalPresented: Bool = false

    // Lista de películas con el modelo Film
    @State private var films = [
        Film(title: "Mean Girls", imageName: "Movie1", bannerImageName: "Movie1", year: "2004", genre: "Comedy", director: "Mark Waters", duration: "1h 37m", synopsis: "A high school girl, Cady Heron, who was homeschooled for most of her life, finds herself thrust into the chaotic and ruthless world of high school when her family moves to the United States. She befriends Janice and Damien, but quickly becomes entangled with the 'Plastics' – a group of popular girls led by the manipulative Regina George. As Cady navigates the treacherous social cliques, she learns that the fight for popularity can come at a high cost, forcing her to rethink her values and her own identity."),
           Film(title: "The Exorcist", imageName: "Movie2", bannerImageName: "Movie2", year: "1973", genre: "Horror", director: "William Friedkin", duration: "2h 2m", synopsis: "In this terrifying tale of demonic possession, a young girl named Regan MacNeil is overtaken by a dark force, leading to a series of disturbing and unexplainable events. Her mother, Chris, desperately seeks help from doctors, but nothing can explain her daughter’s behavior. In the end, she turns to Father Karras, a priest battling his own crisis of faith. Together with Father Merrin, they must perform an exorcism to save Regan’s soul, but the battle between good and evil comes with horrifying consequences."),
           Film(title: "Sick of Myself", imageName: "Movie3", bannerImageName: "Movie3", year: "2024", genre: "Drama", director: "Knut Erik Jensen", duration: "1h 45m", synopsis: "This darkly comedic drama follows the life of Signe, a young artist who becomes consumed by her obsession with self-expression and recognition. In an effort to gain attention and sympathy, Signe develops a disturbing and self-destructive plan to make herself 'sick' going to extreme lengths in an attempt to manipulate the world around her. The film explores the destructive nature of vanity, societal validation, and the lengths people will go to for fame and admiration."),
           Film(title: "Dead Poets Society", imageName: "Movie4", bannerImageName: "Movie4", year: "1989", genre: "Drama", director: "Peter Weir", duration: "2h 8m", synopsis: "At an all-boys preparatory school in the 1950s, a new English teacher named John Keating inspires his students to embrace poetry, critical thinking, and individuality. Through his unconventional teaching methods, he encourages them to 'seize the day' and pursue their own dreams rather than conform to societal expectations. However, his influence is challenged when the conservative school administration and the pressures of family expectations create a tragic conflict, teaching the students profound life lessons."),
           Film(title: "Fight Club", imageName: "Movie5", bannerImageName: "Movie5", year: "1999", genre: "Drama", director: "David Fincher", duration: "2h 19m", synopsis: "The story centers around an unnamed protagonist, an insomniac office worker, who is seeking a way to reclaim his life from the monotony of consumerism. After attending support groups for various ailments, he crosses paths with Tyler Durden, a charismatic soap salesman who introduces him to the anarchic and violent world of fight clubs. As the fight club grows into a larger movement, the protagonist's life spirals into chaos, leading him to confront his own identity, desires, and the destructive nature of toxic masculinity."),
           Film(title: "Scooby Doo", imageName: "Movie6", bannerImageName: "Movie6", year: "2002", genre: "Comedy", director: "Raja Gosnell", duration: "1h 30m", synopsis: "The beloved mystery-solving gang, consisting of Scooby-Doo, Shaggy, Fred, Daphne, and Velma, reunites to solve the mystery of a haunted amusement park, which is plagued by a series of ghostly happenings. The group faces a spooky and seemingly supernatural mystery, but soon discovers that everything is not as it seems. Through their investigation, they uncover a conspiracy involving a villainous plot to take over the park, using their unique talents and bravery to save the day."),
           Film(title: "The Lobster", imageName: "Movie7", bannerImageName: "Movie7", year: "2015", genre: "Drama", director: "Yorgos Lanthimos", duration: "1h 58m", synopsis: "In a dystopian society where being single is illegal, David, a middle-aged man, finds himself at a government-run hotel where single people must find a romantic partner within 45 days or be transformed into an animal of their choice. As David struggles to meet the strict romantic expectations of the hotel, he navigates the complex social rules and bizarre dating rituals. When he escapes into the forest, he encounters a society of loners, each grappling with their own ideas of love, freedom, and conformity."),
           Film(title: "Eternal Sunshine of the Spotless Mind", imageName: "Movie8", bannerImageName: "Movie8", year: "2004", genre: "Romance", director: "Michel Gondry", duration: "1h 48m", synopsis: "After a painful breakup, Joel Barish undergoes a procedure to erase all memories of his ex-girlfriend, Clementine, from his mind. However, as the process unfolds, Joel begins to realize that he doesn't want to forget her and desperately tries to hold onto the fragments of their relationship. The film explores themes of love, loss, and the role that memory plays in shaping our identities, questioning whether erasing painful memories would truly lead to happiness or if it’s through our struggles that we learn to grow."),
           Film(title: "American Beauty", imageName: "Movie9", bannerImageName: "Movie9", year: "1999", genre: "Drama", director: "Sam Mendes", duration: "2h 2m", synopsis: "Lester Burnham is a middle-aged man who, in the midst of a midlife crisis, begins to rebel against his mundane suburban life. Obsessed with his daughter’s best friend, Angela, he quits his job and embarks on a journey of self-liberation. Meanwhile, his wife, Carolyn, is equally disillusioned, obsessed with her appearance and status. As their family begins to unravel, the dark undercurrents of suburban life are revealed, showing how desires, repression, and dissatisfaction shape their fates in tragic and poignant ways."),
           Film(title: "Promising Young Woman", imageName: "Movie10", bannerImageName: "Movie10", year: "2020", genre: "Thriller", director: "Emerald Fennell", duration: "1h 53m", synopsis: "Cassie Thomas, a woman deeply affected by the trauma of her best friend's rape, takes matters into her own hands by targeting men who prey on vulnerable women. Posing as a drunk and defenseless woman, Cassie gets men to reveal their true nature and then exposes them in increasingly clever ways. As she seeks justice for her best friend, she uncovers shocking revelations about her own past and is forced to confront the boundaries between revenge and forgiveness."),
           Film(title: "Shiva Baby", imageName: "Movie11", bannerImageName: "Movie11", year: "2020", genre: "Comedy", director: "Emma Seligman", duration: "1h 17m", synopsis: "Danielle, a college student, attends a Jewish funeral service with her parents, only to find herself trapped in a room filled with awkward encounters and unresolved tensions. To her horror, she runs into her sugar daddy, Max, who is also present at the shiva. As Danielle tries to keep her secret life hidden, the situation becomes increasingly absurd, testing her ability to navigate the complexities of family expectations, her personal relationships, and her own feelings of guilt and shame."),
           Film(title: "Pan's Labyrinth", imageName: "Movie12", bannerImageName: "Movie12", year: "2006", genre: "Fantasy", director: "Guillermo del Toro", duration: "1h 58m", synopsis: "Set against the backdrop of post-Civil War Spain, young Ofelia discovers a hidden labyrinth where a faun presents her with a series of tasks. As she embarks on her journey to prove her worthiness, Ofelia’s fantasies collide with the brutal reality of her world, dominated by her cruel stepfather, a fascist officer. The film is a haunting blend of fairy tale and historical drama, exploring the power of imagination as a form of escape and resistance in a world torn apart by violence and tyranny."),
           Film(title: "Forrest Gump", imageName: "Movie13", bannerImageName: "Movie13", year: "1994", genre: "Drama", director: "Robert Zemeckis", duration: "2h 22m", synopsis: "Forrest Gump, a kind-hearted and simple man with a low IQ, unexpectedly influences some of the most pivotal events in American history, including the Vietnam War, the Watergate scandal, and the creation of the Apple computer. Throughout his life, Forrest maintains an unwavering love for Jenny, his childhood friend and the love of his life, who struggles with her own demons. His story is a testament to perseverance, unconditional love, and the idea that anyone, no matter their background, can make a profound impact on the world."),
           Film(title: "How to Train Your Dragon", imageName: "Movie14", bannerImageName: "Movie14", year: "2010", genre: "Animation", director: "Dean DeBlois, Chris Sanders", duration: "1h 38m", synopsis: "In a Viking village, young Hiccup dreams of proving himself as a dragon slayer. However, after capturing a rare dragon, Toothless, he discovers that dragons are not the terrifying beasts they are made out to be. As Hiccup befriends Toothless, he changes the future of his village, challenging the longstanding animosity between dragons and Vikings. The film is an uplifting story about friendship, understanding, and the courage to defy tradition."),
           Film(title: "Almost Famous", imageName: "Movie15", bannerImageName: "Movie15", year: "2000", genre: "Drama", director: "Cameron Crowe", duration: "2h 2m", synopsis: "In the early 1970s, a young teenage writer, William Miller, lands an assignment to write for Rolling Stone magazine. His assignment? To follow the band Stillwater on their tour and write about the highs and lows of life on the road. As William experiences the chaotic rock-and-roll lifestyle, he grows close to the band's captivating groupie, Penny Lane. The film is a coming-of-age story about love, ambition, and the search for identity during a transformative period in history."),
           Film(title: "Home Alone", imageName: "Movie16", bannerImageName: "Movie16", year: "1990", genre: "Comedy", director: "Chris Columbus", duration: "1h 43m", synopsis: "After his family accidentally leaves him behind while they go on vacation to Paris, 8-year-old Kevin McCallister is forced to fend for himself when two burglars, Harry and Marv, attempt to break into his house. Using his wit and a series of creative and hilarious traps, Kevin manages to defend his home and keep the burglars at bay. This Christmas classic combines heartwarming family moments with comedic action, showing how even the youngest can be heroes in their own right."),
           Film(title: "Suspiria", imageName: "Movie17", bannerImageName: "Movie17", year: "1977", genre: "Horror", director: "Dario Argento", duration: "1h 38m", synopsis: "When a young American ballerina, Susie Bannion, arrives in Germany to study at a prestigious dance academy, she quickly realizes that something sinister is afoot. After witnessing a series of bizarre and deadly occurrences, Susie uncovers dark secrets about the academy's mysterious founders and their links to witchcraft. With a blend of atmospheric horror and unsettling imagery, Suspiria delves into themes of power, fear, and the occult, making it a chilling and unforgettable experience."),
           Film(title: "LadyBird", imageName: "Movie18", bannerImageName: "Movie18", year: "2017", genre: "Drama", director: "Greta Gerwig", duration: "1h 34m", synopsis: "Lady Bird, a headstrong teenager in Sacramento, California, is trying to navigate her senior year of high school while grappling with her complex and strained relationship with her mother. As she seeks independence and tries to escape the confines of her small-town life, Lady Bird faces challenges in her friendships, romantic relationships, and personal growth. The film is a poignant exploration of family dynamics, the tumultuous nature of adolescence, and the pursuit of identity."),
           Film(title: "Gremlins", imageName: "Movie19", bannerImageName: "Movie19", year: "1984", genre: "Comedy", director: "Joe Dante", duration: "1h 46m", synopsis: "Billy Peltzer receives a strange creature called a mogwai as a Christmas gift, with the warning to never feed it after midnight. However, when he accidentally breaks the rules, the mogwai transform into mischievous and destructive gremlins that wreak havoc on the town of Kingston Falls. As the gremlins cause chaos, Billy must figure out a way to stop them before it’s too late. Gremlins is a horror-comedy that blends heart, humor, and a dash of holiday spirit."),
           Film(title: "Her", imageName: "Movie20", bannerImageName: "Movie20", year: "2013", genre: "Romance", director: "Spike Jonze", duration: "2h 6m", synopsis: "Theodore Twombly, a lonely writer, finds solace in a new operating system named Samantha, which he installs on his computer. Samantha is an artificial intelligence capable of evolving and learning. Over time, Theodore develops an emotional and romantic relationship with Samantha, which raises profound questions about human connection, technology, and love in the modern world. Her is a thought-provoking exploration of what it means to be in love in a digital age."),
           Film(title: "Bridget Jones's Diary", imageName: "Movie21", bannerImageName: "Movie21", year: "2001", genre: "Romantic Comedy", director: "Sharon Maguire", duration: "1h 37m", synopsis: "Bridget Jones, a 30-something single woman, begins writing a diary to track her progress in life, love, and self-improvement. As she navigates her chaotic romantic life, she finds herself torn between two men: her charming but arrogant boss, Daniel, and the quiet and introspective Mark Darcy. Filled with awkward moments, romantic misadventures, and plenty of self-deprecating humor, the film is a heartwarming tale about finding love and learning to embrace one's imperfections."),
           Film(title: "León: The Professional", imageName: "Movie22", bannerImageName: "Movie22", year: "1994", genre: "Action", director: "Luc Besson", duration: "1h 50m", synopsis: "Léon, a solitary hitman, lives a quiet life in New York City until he is forced to take in a young girl named Mathilda, whose family is murdered by corrupt DEA agents. As Léon teaches Mathilda the ways of the assassin, the bond between them grows, with Mathilda seeking revenge on the men who killed her family. The film explores themes of innocence, redemption, and the unlikely relationships that can form under extreme circumstances."),
           Film(title: "The Goonies", imageName: "Movie23", bannerImageName: "Movie23", year: "1985", genre: "Adventure", director: "Richard Donner", duration: "1h 54m", synopsis: "A group of kids from a working-class neighborhood band together in search of a legendary pirate treasure hidden by the infamous 'One-Eyed Willy' As they follow a series of clues and face a variety of dangerous obstacles, they are pursued by a criminal family who also seeks the treasure. Filled with adventure, friendship, and comedic moments, The Goonies is a classic tale of youthful courage and teamwork."),
           Film(title: "But I'm A Cheerleader", imageName: "Movie24", bannerImageName: "Movie24", year: "1999", genre: "Comedy", director: "Jamie Babbit", duration: "1h 25m", synopsis: "Megan, a seemingly perfect high school cheerleader, is sent to a conversion therapy camp after her parents discover she may be a lesbian. At the camp, she meets a diverse group of kids who are similarly undergoing 'treatment' to 'cure' their sexuality. As she bonds with her fellow campers, Megan begins to question the validity of the camp's methods and the pressures to conform, all while discovering her true self and falling in love with a fellow camper."),
           Film(title: "Romeo + Juliet", imageName: "Movie25", bannerImageName: "Movie25", year: "1996", genre: "Romance", director: "Baz Luhrmann", duration: "2h", synopsis: "A modernized version of Shakespeare's tragic love story, Romeo + Juliet is set in a contemporary world where the feuding families, the Montagues and the Capulets, are wealthy, powerful corporations. Romeo Montague falls deeply in love with Juliet Capulet, and despite their families’ hatred for each other, the two desperately try to navigate their forbidden love. Their story plays out in a vibrant, fast-paced world where love, violence, and fate collide in a tragic conclusion."),
           Film(title: "Closer", imageName: "Movie26", bannerImageName: "Movie26", year: "2004", genre: "Drama", director: "Mike Nichols", duration: "1h 44m", synopsis: "The film follows the intricate lives of four people entangled in a web of love, betrayal, and sexual desire. Anna, a photographer, is pursued by two men, Larry and Dan, both of whom are in relationships with other women. As their lives intersect and unravel, each character confronts their personal insecurities, mistakes, and desires, revealing the complexities of human relationships and the consequences of infidelity."),
           Film(title: "Challengers", imageName: "Movie27", bannerImageName: "Movie27", year: "2024", genre: "Sports Drama", director: "Luca Guadagnino", duration: "2h", synopsis: "This sports drama tells the story of a professional sports team that faces tremendous challenges both on and off the field. As the team struggles to perform under pressure, the members must confront their personal issues, from family struggles to past trauma, and learn to work together as a cohesive unit. The film highlights themes of teamwork, perseverance, and the pursuit of greatness, as the characters overcome obstacles to achieve success."),
           Film(title: "Call Me By Your Name", imageName: "Movie28", bannerImageName: "Movie28", year: "2017", genre: "Romance", director: "Luca Guadagnino", duration: "2h 12m", synopsis: "A beautiful coming-of-age romance set in the Italian countryside during the summer of 1983, the film follows 17-year-old Elio as he develops a passionate love affair with Oliver, an older graduate student staying with his family for the summer. Through their intense and complicated relationship, Elio discovers his sexual identity and the painful reality of love and loss, creating an unforgettable story of yearning, desire, and the fleeting nature of first love."),
           Film(title: "Paris, Texas", imageName: "Movie29", bannerImageName: "Movie29", year: "1984", genre: "Drama", director: "Wim Wenders", duration: "2h 25m", synopsis: "A man named Travis, who has been missing for four years, is found wandering the Texas desert. Reuniting with his young son, Hunter, Travis sets out to find his estranged wife, Jane, who has disappeared into the vastness of America. The film is a deeply emotional exploration of isolation, regret, and the quest for redemption, as Travis and Hunter try to reconcile their fractured lives and uncover the truth about the past."),
           Film(title: "Beautiful Boy", imageName: "Movie30", bannerImageName: "Movie30", year: "2018", genre: "Drama", director: "Felix van Groeningen", duration: "2h", synopsis: "Based on the true story of father and son, Beautiful Boy chronicles the devastating impact of addiction on their relationship. David Sheff watches as his son, Nic, falls deeper into the grips of drug addiction. Despite the heartbreak, David continues to support and love his son, never giving up hope. The film is a powerful, poignant reflection on the cycle of addiction, the bonds of family, and the strength of love through the most difficult of times.")
       ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Sección 1: Popular this week
                    Text("Popular this week")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(films.prefix(10)) { film in
                                NavigationLink(destination: MovieDetailView3(film: film)) {
                                    VStack {
                                        Image(film.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 140, height: 190)
                                            .cornerRadius(10)

                                        Text(film.title)
                                            .font(.footnote)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Sección 2: New from friends
                    Text("New from friends")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(films[10..<20]) { film in
                                NavigationLink(destination: MovieDetailView3(film: film)) {
                                    VStack {
                                        Image(film.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 140, height: 190)
                                            .cornerRadius(10)

                                        Text(film.title)
                                            .font(.footnote)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Sección 3: Popular with friends
                    Text("Popular with friends")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(films[20..<30]) { film in
                                NavigationLink(destination: MovieDetailView3(film: film)) {
                                    VStack {
                                        Image(film.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 140, height: 190)
                                            .cornerRadius(10)

                                        Text(film.title)
                                            .font(.subheadline)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isModalPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .padding()
                    }
                    .sheet(isPresented: $isModalPresented) {
                        LogoToFilmModalView(films: $films)
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}


#Preview {
    HomeView()
}






