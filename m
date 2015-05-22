Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:37379 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756038AbbEVKzy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 May 2015 06:55:54 -0400
Date: Fri, 22 May 2015 12:55:49 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [RFC][PATCH 2/2] kallsyms: Do not display SyS_foo() syscall
 aliases in kallsyms
Message-ID: <20150522105549.GG23022@pd.tnic>
References: <20150506181831.145849116@goodmis.org>
 <20150506182359.216601202@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150506182359.216601202@goodmis.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>

On Wed, May 06, 2015 at 02:18:33PM -0400, Steven Rostedt wrote:
> From: "Steven Rostedt (Red Hat)" <rostedt@goodmis.org>
> 
> The SyS_foo() alias wrapper was added to make sure that system call
> arguments were signed extended. The call itself is to never be used
> by anything, only the sys_foo() version is. But this symbol is stored
> in /proc/kallsyms, and is returned sometimes as the name of system
> call functions when a ksym lookup is made, it confuses the function
> tracer interface (see available_filter_functions in the tracefs
> directory).
> 
> Al Viro even suggested that this should be removed from kallsyms
> as well:
> 
> Link: http://lkml.kernel.org/r/20130510211716.GN25399@ZenIV.linux.org.uk
> 
> Modify the compile time kallsyms.c to check if the function name
> begins with SyS_ and is before or after the same name that starts
> with sys_ and if so, do not record it. This saves some space and
> more importantly removes the confusing variations of the system
> call name.
> 
>  wc kallsyms.*
>   90151  284644 3819255 kallsyms.orig
>   89826  283669 3808628 kallsyms.patched
> 
>  size vmlinux*
>    text    data     bss     dec     hex filename
> 9990933 2368592 1249280 13608805         cfa765 vmlinux.orig
> 9986837 2368592 1249280 13604709         cf9765 vmlinux.patched
> 
> This patch only removes SyS_*, it does not do anything with
> compat_SyS_*.
> 
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> ---
>  scripts/kallsyms.c | 43 ++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 8fa81e84e295..a64d89c6641c 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -193,8 +193,22 @@ static int symbol_in_range(struct sym_entry *s, struct addr_range *ranges,
>  	return 0;
>  }
>  
> -static int symbol_valid(struct sym_entry *s)
> +static const char *skip_prefix(const char *sym)
>  {
> +	if (symbol_prefix_char && *sym == symbol_prefix_char)
> +		return sym + 1;
> +	return sym;
> +}

scripts/kallsyms.c: In function ‘symbol_valid’:
scripts/kallsyms.c:241:11: warning: assignment discards ‘const’ qualifier from pointer target type
  sym_name = skip_prefix(sym_name);
           ^
scripts/kallsyms.c:277:20: warning: assignment discards ‘const’ qualifier from pointer target type
    sym_name_before = skip_prefix(sym_name_before);
                    ^
scripts/kallsyms.c:282:19: warning: assignment discards ‘const’ qualifier from pointer target type
    sym_name_after = skip_prefix(sym_name_after);
                   ^

That sym_name should be const?

> +
> +static int match_sys(const char *sym, const char *sys)
> +{
> +	return !strncmp(sys, "sys_", 4) && !strcmp(sym + 4, sys + 4);
> +}
> +
> +static int symbol_valid(int idx)
> +{
> +	struct sym_entry *s = &table[idx];
> +
>  	/* Symbols which vary between passes.  Passes 1 and 2 must have
>  	 * identical symbol lists.  The kallsyms_* symbols below are only added
>  	 * after pass 1, they would be included in pass 2 when --all-symbols is
> @@ -224,9 +238,7 @@ static int symbol_valid(struct sym_entry *s)
>  	if (s->addr < kernel_start_addr)
>  		return 0;
>  
> -	/* skip prefix char */
> -	if (symbol_prefix_char && *sym_name == symbol_prefix_char)
> -		sym_name++;
> +	sym_name = skip_prefix(sym_name);
>  
>  
>  	/* if --all-symbols is not specified, then symbols outside the text
> @@ -255,6 +267,27 @@ static int symbol_valid(struct sym_entry *s)
>  		if (strcmp(sym_name, special_symbols[i]) == 0)
>  			return 0;
>  
> +	/* Ignore SyS_* alias system calls */
> +	if (!strncmp(sym_name, "SyS_", 4)) {

I guess we won't have to hide more symbols from kallsyms. If we do, then
probably will have to generalize this... Oh well.

Other than that, I think this a step in the right direction as the first
patch makes the SyS_ symbols local and that's a good way for tools
parsing the symbol table to know which symbol to show:

readelf -a vmlinux | grep -iE "\Wsys_" | sort -k8 | head -50
 77462: ffffffff815928f0    18 FUNC    GLOBAL DEFAULT    1 sys_accept
 43024: ffffffff815928f0    18 FUNC    LOCAL  DEFAULT    1 SyS_accept
 71564: ffffffff815926e0   526 FUNC    GLOBAL DEFAULT    1 sys_accept4
 43023: ffffffff815926e0   526 FUNC    LOCAL  DEFAULT    1 SyS_accept4
 50484: ffffffff81181170    26 FUNC    GLOBAL DEFAULT    1 sys_access
 12656: ffffffff81181170    26 FUNC    LOCAL  DEFAULT    1 SyS_access
 ...

i.e., the global one, provided all the other attributes are the same.

Before that we had them all identical:

readelf -a vmlinux | grep -iE "\Wsys_" | sort -k8 | head -50
 77446: ffffffff815928f0    18 FUNC    GLOBAL DEFAULT    1 sys_accept
 69532: ffffffff815928f0    18 FUNC    GLOBAL DEFAULT    1 SyS_accept
 71484: ffffffff815926e0   526 FUNC    GLOBAL DEFAULT    1 sys_accept4
 50916: ffffffff815926e0   526 FUNC    GLOBAL DEFAULT    1 SyS_accept4
 50192: ffffffff81181170    26 FUNC    GLOBAL DEFAULT    1 sys_access
 59364: ffffffff81181170    26 FUNC    GLOBAL DEFAULT    1 SyS_access
 52487: ffffffff81078920    18 FUNC    WEAK   DEFAULT    1 sys_acct
 57730: ffffffff812b7d20   629 FUNC    GLOBAL DEFAULT    1 sys_add_key
 64564: ffffffff812b7d20   629 FUNC    GLOBAL DEFAULT    1 SyS_add_key
 74229: ffffffff810c7b00   154 FUNC    GLOBAL DEFAULT    1 sys_adjtimex
 50534: ffffffff810c7b00   154 FUNC    GLOBAL DEFAULT    1 SyS_adjtimex
 58974: ffffffff810cbab0    18 FUNC    GLOBAL DEFAULT    1 sys_alarm
 54082: ffffffff810cbab0    18 FUNC    GLOBAL DEFAULT    1 SyS_alarm
 ...

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
