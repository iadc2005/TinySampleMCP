const cds = require('@sap/cds')

module.exports = class CatalogService extends cds.ApplicationService {
  init() {
    const { Books } = this.entities

    // Populate the transient `isManager` flag on every read so that Fiori
    // Elements can show/hide the Create/Edit/Delete buttons based on whether
    // the current user has the `book-manage` role. The flag is a virtual
    // field (not persisted) and is also referenced by the @Capabilities
    // restrictions annotated on the Books entity.
    this.after('READ', Books, (data, req) => {
      const canManage = req.user.is('book-manage')
      for (const row of Array.isArray(data) ? data : [data]) {
        if (row) row.isManager = canManage
      }
    })

    return super.init()
  }
}
