-- Configure make to run tsc
vim.bo.makeprg = "tsc --noEmit --incremental $*"
vim.bo.errorformat = "%+A %#%f %#(%l\\,%c): %m,%C%m"
