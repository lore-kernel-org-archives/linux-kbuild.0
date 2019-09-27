Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33061 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbfI0MHc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 08:07:32 -0400
Received: by mail-wm1-f66.google.com with SMTP id r17so8832702wme.0
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Sep 2019 05:07:31 -0700 (PDT)
Date: Fri, 27 Sep 2019 13:07:25 +0100
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH 2/7] module: swap the order of symbol.namespace
Message-ID: <20190927120725.GB259443@google.com>
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
 <20190927093603.9140-3-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190927093603.9140-3-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jessica Yu <jeyu@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>, Will Deacon <will.deacon@arm.com>, Michal Marek <michal.lkml@markovi.net>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 27, 2019 at 06:35:58PM +0900, Masahiro Yamada wrote:
>Currently, EXPORT_SYMBOL_NS(_GPL) constructs the kernel symbol as
>follows:
>
>  __ksymtab_SYMBOL.NAMESPACE
>
>The sym_extract_namespace() in modpost allocates memory for the part
>SYMBOL.NAMESPACE when '.' is contained. One problem is that the pointer
>returned by strdup() is lost because the symbol name will be copied to
>malloc'ed memory by alloc_symbol(). No one will keep track of the
>pointer of strdup'ed memory.
>
>sym->namespace still points to the NAMESPACE part. So, if you like,
>you can free it with complicated code like this:
>
>   free(sym->namespace - strlen(sym->name) - 1);
>
>I would not say it is fatal since we seldom bother to manually free
>memory in host programs. But, I can fix it in an elegant way.
>
>I swapped the order of the symbol and the namespace as follows:
>
>  __ksymtab_NAMESPACE.SYMBOL
>
>then, simplified sym_extract_namespace() so that it allocates memory
>only for the NAMESPACE part.
>
>I prefer this order because it is intuitive and also matches to major
>languages. For example, NAMESPACE::NAME in C++, MODULE.NAME in Python.

I agree with this rationale and like the implementation. I believe the
idea of appending the namespace came from being afraid of other tools
facing the problem of parsing the namespace out of the middle of the
entry. Thanks for this improvement.

Reviewed-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---
>
> include/linux/export.h |  4 ++--
> scripts/mod/modpost.c  | 16 +++++++---------
> 2 files changed, 9 insertions(+), 11 deletions(-)
>
>diff --git a/include/linux/export.h b/include/linux/export.h
>index 95f55b7f83a0..0695d4e847d9 100644
>--- a/include/linux/export.h
>+++ b/include/linux/export.h
>@@ -52,7 +52,7 @@ extern struct module __this_module;
> 	__ADDRESSABLE(sym)						\
> 	asm("	.section \"___ksymtab" sec "+" #sym "\", \"a\"	\n"	\
> 	    "	.balign	4					\n"	\
>-	    "__ksymtab_" #sym NS_SEPARATOR #ns ":		\n"	\
>+	    "__ksymtab_" #ns NS_SEPARATOR #sym ":		\n"	\
> 	    "	.long	" #sym "- .				\n"	\
> 	    "	.long	__kstrtab_" #sym "- .			\n"	\
> 	    "	.long	__kstrtab_ns_" #sym "- .		\n"	\
>@@ -76,7 +76,7 @@ struct kernel_symbol {
> #else
> #define __KSYMTAB_ENTRY_NS(sym, sec, ns)				\
> 	static const struct kernel_symbol __ksymtab_##sym##__##ns	\
>-	asm("__ksymtab_" #sym NS_SEPARATOR #ns)				\
>+	asm("__ksymtab_" #ns NS_SEPARATOR #sym)				\
> 	__attribute__((section("___ksymtab" sec "+" #sym), used))	\
> 	__aligned(sizeof(void *))					\
> 	= { (unsigned long)&sym, __kstrtab_##sym, __kstrtab_ns_##sym }
>diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>index 5c628a7d80f7..d171b0cffb05 100644
>--- a/scripts/mod/modpost.c
>+++ b/scripts/mod/modpost.c
>@@ -350,18 +350,16 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
>
> static const char *sym_extract_namespace(const char **symname)
> {
>-	size_t n;
>-	char *dupsymname;
>+	char *namespace = NULL;
>+	char *ns_separator;
>
>-	n = strcspn(*symname, ".");
>-	if (n < strlen(*symname) - 1) {
>-		dupsymname = NOFAIL(strdup(*symname));
>-		dupsymname[n] = '\0';
>-		*symname = dupsymname;
>-		return dupsymname + n + 1;
>+	ns_separator = strchr(*symname, '.');
>+	if (ns_separator) {
>+		namespace = NOFAIL(strndup(*symname, ns_separator - *symname));
>+		*symname = ns_separator + 1;
> 	}
>
>-	return NULL;
>+	return namespace;
> }
>
> /**
>-- 
>2.17.1
>
