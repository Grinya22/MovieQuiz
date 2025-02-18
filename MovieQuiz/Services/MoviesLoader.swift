//
//  MoviesLoader.swift
//  MovieQuiz
//
//  Created by Gregory Vanyurin on 17.02.2025.
//

import Foundation

protocol MoviesLoading {
    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void)
}

struct MoviesLoader: MoviesLoading {
    // MARK: - NetworkClient
    private let networkClient = NetworkClient()

    // MARK: - URL
    private var mostPopularMoviesUrl: URL {
        // Если мы не смогли преобразовать строку в URL, то приложение упадёт с ошибкой
        guard let url = URL(string: "https://tv-api.com/en/API/MostPopularTVs/k_zcuw1ytf") else {
            preconditionFailure("Unable to construct mostPopularMoviesUrl")
        }
        return url
    }

    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void) {
        networkClient.fetch(url: mostPopularMoviesUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let mostPopularMovies = try JSONDecoder().decode(MostPopularMovies.self, from: data)
                    handler(.success(mostPopularMovies))
                } catch {
                    handler(.failure(error))
                }

            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}

//struct MoviesLoader: MoviesLoading {
//    private let networkClient = NetworkClient()
//
//    // Временно используем локальные данные
//    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void) {
//        // Создаем тестовые данные
//        let testMovies = [
//            MostPopularMovie(
//                title: "The Shawshank Redemption",
//                rating: "9.3",
//                imageURL: URL(string: "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,3,128,176_AL_.jpg")!
//            ),
//            MostPopularMovie(
//                title: "The Godfather",
//                rating: "9.2",
//                imageURL: URL(string: "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX128_CR0,1,128,176_AL_.jpg")!
//            ),
//            MostPopularMovie(
//                title: "The Dark Knight",
//                rating: "9.0",
//                imageURL: URL(string: "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_UX128_CR0,3,128,176_AL_.jpg")!
//            )
//        ]
//
//        let mockData = MostPopularMovies(errorMessage: "", items: testMovies)
//        handler(.success(mockData))
//    }
//}


