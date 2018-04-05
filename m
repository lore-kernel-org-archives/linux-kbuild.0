Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:17351 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752764AbeDECaG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Apr 2018 22:30:06 -0400
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com [209.85.213.53]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id w352Tqbe029410
        for <linux-kbuild@vger.kernel.org>; Thu, 5 Apr 2018 11:29:53 +0900
Received: by mail-vk0-f53.google.com with SMTP id n124so13599152vkd.6
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Apr 2018 19:29:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180404195625.24657-1-dzickus@redhat.com>
References: <20180404195625.24657-1-dzickus@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 5 Apr 2018 11:29:11 +0900
Message-ID: <CAK7LNAQ78HHOz1fu2==_nZDzUTuxRZLHuFu6yu1C354xH8Y8fA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: add support for new option 'listnewdefconfig'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Don Zickus <dzickus@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-04-05 4:56 GMT+09:00 Don Zickus <dzickus@redhat.com>:
> We at Red Hat/Fedora have generally tried to have a per file breakdown of
> every config option we set.  This makes it easy for us to add new options
> when they are exposed and keep a changelog of why they were set.
>
> A Fedora example is here:
>   https://src.fedoraproject.org/cgit/rpms/kernel.git/tree/configs/fedora/generic
>
> Using various merge scripts, we build up a config file and run it through
> 'make listnewconfig' and 'make oldnoconfig'.   The idea is to print out new
> config options that haven't been manually set and use the default until
> a patch is posted to set it properly.
>
> To speed things up, it would be nice to make it easier to generate a
> patch to post the default setting.  The output of 'make listnewconfig'
> has two issues that limit us:
>
> - it doesn't provide the default value
> - it doesn't provide the new 'choice' options that get flagged in
>   'oldconfig'


So, 'listnewconfig' is a subset of 'listnewdefconfig'.

I wonder if we could extend 'listnewconfig' to meet your demands
instead of adding the new target.

I do not know why the current listnewconfig skips choice values.

(Anybody who relies on the current format of listnewconfig?)


Looks like the current listnewconfig
(it was 'nonint_oldconfig' before renaming)
was contributed from Fedora/RedHat side.


commit f0778c8c41001783d4074e34efc7d3e632d87ee3
Author: Aristeu Rozanski <aris@redhat.com>
Date:   Thu May 6 12:48:34 2010 -0400

    kconfig: introduce nonint_oldconfig and loose_nonint_oldconfig

    This patch has been around for a long time in Fedora and Red Hat Enterprise
    Linux kernels and it may be useful for others. The nonint_oldconfig target
    will fail and print the unset config options while
loose_nonint_oldconfig will
    simply let the config option unset. They're useful in distro kernel packages
    where the config files are built using a combination of smaller
config files.

    Arjan van de Ven wrote the initial nonint_config and Roland
McGrath added the
    loose_nonint_oldconfig.

    Signed-off-by: Arjan van de Ven <arjan@redhat.com> [defunct email]
    Whatevered-by: Kyle McMartin <kyle@redhat.com>
    Acked-by: Arjan van de Ven <arjan@linux.intel.com>
    Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
    Signed-off-by: Aristeu Rozanski <aris@redhat.com>
    [mmarek: whitespace fixes]
    Signed-off-by: Michal Marek <mmarek@suse.cz>




> This patch adds a new command 'listnewdefconfig' that does exactly
> what 'listnewconfig' does but addresses the above two issues too.
>
> This allows us to run a script
>
> make listnewdefconfig | rhconfig-tool -o patches; git send-email patches/
>
> The output of 'make listnewconfig':
>
> CONFIG_NET_EMATCH_IPT
> CONFIG_IPVLAN
> CONFIG_ICE
> CONFIG_NET_VENDOR_NI
> CONFIG_IEEE802154_MCR20A
> CONFIG_IR_IMON_DECODER
> CONFIG_IR_IMON_RAW
>
> The output of 'make listnewdefconfig':
>
> CONFIG_KERNEL_XZ=n #choice
> CONFIG_KERNEL_LZO=n #choice


What for '#choice' comment ?


> CONFIG_NET_EMATCH_IPT=n
> CONFIG_IPVLAN=n
> CONFIG_ICE=n
> CONFIG_NET_VENDOR_NI=y
> CONFIG_IEEE802154_MCR20A=n
> CONFIG_IR_IMON_DECODER=n
> CONFIG_IR_IMON_RAW=n
>
> Signed-off-by: Don Zickus <dzickus@redhat.com>
> ---
-- 
Best Regards
Masahiro Yamada
