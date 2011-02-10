Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:62208 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757161Ab1BJWfj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Feb 2011 17:35:39 -0500
Date: Thu, 10 Feb 2011 23:35:31 +0100
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Subject: Re: [PATCH] kconfig: undefined symbols can crash dependency loop
 detection
Message-ID: <20110210223529.GA19824@ulf>
References: <20110204231611.GA9344@ulf>
 <4D54030B.5040407@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4D54030B.5040407@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, zippel@linux-m68k.org, linux-kernel@vger.kernel.org

On Thu, Feb 10, 2011 at 04:23:55PM +0100, Michal Marek wrote:
> On 5.2.2011 00:16, Ulf Magnusson wrote:
> > The Kconfig
> > 
> > config FOO
> > 	bool "FOO" if BAR
> > 	select BAR
> > 
> > has a dependency loop involving an undefined symbol BAR. This causes a
> > segfault in sym_check_print_recursive() as it assumes all symbols have a
> > non-null 'prop', which is not the case for undefined symbols. This is a
> > proposed fix.
> > 
> > Signed-off-by: Ulf Magnusson <ulfalizer.lkml@gmail.com>
> > ---
> >  scripts/kconfig/symbol.c |   32 ++++++++++++++++++++++++++++----
> >  1 files changed, 28 insertions(+), 4 deletions(-)
> > 
> > diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> > index a796c95..81a217f 100644
> > --- a/scripts/kconfig/symbol.c
> > +++ b/scripts/kconfig/symbol.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <ctype.h>
> >  #include <stdlib.h>
> > +#include <stdio.h>
> >  #include <string.h>
> >  #include <regex.h>
> >  #include <sys/utsname.h>
> > @@ -972,6 +973,10 @@ static void sym_check_print_recursive(struct symbol *last_sym)
> >  	struct menu *menu = NULL;
> >  	struct property *prop;
> >  	struct dep_stack cv_stack;
> > +	const char *filename;
> > +	int lineno;
> > +	char undef_msg_buf[100];
> > +	int snprintf_size;
> >  
> >  	if (sym_is_choice_value(last_sym)) {
> >  		dep_stack_insert(&cv_stack, last_sym);
> > @@ -1001,18 +1006,37 @@ static void sym_check_print_recursive(struct symbol *last_sym)
> >  					break;
> >  			}
> >  		}
> > +
> > +		if (prop) {
> > +			filename = prop->file->name;
> > +			lineno = prop->lineno;
> > +		} else {
> > +			/* The dependency loop involves an undefined symbol.
> > +			 * Checking sym->name is probably unnecessary here, but
> > +			 * just to be on the safe side. */
> > +			snprintf_size = snprintf(undef_msg_buf,
> > +						 sizeof(undef_msg_buf),
> > +						 "<no file, %s is undefined>",
> > +						 sym->name ? sym->name :
> > +							     "<choice>");
> > +			if (snprintf_size > sizeof(undef_msg_buf))
> > +				undef_msg_buf[sizeof(undef_msg_buf) - 1] = '\0';
> > +			filename = undef_msg_buf;
> > +			lineno = 0;
> 
> Good catch. But as this handles a corner case involving a severely
> borken Kconfig file, I would simply do
> filename = "<unknown>";
> lineno = 0;
> and be done with it.
>
Yeah, it probably isn't very likely to occur in practise, though it
would also happen if a symbol selects an undefined symbol it depends on
via an enclosing menu or if.

Pick whatever version you prefer :)

/Ulf
