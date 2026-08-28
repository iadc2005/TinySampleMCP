using CatalogService from './cat-service';

annotate CatalogService.Books with @(
    UI: {
        HeaderInfo: {
            TypeName      : 'Book',
            TypeNamePlural: 'Books',
            Title         : { Value: title },
            Description   : { Value: author }
        },
        SelectionFields: [ title, author ],
        LineItem       : [
            { Value: ID,     Label: 'ID' },
            { Value: title,  Label: 'Title' },
            { Value: author, Label: 'Author' },
            { Value: stock,  Label: 'Stock' }
        ],
        Facets         : [
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'GeneralInfo',
                Label : 'General Information',
                Target: '@UI.FieldGroup#General'
            }
        ],
        FieldGroup #General: {
            Data: [
                { Value: ID,     Label: 'ID' },
                { Value: title,  Label: 'Title' },
                { Value: author, Label: 'Author' },
                { Value: stock,  Label: 'Stock' }
            ]
        }
    }
);
