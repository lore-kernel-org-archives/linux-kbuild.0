Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0127.hostedemail.com ([216.40.44.127]:53077 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756587AbbEVMvm convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 May 2015 08:51:42 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 08C303F7A
	for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2015 12:42:56 +0000 (UTC)
Date: Fri, 22 May 2015 08:42:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC][PATCH 2/2] kallsyms: Do not display SyS_foo() syscall
 aliases in kallsyms
Message-ID: <20150522084250.09abe08e@gandalf.local.home>
In-Reply-To: <20150522105549.GG23022@pd.tnic>
References: <20150506181831.145849116@goodmis.org>
	<20150506182359.216601202@goodmis.org>
	<20150522105549.GG23022@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>

On Fri, 22 May 2015 12:55:49 +0200
Borislav Petkov <bp@alien8.de> wrote:

> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 8fa81e84e295..a64d89c6641c 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c
> > @@ -193,8 +193,22 @@ static int symbol_in_range(struct sym_entry *s, struct addr_range *ranges,
> >  	return 0;
> >  }
> >  
> > -static int symbol_valid(struct sym_entry *s)
> > +static const char *skip_prefix(const char *sym)
> >  {
> > +	if (symbol_prefix_char && *sym == symbol_prefix_char)
> > +		return sym + 1;
> > +	return sym;
> > +}
> 
> scripts/kallsyms.c: In function ‘symbol_valid’:
> scripts/kallsyms.c:241:11: warning: assignment discards ‘const’ qualifier from pointer target type
>   sym_name = skip_prefix(sym_name);
>            ^
> scripts/kallsyms.c:277:20: warning: assignment discards ‘const’ qualifier from pointer target type
>     sym_name_before = skip_prefix(sym_name_before);
>                     ^
> scripts/kallsyms.c:282:19: warning: assignment discards ‘const’ qualifier from pointer target type
>     sym_name_after = skip_prefix(sym_name_after);
>                    ^
> 
> That sym_name should be const?

Hmm, thanks. I'll take a look at this.

> 
> > +
> > +static int match_sys(const char *sym, const char *sys)
> > +{
> > +	return !strncmp(sys, "sys_", 4) && !strcmp(sym + 4, sys + 4);
> > +}
> > +
> > +static int symbol_valid(int idx)
> > +{
> > +	struct sym_entry *s = &table[idx];
> > +
> >  	/* Symbols which vary between passes.  Passes 1 and 2 must have
> >  	 * identical symbol lists.  The kallsyms_* symbols below are only added
> >  	 * after pass 1, they would be included in pass 2 when --all-symbols is
> > @@ -224,9 +238,7 @@ static int symbol_valid(struct sym_entry *s)
> >  	if (s->addr < kernel_start_addr)
> >  		return 0;
> >  
> > -	/* skip prefix char */
> > -	if (symbol_prefix_char && *sym_name == symbol_prefix_char)
> > -		sym_name++;
> > +	sym_name = skip_prefix(sym_name);
> >  
> >  
> >  	/* if --all-symbols is not specified, then symbols outside the text
> > @@ -255,6 +267,27 @@ static int symbol_valid(struct sym_entry *s)
> >  		if (strcmp(sym_name, special_symbols[i]) == 0)
> >  			return 0;
> >  
> > +	/* Ignore SyS_* alias system calls */
> > +	if (!strncmp(sym_name, "SyS_", 4)) {
> 
> I guess we won't have to hide more symbols from kallsyms. If we do, then
> probably will have to generalize this... Oh well.

I started writing a more generalize version to begin with, then
realized, "why? this isn't something we do every day". Yeah, if we add
another one then we should take the time to do so.

> 
> Other than that, I think this a step in the right direction as the first
> patch makes the SyS_ symbols local and that's a good way for tools
> parsing the symbol table to know which symbol to show:
> 
> readelf -a vmlinux | grep -iE "\Wsys_" | sort -k8 | head -50
>  77462: ffffffff815928f0    18 FUNC    GLOBAL DEFAULT    1 sys_accept
>  43024: ffffffff815928f0    18 FUNC    LOCAL  DEFAULT    1 SyS_accept
>  71564: ffffffff815926e0   526 FUNC    GLOBAL DEFAULT    1 sys_accept4
>  43023: ffffffff815926e0   526 FUNC    LOCAL  DEFAULT    1 SyS_accept4
>  50484: ffffffff81181170    26 FUNC    GLOBAL DEFAULT    1 sys_access
>  12656: ffffffff81181170    26 FUNC    LOCAL  DEFAULT    1 SyS_access
>  ...
> 
> i.e., the global one, provided all the other attributes are the same.
> 
> Before that we had them all identical:

Yep!

Thanks, I'll update this patch.

-- Steve

> 
> readelf -a vmlinux | grep -iE "\Wsys_" | sort -k8 | head -50
>  77446: ffffffff815928f0    18 FUNC    GLOBAL DEFAULT    1 sys_accept
>  69532: ffffffff815928f0    18 FUNC    GLOBAL DEFAULT    1 SyS_accept
>  71484: ffffffff815926e0   526 FUNC    GLOBAL DEFAULT    1 sys_accept4
>  50916: ffffffff815926e0   526 FUNC    GLOBAL DEFAULT    1 SyS_accept4
>  50192: ffffffff81181170    26 FUNC    GLOBAL DEFAULT    1 sys_access
>  59364: ffffffff81181170    26 FUNC    GLOBAL DEFAULT    1 SyS_access
>  52487: ffffffff81078920    18 FUNC    WEAK   DEFAULT    1 sys_acct
>  57730: ffffffff812b7d20   629 FUNC    GLOBAL DEFAULT    1 sys_add_key
>  64564: ffffffff812b7d20   629 FUNC    GLOBAL DEFAULT    1 SyS_add_key
>  74229: ffffffff810c7b00   154 FUNC    GLOBAL DEFAULT    1 sys_adjtimex
>  50534: ffffffff810c7b00   154 FUNC    GLOBAL DEFAULT    1 SyS_adjtimex
>  58974: ffffffff810cbab0    18 FUNC    GLOBAL DEFAULT    1 sys_alarm
>  54082: ffffffff810cbab0    18 FUNC    GLOBAL DEFAULT    1 SyS_alarm
>  ...
> 

