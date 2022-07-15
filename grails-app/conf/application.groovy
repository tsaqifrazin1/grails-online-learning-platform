

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.intern.olp.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.intern.olp.UserRole'
grails.plugin.springsecurity.authority.className = 'com.intern.olp.Role'
grails.plugin.springsecurity.userLookup.usernamePropertyName='email'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/dbconsole/**',	 access: ['permitAll']],
	[pattern: '/user/create',    access: ['permitAll']],
	[pattern: '/user/save',    access: ['permitAll']],
	[pattern: '/user/delete/**',    access: ['permitAll']],
	[pattern: '/dashboard/**',        access: ['permitAll']],
	[pattern: '/register',          access: ['permitAll']],

]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

grails.plugin.springsecurity.logout.postOnly = false


