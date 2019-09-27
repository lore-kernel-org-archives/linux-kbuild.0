Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32800 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbfI0Lqw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 07:46:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id b9so2410935wrs.0
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Sep 2019 04:46:51 -0700 (PDT)
Date: Fri, 27 Sep 2019 12:46:46 +0100
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH 1/7] modpost: fix broken sym->namespace for external
 module builds
Message-ID: <20190927114646.GA259443@google.com>
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
 <20190927093603.9140-2-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190927093603.9140-2-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jessica Yu <jeyu@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>, Will Deacon <will.deacon@arm.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Shaun Ruffell <sruffell@sruffell.net>

On Fri, Sep 27, 2019 at 06:35:57PM +0900, Masahiro Yamada wrote:
>Currently, external module builds produce tons of false-positives:
>
>  WARNING: module <mod> uses symbol <sym> from namespace <ns>, but does not import it.
>
>Here, the <ns> part shows a random string.
>
>When you build external modules, the symbol info of vmlinux and
>in-kernel modules are read from $(objtree)/Module.symvers, but
>read_dump() is buggy in multiple ways:
>
>[1] When the modpost is run for vmlinux and in-kernel modules,
>sym_extract_namespace() correctly allocates memory for the namespace.
>On the other hand, read_dump() does not, then sym->namespace will
>point to somewhere in the line buffer of get_next_line(). The data
>in the buffer will be replaced soon, and sym->namespace will end up
>with pointing to unrelated data. As a result, check_exports() will
>show random strings in the warning messages.
>
>[2] When there is no namespace, sym_extract_namespace() returns NULL.
>On the other hand, read_dump() sets namespace to an empty string "".
>(but, it will be later replaced with unrelated data due to bug [1].)
>The check_exports() shows a warning unless exp->namespace is NULL,
>so every symbol read from read_dump() emits the warning, which is
>mostly false positive.
>
>To address [1], I added NOFAIL(strdup(...)) to allocate memory.
>For [2], I changed the if-conditional in check_exports().


Thanks for addressing this. Greg had reported this earlier this week and
Shaun was proposing a fix earlier today. Shaun's fix also ensures that
memory is released when updating the namespace. But judging from the
code around 'symbolhash' it seems that leaking this is accepted for
modpost. Not sure about that. Having said that, please feel free to add

Reviewed-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---
>
> scripts/mod/modpost.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>index 3961941e8e7a..5c628a7d80f7 100644
>--- a/scripts/mod/modpost.c
>+++ b/scripts/mod/modpost.c
>@@ -2195,7 +2195,7 @@ static int check_exports(struct module *mod)
> 		else
> 			basename = mod->name;
>
>-		if (exp->namespace) {
>+		if (exp->namespace && exp->namespace[0]) {
> 			add_namespace(&mod->required_namespaces,
> 				      exp->namespace);
>
>@@ -2453,7 +2453,7 @@ static void read_dump(const char *fname, unsigned int kernel)
> 			mod = new_module(modname);
> 			mod->skip = 1;
> 		}
>-		s = sym_add_exported(symname, namespace, mod,
>+		s = sym_add_exported(symname, NOFAIL(strdup(namespace)), mod,
> 				     export_no(export));
> 		s->kernel    = kernel;
> 		s->preloaded = 1;
>-- 
>2.17.1
>
