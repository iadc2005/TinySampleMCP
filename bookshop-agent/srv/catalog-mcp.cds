using my.bookshop as my from '../db/schema';
@mcp
service CatalogMcpService {
    @readonly entity Books as projection on my.Books;
}