Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:53892 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbeJ3AMW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Oct 2018 20:12:22 -0400
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w9TFN72f011531
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Oct 2018 00:23:08 +0900
Received: by mail-vs1-f52.google.com with SMTP id 124so5476861vsp.12
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Oct 2018 08:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20181028125510.9346-1-petr.vorel@gmail.com>
In-Reply-To: <20181028125510.9346-1-petr.vorel@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 30 Oct 2018 00:22:30 +0900
Message-ID: <CAK7LNARccwZNM=4jOEoHNiZ-x4FrzNDG6uZtEXhQMA0z7Pnunw@mail.gmail.com>
Subject: Re: [PATCH 1/1] merge_config.sh: Replace prefix CONFIG_ with any prefix
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, m.patzlaff@pilz.de, afshin.nasser@gmail.com, angelo.compagnucci@gmail.com, Arnout Vandecappelle <arnout@mind.be>, Matthew Weber <matthew.weber@rockwellcollins.com>, John Stultz <john.stultz@linaro.org>

On Sun, Oct 28, 2018 at 9:55 PM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> merge_config.sh expect prefix from kernel: CONFIG_.
> There some other projects using kconfig with different prefixes
> (e.g. buildroot: BR2_ prefix). While there could be some option
> to specify config prefix [1] [2], IMHO it's better to not specify
> prefix (expect just any prefix).
>
> [1] http://patchwork.ozlabs.org/patch/824051/
> [2] https://patchwork.ozlabs.org/patch/988890/
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> Suggested-by: Marcel Patzlaff <m.patzlaff@pilz.de>
> ---
> NOTE: I deliberately left prefix CONFIG_ in comment:
> # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set


I'd like to filter "CONFIG_", "BR2_", or whatever specified prefix.

Some fragment files (e.g. arch/x86/configs/xen.config)
have comment lines.

Matching '# ' + arbitrary string
might hit comment lines accidentally.



The kconfig binary checks the environment variable 'CONFIG_'
to override the default prefix:
https://github.com/torvalds/linux/blob/v4.19/scripts/kconfig/lkc.h#L28


For similarity, how about doing in the same way in merge_config.sh ?


Does the following work for you ?
(you can pass CONFIG_=BR2_ to merge_config.sh)




diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 67d1314..391ee6c 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -90,6 +90,10 @@ if [ -z "$KCONFIG_CONFIG" ]; then
        fi
 fi

+# Check the environment variable "CONFIG_" for the config option prefix.
+# If unset, the default is "CONFIG_".
+: ${CONFIG_=CONFIG_}
+
 INITFILE=$1
 shift;

@@ -99,7 +103,7 @@ if [ ! -r "$INITFILE" ]; then
 fi

 MERGE_LIST=$*
-SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
+SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_}[a-zA-Z0-9_]*\)[= ].*/\2/p"
 TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)

 echo "Using $INITFILE as base"






--
Best Regards
Masahiro Yamada
