Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60458 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728679AbeIFRm6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Sep 2018 13:42:58 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w86D7PTj008928
        for <linux-kbuild@vger.kernel.org>; Thu, 6 Sep 2018 09:07:32 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2mb4udg04u-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Sep 2018 09:07:31 -0400
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <gor@linux.ibm.com>;
        Thu, 6 Sep 2018 14:07:29 +0100
Date: Thu, 6 Sep 2018 15:07:24 +0200
From: Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [RFC 1/2] tracing/Makefile: fix handling redefinition of
 CC_FLAGS_FTRACE
References: <20180905223600.20994-1-paulo.r.zanoni@intel.com>
 <20180905221059.73663a6e@vmware.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180905221059.73663a6e@vmware.local.home>
Message-Id: <your-ad-here.call-01536239243-ext-9397@work.hours>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Ingo Molnar <mingo@redhat.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>

On Wed, Sep 05, 2018 at 10:10:59PM -0400, Steven Rostedt wrote:
> On Wed,  5 Sep 2018 15:35:59 -0700
> Paulo Zanoni <paulo.r.zanoni@intel.com> wrote:
> 
> > As a Kernel developer, I make heavy use of "make targz-pkg" in order
> > to locally compile and remotely install my development Kernels. The
> > nice feature I rely on is that after a normal "make", "make targz-pkg"
> > only generates the tarball without having to recompile everything.
> > 
> > That was true until commit f28bc3c32c05 ("tracing: Handle
> > CC_FLAGS_FTRACE more accurately"). After it, running "make targz-pkg"
> > after "make" will recompile the whole Kernel tree, making my
> > development workflow much slower.
> > 
> > The Kernel is choosing to recompile everything because it claims the
> > command line has changed. A diff of the .cmd files show a repeated
> > -mfentry in one of the files. It seems that something on make
> > targz-pkg triggers the double -mfentry but not the double -pg.
> 
> It's probably because the addition of -mfentry isn't protected behind a
> ifndef block (like you added in this patch).

scripts/package/Makefile:
tar%pkg: FORCE
჻·······$(MAKE) KBUILD_SRC=
჻·······$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@

scripts/package/buildtar:
if grep -q '^CONFIG_MODULES=y' "${KCONFIG_CONFIG}"; then
჻·······make ARCH="${ARCH}" O="${objtree}" KBUILD_SRC= INSTALL_MOD_PATH="${tmpdir}" modules_install

"make targz-pkg" target calls "make modules_install" and environment is
already populated with exported variables, CC_FLAGS_FTRACE being one
of them. In other words top Makefile is called recursively in
sub-make. I assume, to make it work in general exported variables should be
always recalculated to avoid side effects.

In this particular case:
ifndef CC_FLAGS_FTRACE
CC_FLAGS_FTRACE := -pg
endif
is bad, because we don't know if CC_FLAGS_FTRACE is defined in platform
specific arch/$(SRCARCH)/Makefile (included earlier), or coming from parent
make process as exported variable.

In my view one simple way to fix this particular case would be to move:
ifdef CONFIG_FUNCTION_TRACER
        CC_FLAGS_FTRACE := -pg
endif
before:
include arch/$(SRCARCH)/Makefile
where platforms set custom CC_FLAGS_FTRACE.

Or alternatively change the name of the variable that platforms have to set in
arch/$(SRCARCH)/Makefile (so that it does not conflict with exported variable).

> > 
> > So this patch attempts to deal with that problem by handling -mfentry
> > and others just like we handle -pg: don't append them if
> > CC_FLAGS_FTRACE is already defined. I'm not a Makefile expert and so I
> > can't claim this won't break anything else, hopefully if this patch
> > gets applied it will have a Reviewed-by tag from some actual Makefile
> > expert. I can claim this patch fixes the specific regression I
> > reported.
> > 
> > Fixes: commit f28bc3c32c05 ("tracing: Handle CC_FLAGS_FTRACE more
> >  accurately")
> > Cc: Vasily Gorbik <gor@linux.ibm.com>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Cc: Steven Rostedt (VMware) <rostedt@goodmis.org>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: linux-kbuild@vger.kernel.org
> > Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > ---
> >  Makefile | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 19948e556941..2c8df481b4f1 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -755,28 +755,30 @@ KBUILD_CFLAGS 	+= $(call cc-option, -femit-struct-debug-baseonly) \
> >  endif
> >  
> >  ifdef CONFIG_FUNCTION_TRACER
> > -ifndef CC_FLAGS_FTRACE
> > -CC_FLAGS_FTRACE := -pg
> > -endif
> > +cc_flags_ftrace_ := -pg
> 
> I have no problem with this patch, but why the extra underscore at the
> end of cc_flags_ftrace_, and not just cc_flags_ftrace?
> 
> -- Steve
> 
> >  ifdef CONFIG_FTRACE_MCOUNT_RECORD
> >    # gcc 5 supports generating the mcount tables directly
> >    ifeq ($(call cc-option-yn,-mrecord-mcount),y)
> > -    CC_FLAGS_FTRACE	+= -mrecord-mcount
> > +    cc_flags_ftrace_	+= -mrecord-mcount
> >      export CC_USING_RECORD_MCOUNT := 1
> >    endif
> >    ifdef CONFIG_HAVE_NOP_MCOUNT
> >      ifeq ($(call cc-option-yn, -mnop-mcount),y)
> > -      CC_FLAGS_FTRACE	+= -mnop-mcount
> > +      cc_flags_ftrace_	+= -mnop-mcount
> >        CC_FLAGS_USING	+= -DCC_USING_NOP_MCOUNT
> >      endif
> >    endif
> >  endif
> >  ifdef CONFIG_HAVE_FENTRY
> >    ifeq ($(call cc-option-yn, -mfentry),y)
> > -    CC_FLAGS_FTRACE	+= -mfentry
> > +    cc_flags_ftrace_	+= -mfentry
> >      CC_FLAGS_USING	+= -DCC_USING_FENTRY
> >    endif
> >  endif
> > +
> > +ifndef CC_FLAGS_FTRACE
> > +  CC_FLAGS_FTRACE := $(cc_flags_ftrace_)
> > +endif

Unfortunately this changes logic and inconsistent. With that change
platforms which define CC_FLAGS_FTRACE in arch/$(SRCARCH)/Makefile
would end up without extra -mrecord-mcount, -mnop-mcount and -mfentry
build flags, while CC_FLAGS_USING would be populated and
CC_USING_RECORD_MCOUNT set.

> >  export CC_FLAGS_FTRACE
> >  KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_FLAGS_USING)
> >  KBUILD_AFLAGS	+= $(CC_FLAGS_USING)
> 
