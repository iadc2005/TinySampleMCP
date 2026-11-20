using my.bookshop as my from '../db/schema';

service CatalogService {
    @(restrict: [
        { grant: 'READ',                         to: 'authenticated-user' },
        { grant: ['CREATE', 'UPDATE', 'DELETE'], to: 'book-manage' }
    ])
    @(Capabilities: {
        InsertRestrictions.Insertable: isManager,
        UpdateRestrictions.Updatable : isManager,
        DeleteRestrictions.Deletable : isManager
    })
    entity Books as projection on my.Books {
        *,
        virtual null as isManager : Boolean @Core.Computed
    };
}