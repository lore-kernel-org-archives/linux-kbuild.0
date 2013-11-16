Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.225]:54007 "EHLO
	cdptpa-oedge-vip.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751481Ab3KPBUS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Nov 2013 20:20:18 -0500
Date: Fri, 15 Nov 2013 20:20:13 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] scripts: Have make TAGS not include structure members
Message-ID: <20131115202013.252e3a24@gandalf.local.home>
In-Reply-To: <5286C42C.4050800@codeaurora.org>
References: <20131115093645.6dc03918@gandalf.local.home>
	<5286C42C.4050800@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Yang Bai <hamo.by@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

On Fri, 15 Nov 2013 17:02:36 -0800
Stephen Boyd <sboyd@codeaurora.org> wrote:

> On 11/15/13 06:36, Steven Rostedt wrote:
> > diff --git a/scripts/tags.sh b/scripts/tags.sh
> > index 74f02e4..b985371 100755
> > --- a/scripts/tags.sh
> > +++ b/scripts/tags.sh
> > @@ -218,7 +218,7 @@ exuberant()
> >  
> >  emacs()
> >  {
> > -	all_target_sources | xargs $1 -a                        \
> > +	all_target_sources | xargs $1 -a --no-members           \
> >  	--regex='/^\(ENTRY\|_GLOBAL\)(\([^)]*\)).*/\2/'         \
> >  	--regex='/^SYSCALL_DEFINE[0-9]?(\([^,)]*\).*/sys_\1/'   \
> >  	--regex='/^TRACE_EVENT(\([^,)]*\).*/trace_\1/'		\
> > @@ -248,13 +248,13 @@ emacs()
> >  	--regex='/PCI_OP_READ(\([a-z]*[a-z]\).*[1-4])/pci_bus_read_config_\1/' \
> >  	--regex='/PCI_OP_WRITE(\([a-z]*[a-z]\).*[1-4])/pci_bus_write_config_\1/'
> >  
> > -	all_kconfigs | xargs $1 -a                              \
> > +	all_kconfigs | xargs $1 -a --no-members                 \
> >  	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/\3/'
> >  
> > -	all_kconfigs | xargs $1 -a                              \
> > +	all_kconfigs | xargs $1 -a --no-members                 \
> >  	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/CONFIG_\3/'
> >  
> > -	all_defconfigs | xargs -r $1 -a                         \
> > +	all_defconfigs | xargs -r $1 -a --no-members            \
> >  	--regex='/^#?[ \t]?\(CONFIG_[a-zA-Z0-9_]+\)/\1/'
> >  }
> >  
> 
> Does it actually matter for the kconfigs and defconfigs?
> 

Actually no. I noticed that after I sent the patch. Here's v2:


scripts: Have make TAGS not include structure members

It is really annoying when I use emacs TAGS to search for something
like "dev_name" and have to go through 12 iterations before I find the
function "dev_name". I really do not care about structures that include
"dev_name" as one of its fields, and I'm sure pretty much all other
developers do not care either.

There's a "remove_structs" variable used by the scripts/tags.sh, which
I'm guessing is suppose to remove these structures from the TAGS file,
but it must do a poor job at it, as I'm always hitting structures when
I want the actual declaration.

Luckily, the etags and ctags program comes with an option
"--no-members", which does exactly what I want, and I'm sure all other
kernel developers want too.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

Index: linux-trace.git/scripts/tags.sh
===================================================================
--- linux-trace.git.orig/scripts/tags.sh
+++ linux-trace.git/scripts/tags.sh
@@ -218,7 +218,7 @@ exuberant()
 
 emacs()
 {
-	all_target_sources | xargs $1 -a                        \
+	all_target_sources | xargs $1 -a --no-members           \
 	--regex='/^\(ENTRY\|_GLOBAL\)(\([^)]*\)).*/\2/'         \
 	--regex='/^SYSCALL_DEFINE[0-9]?(\([^,)]*\).*/sys_\1/'   \
 	--regex='/^TRACE_EVENT(\([^,)]*\).*/trace_\1/'		\
