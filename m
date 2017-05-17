Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:47596 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752001AbdEQVYL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2017 17:24:11 -0400
Date: Wed, 17 May 2017 14:24:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RESEND][PATCH v2] Fix ctype(3) usage in the kconfig code on
 NetBSD
Message-Id: <20170517142410.f3eae6733cad60fc06a21bd3@linux-foundation.org>
In-Reply-To: <20170517133353.2644-1-n54@gmx.com>
References: <35570f77-5439-2760-a098-7aa4a60aad03@gmx.com>
        <20170517133353.2644-1-n54@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kamil Rytarowski <n54@gmx.com>
Cc: rdunlap@infradead.org, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr, yamada.masahiro@socionext.com, richard@nod.at

On Wed, 17 May 2017 15:33:53 +0200 Kamil Rytarowski <n54@gmx.com> wrote:

> The current code produces set of warnings on NetBSD-7.99.25 (GCC 4.8.5):
> 
> In file included from scripts/kconfig/zconf.tab.c:2576:0:
> scripts/kconfig/confdata.c: In function 'conf_expand_value':
> scripts/kconfig/confdata.c:97:3:
> warning: array subscript has type 'char' [-Wchar-subscripts]
>    while (isalnum(*src) || *src == '_')
>    ^
> scripts/kconfig/confdata.c: In function 'conf_set_sym_val':
> scripts/kconfig/confdata.c:155:4:
> warning: array subscript has type 'char' [-Wchar-subscripts]
>     for (p2 = p; *p2 && !isspace(*p2); p2++)
>     ^
> scripts/kconfig/confdata.c: In function 'tristate_print_symbol':
> scripts/kconfig/confdata.c:617:3:
> warning: array subscript has type 'char' [-Wchar-subscripts]
>    fprintf(fp, "%s%s=%c\n", CONFIG_, sym->name, (char)toupper(*value));
>    ^
> 
> Fix this portability issue by explicit casting to unsigned char.
> 
> ...
>
>  scripts/basic/fixdep.c               |  2 +-
>  scripts/kconfig/conf.c               |  6 +++---
>  scripts/kconfig/confdata.c           |  9 +++++----
>  scripts/kconfig/expr.c               |  3 ++-
>  scripts/kconfig/lxdialog/checklist.c |  3 ++-
>  scripts/kconfig/lxdialog/inputbox.c  |  3 ++-
>  scripts/kconfig/lxdialog/menubox.c   | 11 +++++++----
>  scripts/kconfig/lxdialog/util.c      |  5 +++--
>  scripts/kconfig/menu.c               |  4 ++--
>  scripts/kconfig/nconf.c              |  3 ++-
>  scripts/kconfig/nconf.gui.c          |  3 ++-
>  scripts/kconfig/symbol.c             |  8 ++++----
>  12 files changed, 35 insertions(+), 25 deletions(-)

This patch is irritating :(  The Linux manpage says

"These functions check whether c, which must have the value of an
unsigned char or EOF..."

so it's legit enough.

Apart from being ugly, it isn't very maintainable: people on Linux
systems will add new instances while not including the typecasts.

I wonder if there's anothing we can do in the Makefiles to suppress
that warning in scripts/ for netbsd systems?  ie, disable
-Wchar-subscripts in that case?

