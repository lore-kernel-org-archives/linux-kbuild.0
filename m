Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:42179 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752724AbaFBJ33 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Jun 2014 05:29:29 -0400
Received: by mail-la0-f51.google.com with SMTP id gf5so2383919lab.38
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Jun 2014 02:29:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1401691657-12222-1-git-send-email-ijc@hellion.org.uk>
References: <1401691657-12222-1-git-send-email-ijc@hellion.org.uk>
Date: Mon, 2 Jun 2014 12:29:27 +0300
Message-ID: <CAGNsrLB+6Z12=ysQBd8AgvCaZCF+WRZ9T7S7WfAXa5Wapt8F1g@mail.gmail.com>
Subject: Re: [PATCH] deb-pkg: Apply $(CROSS_COMPILE) when calling objcopy
From: Fathi Boudra <fathi.boudra@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Campbell <ijc@hellion.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, debian-kernel@lists.debian.org

On 2 June 2014 09:47, Ian Campbell <ijc@hellion.org.uk> wrote:
> Allows me to cross build an armhf package from amd64.
>
> Signed-off-by: Ian Campbell <ijc@hellion.org.uk>
> ---
>  scripts/package/builddeb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index f46e4dd..c22ab79 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -155,11 +155,11 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
>                         for module in $(find lib/modules/ -name *.ko); do
>                                 mkdir -p $(dirname $dbg_dir/usr/lib/debug/$module)
>                                 # only keep debug symbols in the debug file
> -                               objcopy --only-keep-debug $module $dbg_dir/usr/lib/debug/$module
> +                               ${CROSS_COMPILE}objcopy --only-keep-debug $module $dbg_dir/usr/lib/debug/$module
>                                 # strip original module from debug symbols
> -                               objcopy --strip-debug $module
> +                               ${CROSS_COMPILE}objcopy --strip-debug $module
>                                 # then add a link to those
> -                               objcopy --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $module
> +                               ${CROSS_COMPILE}objcopy --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $module
>                         done
>                 )
>         fi
> --
> 1.9.0

I submitted it a month ago. It's already applied to kbuild.git#misc:
http://www.spinics.net/lists/linux-kbuild/msg09273.html
