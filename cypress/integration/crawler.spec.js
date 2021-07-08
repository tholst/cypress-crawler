const _ = require('lodash')
const moment = require('moment');

describe('Crawler', () => {
    it("crawls", () => {
        // cy.visit('https://www.amazon.de/s?i=videogames&bbn=20904942031&rh=n%3A20904942031%2Cp_89%3ASony+Interactive+Entertainment&dc&brr=1&qid=1625596777&rd=1&rnid=669059031')

        cy.visit('https://www.amazon.de/b/?_encoding=UTF8&node=20904942031&bbn=300992&ref_=Oct_odnav_d_20904927031_0&pd_rd_w=HbwCC&pf_rd_p=8d24ed59-4026-458b-bc11-b86092e03d52&pf_rd_r=0PEX0WDZD325ZQZV0V73&pd_rd_r=bc5d68e7-368f-40ab-b45f-cdf248f05c70&pd_rd_wg=pD13P')

        cy.get('[id="p_89/Sony Interactive Entertainment"]')
            // contains('.a-size-base', 'Sony Interactive Entertainment')
            .click()

        cy.get('[data-index="0"]')
            .contains("Derzeit nicht verfügbar.")
                
        cy.get('[data-index="1"]')
            .contains("Derzeit nicht verfügbar.")
                
        cy.get('[data-index="2"]')
            .contains("Derzeit nicht verfügbar.")

        cy.get('[data-index="0"]')
            .contains("PlayStation 5")
            .click()
        //
        // cy.get('#demo')
        //     .children()
        //     .chunk(2)
        //     .map(function(components) {
        //         return {
        //             date: components[0].textContent,
        //             table: Cypress.$(components[1])
        //         }
        //     })
        //     .flatMap(function(c) {
        //       let th        = c.table.find('th')
        //       let tbody     = c.table.find('tbody')
        //       let tableKeys = _.map(th, function (th) {
        //           return th.textContent
        //       })
        //       let tableRows = _.map(tbody, function (tbody) {
        //           return _.fromPairs(_.zip(tableKeys, Cypress.$(tbody).find('td')))
        //       })
        //       let finalRows = _.map(tableRows, function (tableRow) {
        //           return _.reduce(tableRow, (hash, td, key) => {
        //               switch (key) {
        //                   case 'Info':
        //                     let onclick = Cypress.$(td).find('a').attr('onclick')

        //                     if (!_.isUndefined(onclick)) {
        //                         onclick = onclick.replace(/alert\(\'/, "").replace(/\'\).*/, "")
        //                     }

        //                     hash[key] = onclick

        //                     break;
        //                   case 'Email':
        //                     hash[key] = Cypress.$(td).find('a').attr('href').replace(/mailto\:/, "")
        //                     break;
        //                   case 'Link':
        //                     hash[key] = Cypress.$(td).find('a').attr('href')
        //                     break;
        //                   default:
        //                     hash[key] = td.textContent
        //               }
        //               return hash
        //           }, {})
        //       })

        //       _.each(finalRows, (row) => { row['Date'] = c.date })

        //       return finalRows
        //     })
        //     .map((day) => {
        //         debugger
        //         let d = moment(`${day.Date} ${day.Time} -5:00`, "DDDD MM/DD/YYYY hh:mma ZZ")
        //     })
    })
})