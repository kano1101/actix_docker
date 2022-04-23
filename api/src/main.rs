use actix_web::{get, web, App, HttpResponse, HttpServer, Responder};

#[get("/hello/{name}")]
async fn greet(name: web::Path<String>) -> impl Responder {
    format!("Hello {name}!")
}
#[get("/")]
async fn get() -> impl Responder {
    HttpResponse::Ok().body("get ok")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/hello", web::get().to(|| async { "Hello World!!" }))
            .service(greet)
            .service(get)
    })
    .bind("0.0.0.0:8086")?
    .run()
    .await
}
