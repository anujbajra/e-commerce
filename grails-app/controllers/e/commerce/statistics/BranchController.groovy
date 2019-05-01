package e.commerce.statistics

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_USER')
class BranchController {

    static scaffold = Branch
}
