Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:18347 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751391AbdITJ2u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 05:28:50 -0400
MIME-Version: 1.0
In-Reply-To: <1505211091-19295-1-git-send-email-paolo.pisati@canonical.com>
References: <1505211091-19295-1-git-send-email-paolo.pisati@canonical.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 20 Sep 2017 18:28:03 +0900
Message-ID: <CAK7LNAS0ieC+e0v+Gq-84_bJk-vZL2QHpRAjVePiPUEsVsJJ6g@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Pisati <paolo.pisati@canonical.com>
Cc: Michal Marek <mmarek@suse.com>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Paolo,


2017-09-12 19:11 GMT+09:00 Paolo Pisati <paolo.pisati@canonical.com>:

> @@ -0,0 +1,14 @@
> +name: kernel
> +version: KERNELRELEASE
> +summary: Linux kernel
> +description: The upstream Linux kernel
> +grade: stable
> +confinement: strict
> +type: kernel
> +
> +parts:
> +  kernel:
> +    plugin: kernel
> +    source: SRCTREE
> +    source-type: git
> +    kconfigfile: SRCTREE/.config


Other targets such as rpm-pkg and deb-pkg
work without relying on git.

However, snap-pkg every time does "git clone", so
changes added to the source tree, but not committed yet,
are not reflected to the package.

Is it possible to work with a tarball,
like other targets do?




-- 
Best Regards
Masahiro Yamada
