using my.bookshop as my from '../db/schema';
@mcp
service CatalogMcpService {
    @(restrict: [
        { grant: 'READ',                         to: 'authenticated-user' },
        { grant: ['CREATE', 'UPDATE', 'DELETE'], to: 'book-manage' }
    ])
    entity Books as projection on my.Books;

    // @cap-js/mcp only exposes entities as read-only (query/describe) tools.
    // Write operations must be exposed as (unbound) actions so the MCP client
    // (e.g. SAP Joule) can invoke them as callable tools.
    @(requires: 'book-manage')
    @mcp.description: 'Create a new book in the catalog. Returns the created book including its generated ID.'
    action createBook(
        title  : String,
        author : String,
        stock  : Integer
    ) returns Books;
}