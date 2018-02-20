Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:18913 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750781AbeBTIOD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 03:14:03 -0500
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com [209.85.213.49]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id w1K8DjnK007551
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Feb 2018 17:13:46 +0900
Received: by mail-vk0-f49.google.com with SMTP id x125so2702460vkc.13
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Feb 2018 00:13:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <cover.1518985888.git.erosca@de.adit-jv.com>
References: <cover.1518985888.git.erosca@de.adit-jv.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 20 Feb 2018 17:13:04 +0900
Message-ID: <CAK7LNAQ4z9KHsCvzQRHozcXrxY5wsLnMCqWP7weSLFC4mxh6fg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Kconfig: Print reverse dependencies in groups
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-02-19 5:47 GMT+09:00 Eugeniu Rosca <roscaeugeniu@gmail.com>:
> From: Eugeniu Rosca <erosca@de.adit-jv.com>
>
> Hello Masahiro, Ulf, Petr and all,
>
> Here are a few words about the motivation behind this patch series.
>
> First, the reason I got in touch with Kconfig is to optimize the
> configuration of automotive kernels, as well as to align the kernel
> configuration across a number of platforms. In the context of kernel
> optimization, one of the primary goals is to filter out any features
> that are not mentioned in the platform requirements.
>
> Surprisingly or not, disabling a CONFIG option (which is assumed to
> be unneeded) may be not so trivial. Especially it is not trivial, when
> this CONFIG option is selected by a dozen of other configs. Before the
> moment commit 1ccb27143360 ("kconfig: make "Selected by:" and
> "Implied by:" readable") was submitted by Petr and eventually popped
> up in v4.16-rc1, it was an absolute pain to break down the "Selected by"
> reverse dependency expression in order to identify all those configs
> which select (IOW *do not allow disabling*) a certain feature (assumed
> to be not needed).
>
> This patch series tries to make one step further and puts at users'
> fingertips the revdep top level OR sub-expressions grouped/clustered by
> the tristate value they evaluate to. This should allow the users to
> directly concentrate on and tackle the active reverse dependencies,
> which imho are the only ones that matter for a given ARCH and for a
> given defconfig (nevertheless we still print all of them).
>
> Changes v3->v4 (fixed review findings from Ulf):
> - Remove redundant default cases in switch constructs.
> - Remove gettext _() tokens in str_append() calls.
> - Aggregate code repetitions in expr_print_revdep().
>
> Changes v2->v3:
> - Switch from reverse dependencies prefixed by their tristate value to
>   reverse dependencies grouped by the tristate value they evaluate to.
> - Skip printing "{Selected,Implied} by [y|m|n]:" if there are no top
>   level OR tokens/sub-expressions that evaluate to y|m|n (suggested
>   by Petr).
> - Use [1] as template for updating the interface/prototype of
>   __expr_print() (suggested by Ulf).
>
> Changes v1->v2:
> - Don't skip the =n reverse dependency OR tokens, since some users might
>   still need this information (suggested by Ulf).
> - Instead of using "Selected by" for active tokens only, use it for all
>   OR tokens, but specify the tristate value of each token as prefix
>   (suggested by Masahiro).
>
> [1] https://marc.info/?l=linux-kbuild&m=151777006005199&w=4
>
> Eugeniu Rosca (3):
>   kconfig: Print reverse dependencies on new line consistently
>   kconfig: Prepare for printing reverse dependencies in groups
>   kconfig: Print reverse dependencies in groups
>
>  scripts/kconfig/expr.c      | 102 +++++++++++++++++++++++++++++++++++++-------
>  scripts/kconfig/expr.h      |  11 ++++-
>  scripts/kconfig/lkc_proto.h |   1 +
>  scripts/kconfig/menu.c      |  37 +++++++++++-----
>  4 files changed, 124 insertions(+), 27 deletions(-)
>


I do not like this implementation.
The code is super ugly, the diff-stat is too much than needed.

Please rewrite the code within 20 lines.




-- 
Best Regards
Masahiro Yamada
