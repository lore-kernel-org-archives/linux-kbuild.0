Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews07.kpnxchange.com ([213.75.39.10]:60408 "EHLO
	cpsmtpb-ews07.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754785AbaLIKQE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Dec 2014 05:16:04 -0500
Message-ID: <1418120161.2058.97.camel@x220>
Subject: Re: [PATCH 1/2] kconfig: don't silently ignore unhandled characters
From: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 09 Dec 2014 11:16:01 +0100
In-Reply-To: <5458ED470200007800044DA7@mail.emea.novell.com>
References: <5458A4FC0200007800044AC1@mail.emea.novell.com>
	 <1415110006.20372.165.camel@x220>
	 <5458ED470200007800044DA7@mail.emea.novell.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org

Hi Jan,

On Tue, 2014-11-04 at 14:14 +0000, Jan Beulich wrote:
> >>> On 04.11.14 at 15:06, <pebolle@tiscali.nl> wrote:
> > On Tue, 2014-11-04 at 09:05 +0000, Jan Beulich wrote:
> >> At the very least we should tell people that waht they wrote is not
> >> what the utility understands.
> > 
> > Yes, we should change this. I'm inclined to think the should die with an
> > error on invalid syntax. Would that be too strict?  
> 
> I would think so. This could be made more strict once the warning
> was in place for a couple of releases.
> 
> >> --- 3.18-rc3-kconfig.orig/scripts/kconfig/zconf.lex.c_shipped
> >> +++ 3.18-rc3-kconfig/scripts/kconfig/zconf.lex.c_shipped
> >> @@ -414,14 +414,14 @@ static yyconst flex_int16_t yy_nxt[][17]
> >>      },
> >>  
> >>      {
> >> -       11,   26,   26,   27,   28,   29,   30,   31,   29,   32,
> >> -       33,   34,   35,   35,   36,   37,   38
> >> +       11,   26,   27,   28,   29,   30,   31,   32,   30,   33,
> >> +       34,   35,   36,   36,   37,   38,   39
> >>  
> >>      },
> >>  
> >>      {
> >> -       11,   26,   26,   27,   28,   29,   30,   31,   29,   32,
> >> -       33,   34,   35,   35,   36,   37,   38
> >> +       11,   26,   27,   28,   29,   30,   31,   32,   30,   33,
> >> +       34,   35,   36,   36,   37,   38,   39
> >>      },
> >>  
> >>      {
> > 
> > I guess we must trust that you manually edited this _shipped file
> > correctly.
> 
> There was no manual editing involved - this is the re-generated
> version.
> 
> >> @@ -920,7 +931,7 @@ static int input (void );
> >>  /* This used to be an fputs(), but since the string might contain NUL's,
> >>   * we now use fwrite().
> >>   */
> >> -#define ECHO do { if (fwrite( zconftext, zconfleng, 1, zconfout )) {} } while (0)
> >> +#define ECHO fwrite( zconftext, zconfleng, 1, zconfout )
> >>  #endif
> >>  
> >>  /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
> > 
> > But this hunk looks unrelated. Is this needed?
> 
> I think it should stay, even if my flex version may be slightly different
> from the one that was used originally. As above - it's simply a result
> of re-generating.

It's been five weeks since you've sent this. I'm not aware of any other
comments beside mine. Here's what I'd suggest to get things moving:

Resend these patches. Don't bother sending to Yann, that's pointless. Do
include lkml. Perhaps also include Michal Marek and/or Andrew Morton:
one of them might handle these patches. Who knows...

For 1/2 feel free to add
    Acked-by: Paul Bolle <pebolle@tiscali.nl>

_provided_ you change the printf([...]) to a fprintf(stderr, [...]). It
would be nice if you'd added a note about the flex version and the
command line used to regenerate the _shipped file, maybe even in the
commit explanation.

Note that I tested patch 1/2 on top of next-20141208 for all current
defconfigs (see https://lkml.org/lkml/2014/12/8/587 how I did that).
No .config was changed, which was what I expected.

For 2/2 don't forget to remove those development printf()s. I haven't
yet looked at that patch closely or even tested it. Perhaps I'll
actually manage to do that after you resend it.


Paul Bolle

