using my.bookshop as my from '../db/schema';
@mcp
service CatalogMcpService {
    @(restrict: [
        { grant: 'READ',                         to: 'authenticated-user' },
        { grant: ['CREATE', 'UPDATE', 'DELETE'], to: 'book-manage' }
    ])
    entity Books as projection on my.Books;
}