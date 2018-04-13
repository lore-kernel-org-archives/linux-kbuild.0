Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:64978 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751920AbeDMO2Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Apr 2018 10:28:25 -0400
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com [209.85.213.49]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id w3DESLC5031075
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Apr 2018 23:28:22 +0900
Received: by mail-vk0-f49.google.com with SMTP id h134so5471489vke.2
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Apr 2018 07:28:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180411191537.24070-1-dzickus@redhat.com>
References: <20180411191537.24070-1-dzickus@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 13 Apr 2018 23:27:40 +0900
Message-ID: <CAK7LNAQkKK55NCKckyv42ZK0GnNi5UQBBz_h4Cz_sgVB_suufg@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: extend output of 'listnewconfig'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Don Zickus <dzickus@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-04-12 4:15 GMT+09:00 Don Zickus <dzickus@redhat.com>:
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
>
> This patch extends 'listnewconfig' to address the above two issues.
>
> This allows us to run a script
>
> make listnewconfig | rhconfig-tool -o patches; git send-email patches/
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
> The new output of 'make listnewconfig':
>
> CONFIG_KERNEL_XZ=n
> CONFIG_KERNEL_LZO=n
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
> V2: roll listnewdefconfig changes into listnewconfig
>     (sorry for delay, thought there was a logic error with this)



Applied to linux-kbuild.  Thanks!




-- 
Best Regards
Masahiro Yamada
