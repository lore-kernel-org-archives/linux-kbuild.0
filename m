Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:39645 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756702Ab3DWQed (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Apr 2013 12:34:33 -0400
Received: by mail-wi0-f177.google.com with SMTP id hj19so1032368wib.16
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2013 09:34:32 -0700 (PDT)
Date: Tue, 23 Apr 2013 18:34:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 5/6] kconfig: implement KCONFIG_PROBABILITY for randconfig
Message-ID: <20130423163428.GA21997@free.fr>
References: <cover.1366665921.git.yann.morin.1998@free.fr>
 <e5fafd7ae13357e3d5cc604c89022982022a8909.1366665922.git.yann.morin.1998@free.fr>
 <51764A0A.9000506@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51764A0A.9000506@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Peter Korsgaard <jacmet@uclibc.org>

Michal, All,

On Tue, Apr 23, 2013 at 10:44:58AM +0200, Michal Marek wrote:
> On 22.4.2013 23:31, Yann E. MORIN wrote:
> > diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> > index 13ddf11..8d8d853 100644
> > --- a/scripts/kconfig/confdata.c
> > +++ b/scripts/kconfig/confdata.c
> > @@ -1106,7 +1106,16 @@ static void set_all_choice_values(struct symbol *csym)
> >  void conf_set_all_new_symbols(enum conf_def_mode mode)
> >  {
> >  	struct symbol *sym, *csym;
> > -	int i, cnt;
> > +	int i, cnt, prob = 50;
> > +
> [...]
> >  			case def_random:
> > -				cnt = sym_get_type(sym) == S_TRISTATE ? 3 : 2;
> > -				sym->def[S_DEF_USER].tri = (tristate)(rand() % cnt);
> > +				cnt = (rand() % 100) - (100 - prob);
> > +				if (cnt < 0)
> > +					sym->def[S_DEF_USER].tri = no;
> > +				else
> > +					if ((sym_get_type(sym) == S_TRISTATE)
> > +					    && (cnt > prob/2))
> > +						sym->def[S_DEF_USER].tri = mod;
> > +					else
> > +						sym->def[S_DEF_USER].tri = yes;
> 
> Previously, the distribution was 50%-50% for boolean options and
> 33%-33%-33% for tristate options. Now the default for tristate options
> changed to 50%-25%-25% (no-mod-yes). Wouldn't it make more sense to have
> a special case for KCONFIG_PROBABILITY not set, that would use the same
> distribution as before. I.e.
> 
> if (prob == -1) {
> 	cnt = sym_get_type(sym) == S_TRISTATE ? 3 : 2;
> 	sym->def[S_DEF_USER].tri = (tristate)(rand() % cnt);
> } else {
> 	/* new math */
> }

OK, what about this proposal, instead:
    KCONFIG_PROBABILITY     y:n split           y:m:n split             Notes
    -------------------------------------------------------------------------
    unset or empty          50  : 50            33  : 33  : 34          [1]
    N                        N  : 100-N         N/2 : N/2 : 100-N       [2]
    N:M                     N+M : 100-(N+M)      N  :  M  : 100-(N+M)   [3]
    N:M:L                    N  : 100-N          M  :  L  : 100-(M+L)   [4]

[1] current behaviour
[2] the curent patch's behaviour
[3] boolean's Y probability is tristate's Y plus tristate's M probabilities
[4] all probabilities explicitly stated

I have a prototype for this I need to clean up. If that's OK for you, I'll
submit that; if not, I'll use your suggestion.

> Not building half of all drivers is rather boring :)

Oh! No! All that idle CPU time that could be put to better use... ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
