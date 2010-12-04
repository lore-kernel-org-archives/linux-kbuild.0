Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:33367 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756058Ab0LDVHP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 4 Dec 2010 16:07:15 -0500
Date: Sat, 4 Dec 2010 22:07:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCHv2] Kbuild: kconfig: Verbose version of --listnewconfig
Message-ID: <20101204210712.GA18205@merkur.ravnborg.org>
References: <1290488397.6770.1404.camel@localhost> <20101203122347.GA12395@sepie.suse.cz> <1291482609.8025.57.camel@localhost> <AANLkTikjmWJ1+NFTHWGRBrZ2jKGs4r3O_tv+9yfCBEWC@mail.gmail.com> <1291487421.8025.69.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1291487421.8025.69.camel@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Michal Marek <mmarek@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>

On Sat, Dec 04, 2010 at 06:30:21PM +0000, Ben Hutchings wrote:
> On Sat, 2010-12-04 at 13:11 -0500, Arnaud Lacombe wrote:
> [...]
> > > +static void report_conf(struct menu *menu, bool verbose)
> > > +{
> > > +       struct symbol *sym;
> > > +       struct menu *child;
> > > +
> > > +       if (!menu_is_visible(menu))
> > > +               return;
> > > +
> > > +       if (verbose && menu == &rootmenu) {
> > > +               printf("\n#\n"
> > > +                      "# Changes:\n"
> > > +                      "#\n");
> > > +       }
> > > +
> > I would not expect to see any header if there is no new symbol(s).
> > However, that might complicate the code too much. Btw, I find
> > "Changes" to be misleading, is that header necessary ?
> 
> We use this feature (or an earlier version of it) in automated kernel
> builds in Debian, so we expect the output to appear in build logs and
> the header makes it easier to pick out.
> 
> > > +       sym = menu->sym;
> > > +       if (sym && (sym->flags & SYMBOL_NEW) &&
> > > +           sym_is_changable(sym) && sym->name && !sym_is_choice_value(sym)) {
> > > +               if (verbose)
> > > +                       conf_write_symbol(sym, sym->type, stdout, true);
> > > +               else
> > > +                       printf("CONFIG_%s\n", sym->name);
> > Please don't hardcode the prefix string. This should be:
> > 
> >                        printf("%s%s\n", CONFIG_, sym->name);
> 
> OK, but I don't understand why it would change.

Other projects uses kconfig and they use other prefix.

	Sam
