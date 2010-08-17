Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:58056 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759Ab0HQU0b (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 16:26:31 -0400
Date: Tue, 17 Aug 2010 22:26:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: implement the `mainmenu' directive
Message-ID: <20100817202630.GB11592@merkur.ravnborg.org>
References: <AANLkTinuJJXAB6b0ap6yn0X9nM7grQmYxoJSdyOPVmVj@mail.gmail.com> <1282023725-20428-1-git-send-email-lacombar@gmail.com> <4C6A7167.3060608@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4C6A7167.3060608@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, Aug 17, 2010 at 01:24:23PM +0200, Michal Marek wrote:
> On 17.8.2010 07:42, Arnaud Lacombe wrote:
> > note: the prompt is voluntarily still a bare `const char *'. It may need
> > to be represented in a more detailled way, say a `struct property'.
> > 
> > Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> > 
> > ---
> >  scripts/kconfig/lkc.h   |    2 ++
> >  scripts/kconfig/menu.c  |   23 +++++++++++++++++++++++
> >  scripts/kconfig/zconf.y |    9 ++++++++-
> >  3 files changed, 33 insertions(+), 1 deletions(-)
> > 
> > diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> > index bdf71bd..f00854f 100644
> > --- a/scripts/kconfig/lkc.h
> > +++ b/scripts/kconfig/lkc.h
> > @@ -94,6 +94,8 @@ static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
> >  void kconfig_load(void);
> >  
> >  /* menu.c */
> > +void mainmenu_set_prompt(char *);
> > +const char *mainmenu_get_prompt(void);
> >  void _menu_init(void);
> >  void menu_warn(struct menu *menu, const char *fmt, ...);
> >  struct menu *menu_add_menu(void);
> > diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> > index 4fb5902..6aa219e 100644
> > --- a/scripts/kconfig/menu.c
> > +++ b/scripts/kconfig/menu.c
> > @@ -38,6 +38,29 @@ static void prop_warn(struct property *prop, const char *fmt, ...)
> >  	va_end(ap);
> >  }
> >  
> > +static const char *mainmenu_prompt = NULL;
> 
> Keep the "Linux Kernel Configuration" default here.

Or alternative named it "mainmenu" - to give user a hint what this is about.

> 
> > +
> > +void mainmenu_set_prompt(char *prompt)
> > +{
> > +	if (mainmenu_prompt != NULL)
> > +		fprintf(stderr, "%s:%d:warning: mainmenu redefined\n",
> > +		    current_file->name, zconf_lineno());
> 
> ... and do not warn here.
> 
> > +
> > +	if (isspace(*prompt)) {
> > +		fprintf(stderr, "%s:%d:warning: leading whitespace ignored\n",
> > +		    current_file->name, zconf_lineno());
> > +		while (isspace(*prompt))
> > +			prompt++;
> > +	}
> 
> The lexer already eats whitespace I think, so this might not be necessary.

menu_add_prop() does something similar so I think not.
But I did not check.

	Sam
