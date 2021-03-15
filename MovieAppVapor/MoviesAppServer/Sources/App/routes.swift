import Fluent
import Vapor

func routes(_ app: Application) throws {
   
    let moviesController = MoviesController()
    let reviewsController = ReviewsController()
    
    //MARK: - Movies
    app.post("movies", use: moviesController.create)
    
    app.get("movies", use: moviesController.all)
    
    app.delete("movies", ":movieId", use: moviesController.delete)
    
    //MARK: - Reviews
    app.post("reviews", use: reviewsController.create)
    
    app.get("movies", ":movieId", "reviews",use: reviewsController.getByMovieId)
    
}
