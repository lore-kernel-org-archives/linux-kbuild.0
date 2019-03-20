Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:52182 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726006AbfCTTIH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Mar 2019 15:08:07 -0400
Date: Wed, 20 Mar 2019 20:08:05 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH v2 2/8] kbuild: Support for Symbols.list creation
In-Reply-To: <20190318191926.GA23138@redhat.com>
Message-ID: <alpine.LSU.2.21.1903202000470.29796@pobox.suse.cz>
References: <20190301141313.15057-1-jmoreira@suse.de> <20190301141313.15057-3-jmoreira@suse.de> <20190318191926.GA23138@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Joao Moreira <jmoreira@suse.de>, live-patching@vger.kernel.org, pmladek@suse.cz, jikos@suse.cz, nstange@suse.de, jpoimboe@redhat.com, khlebnikov@yandex-team.ru, jeyu@kernel.org, matz@suse.de, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, michal.lkml@markovi.net

> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index fd03d60f6c5a..1e28ad21314c 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -247,6 +247,11 @@ cmd_gen_ksymdeps = \
> >  	$(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd
> >  endif
> >  
> > +ifdef CONFIG_LIVEPATCH
> > +cmd_livepatch = $(if $(LIVEPATCH_$(basetarget).o),			\
> > +	$(shell touch $(MODVERDIR)/$(basetarget).livepatch))
> > +endif
> > +
> >  define rule_cc_o_c
> >  	$(call cmd,checksrc)
> >  	$(call cmd_and_fixdep,cc_o_c)
> > @@ -283,6 +288,7 @@ $(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) F
> >  	$(call if_changed_rule,cc_o_c)
> >  	@{ echo $(@:.o=.ko); echo $@; \
> >  	   $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=.mod)
> > +	$(call cmd_livepatch)
> >  
> >  quiet_cmd_cc_lst_c = MKLST   $@
> >        cmd_cc_lst_c = $(CC) $(c_flags) -g -c -o $*.o $< && \
> 
> Since cmd_livepatch is only called for single-used-m, does this mean
> that we can only klp-convert single object file livepatch modules?
> 
> I stumbled upon this when trying to create a self-test module that
> incorporated two object files.  I tried adding a $(call cmd_livepatch)
> in the recipe for $(obj)/%.o, but that didn't help.  My kbuild foo
> wasn't good enough to figure this one out.

I looked at my original code and it is a bit different there. I placed it 
under rule_cc_o_c right after objtool command. If I remember correctly 
this is the correct recipe for .c->.o. Unfortunately I forgot the details 
and there is of course nothing about it in my notes.

Does it help?

Joao, is there a reason you moved it elsewhere?

Miroslav
