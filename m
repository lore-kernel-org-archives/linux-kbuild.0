Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35950 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754342Ab1EEOXG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 May 2011 10:23:06 -0400
Date: Thu, 5 May 2011 16:23:05 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [RFC 2/9] genksyms: finalize rename
Message-ID: <20110505142305.GG13293@sepie.suse.cz>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
 <1304561004-2684-3-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304561004-2684-3-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Wed, May 04, 2011 at 10:03:17PM -0400, Arnaud Lacombe wrote:
> ---
>  scripts/genksyms/.gitignore |    6 ++--
>  scripts/genksyms/Makefile   |   45 +++++++++++++-----------------------------
>  scripts/genksyms/genksyms.c |   11 ++++-----
>  scripts/genksyms/genksyms.l |    7 ++---
>  scripts/genksyms/genksyms.y |    2 +
>  5 files changed, 27 insertions(+), 44 deletions(-)
> 
> diff --git a/scripts/genksyms/.gitignore b/scripts/genksyms/.gitignore
> index be5cadb..0983577 100644
> --- a/scripts/genksyms/.gitignore
> +++ b/scripts/genksyms/.gitignore
> @@ -1,4 +1,4 @@
> -keywords.c
> -lex.c
> -parse.[ch]
>  genksyms
> +genksyms.tab.c
> +lex.genksyms.c
> +genksyms.hash.c
> diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
> index e420fe4..82bb25f 100644
> --- a/scripts/genksyms/Makefile
> +++ b/scripts/genksyms/Makefile
> @@ -2,52 +2,35 @@
>  hostprogs-y	:= genksyms
>  always		:= $(hostprogs-y)
>  
> -genksyms-objs	:= genksyms.o parse.o lex.o
> +genksyms-objs	:= genksyms.o genksyms.tab.o
>  
>  # -I needed for generated C source (shipped source)
>  HOSTCFLAGS_parse.o := -Wno-uninitialized -I$(src)
>  
> -# dependencies on generated files need to be listed explicitly
> -$(obj)/lex.o: $(obj)/parse.h $(obj)/keywords.c
> -
>  # -I needed for generated C source (shipped source)
>  HOSTCFLAGS_lex.o := -I$(src)
>  
> -ifdef GENERATE_PARSER
> -
> -# gperf
> +clean-files	:= genksyms.tab.c lex.genksyms.c genksyms.hash.c

Given that you are overwriting most of this by "kbuild: merge parser
generation rules", I suggest you only do the necessary minimum at this
point, i.e. only reflect the file renames and #include the lexer into
the parser.

Michal
