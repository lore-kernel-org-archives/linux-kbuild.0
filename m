Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:13070 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751547AbdHSLZb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Aug 2017 07:25:31 -0400
Subject: Re: [RFC PATCH 0/3] kbuild: generate intermediate C files instead of
 copying _shipped files
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5998217A.1030305@cn.fujitsu.com>
Date: Sat, 19 Aug 2017 19:31:06 +0800
MIME-Version: 1.0
In-Reply-To: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linux-doc@vger.kernel.org, Markus Heiser <markus.heiser@darmarit.de>, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, SeongJae Park <sj38.park@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Hi,
  I am stuck in a similar problem recent days by chance.
  I am just curious about the purpose of introduction of these *_shipped
file, are they just for user's convenience when user doesn't install the
those tools?

-- 
Sincerely,
Cao jin

On 08/19/2017 04:49 PM, Masahiro Yamada wrote:
> In Linux build system convention, we do not run tools such as
> flex, bison, gperf during the kernel building.  Instead, manage
> generated C files in the repository with _shipped suffixes.
> They are simply shipped (copied) removing the _shipped suffixes
> during the kernel building.
> 
> Commit 7373f4f83c71 ("kbuild: add implicit rules for parser generation")
> added a mechanism to regenerate intermediate C files easily.
> The build rules are surrounded with ifdef REGENERATE_PARSERS.
> So, we need to pass REGENERATE_PARSERS=1 from the command line
> when we want to update them.
> 
> Here is one question.  Is it acceptable to use those rules all the time?
> That is, generate those C files by flex, bison, gperf during the
> kernel building.
> 
> This means, the build system depends on more external tools.
>>From the users' point of view, they will need to install
> flex, bison, gperf in order to build the kernel.
>>From the developers' point of view, the advantage is
> we do not need to version-control generated files, i.e. _shipped files
> will be deleted.
> 
> I'd like to know if this is acceptable or not.
> 
> For example, currently some files are simply shipped (copied)
> when building the kconfig program.
> 
>   $ make mrproper; make defconfig
>     HOSTCC  scripts/basic/fixdep
>     HOSTCC  scripts/kconfig/conf.o
>     SHIPPED scripts/kconfig/zconf.tab.c
>     SHIPPED scripts/kconfig/zconf.lex.c
>     SHIPPED scripts/kconfig/zconf.hash.c
>     HOSTCC  scripts/kconfig/zconf.tab.o
>     HOSTLD  scripts/kconfig/conf
>   *** Default configuration is based on 'x86_64_defconfig'
>   #
>   # configuration written to .config
>   #
> 
> With this series, they are created from *real* sources
> (*.y, *.l, *.gperf files).
> 
>   $ make mrproper; make defconfig
>     HOSTCC  scripts/basic/fixdep
>     HOSTCC  scripts/kconfig/conf.o
>     YACC    scripts/kconfig/zconf.tab.c
>     LEX     scripts/kconfig/zconf.lex.c
>     GPERF   scripts/kconfig/zconf.hash.c
>     HOSTCC  scripts/kconfig/zconf.tab.o
>     HOSTLD  scripts/kconfig/conf
>   *** Default configuration is based on 'x86_64_defconfig'
>   #
>   # configuration written to .config
>   #
> 
> Note:
> The tool versions in Documentation/process/changes.rst are just
> place-holders for now.  We need to figure out the minimal versions
> if we like to switch to this approach.
> 
> 
> 
> Masahiro Yamada (3):
>   kbuild: generate *.hash.c during build
>   kbuild: generate *.lex.c during build
>   kbuild: generate *.tab.c and *.tab.h during build
> 
>  Documentation/process/changes.rst        |   36 +
>  scripts/Makefile.lib                     |   26 +-
>  scripts/dtc/Makefile                     |    6 +-
>  scripts/dtc/dtc-lexer.lex.c_shipped      | 2259 ---------------------------
>  scripts/dtc/dtc-parser.tab.c_shipped     | 2303 ----------------------------
>  scripts/dtc/dtc-parser.tab.h_shipped     |  125 --
>  scripts/genksyms/Makefile                |    4 +-
>  scripts/genksyms/keywords.hash.c_shipped |  230 ---
>  scripts/genksyms/lex.lex.c_shipped       | 2291 ---------------------------
>  scripts/genksyms/parse.tab.c_shipped     | 2394 -----------------------------
>  scripts/genksyms/parse.tab.h_shipped     |  119 --
>  scripts/kconfig/Makefile                 |    1 +
>  scripts/kconfig/zconf.hash.c_shipped     |  297 ----
>  scripts/kconfig/zconf.lex.c_shipped      | 2473 ------------------------------
>  scripts/kconfig/zconf.tab.c_shipped      | 2471 -----------------------------
>  15 files changed, 53 insertions(+), 14982 deletions(-)
>  delete mode 100644 scripts/dtc/dtc-lexer.lex.c_shipped
>  delete mode 100644 scripts/dtc/dtc-parser.tab.c_shipped
>  delete mode 100644 scripts/dtc/dtc-parser.tab.h_shipped
>  delete mode 100644 scripts/genksyms/keywords.hash.c_shipped
>  delete mode 100644 scripts/genksyms/lex.lex.c_shipped
>  delete mode 100644 scripts/genksyms/parse.tab.c_shipped
>  delete mode 100644 scripts/genksyms/parse.tab.h_shipped
>  delete mode 100644 scripts/kconfig/zconf.hash.c_shipped
>  delete mode 100644 scripts/kconfig/zconf.lex.c_shipped
>  delete mode 100644 scripts/kconfig/zconf.tab.c_shipped
> 



