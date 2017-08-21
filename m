Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753407AbdHURMx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Aug 2017 13:12:53 -0400
MIME-Version: 1.0
In-Reply-To: <1503132577-24423-4-git-send-email-yamada.masahiro@socionext.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com> <1503132577-24423-4-git-send-email-yamada.masahiro@socionext.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 21 Aug 2017 12:12:31 -0500
Message-ID: <CAL_JsqKWX1kb58_cck5ACGJGg8p2irsZNXufq2ougbRDxnLhXw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] kbuild: generate *.tab.c and *.tab.h during build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, SeongJae Park <sj38.park@gmail.com>, Frank Rowand <frowand.list@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

On Sat, Aug 19, 2017 at 3:49 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> *.tab.[ch] files are artifacts generated from *.y by using bison.
> Instead of running bison, we conventionally version-control
> *.tab.[ch]_shipped files and copy them to *.tab.[ch] during build.
>
> It is true that this approach can minimize external tool dependency,
> but we need to update the shipped files from time to time.  This
> commit switches to build-time generation of the intermediate C files.

When do we need to update them?

>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Documentation/process/changes.rst    |   12 +
>  scripts/Makefile.lib                 |   14 +-
>  scripts/dtc/Makefile                 |    9 +-
>  scripts/dtc/dtc-parser.tab.c_shipped | 2303 -------------------------------
>  scripts/dtc/dtc-parser.tab.h_shipped |  125 --

The script to import dtc normally creates these. If you change this,
please make sure the script still works.

>  scripts/genksyms/Makefile            |    5 +-
>  scripts/genksyms/parse.tab.c_shipped | 2394 --------------------------------
>  scripts/genksyms/parse.tab.h_shipped |  119 --
>  scripts/kconfig/Makefile             |    2 +-
>  scripts/kconfig/zconf.tab.c_shipped  | 2471 ----------------------------------
>  10 files changed, 24 insertions(+), 7430 deletions(-)
>  delete mode 100644 scripts/dtc/dtc-parser.tab.c_shipped
>  delete mode 100644 scripts/dtc/dtc-parser.tab.h_shipped
>  delete mode 100644 scripts/genksyms/parse.tab.c_shipped
>  delete mode 100644 scripts/genksyms/parse.tab.h_shipped
>  delete mode 100644 scripts/kconfig/zconf.tab.c_shipped
>
