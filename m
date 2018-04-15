Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:30651 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751270AbeDOCQ1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Apr 2018 22:16:27 -0400
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com [209.85.217.172]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id w3F2GIQu012763
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Apr 2018 11:16:19 +0900
Received: by mail-ua0-f172.google.com with SMTP id d3so7726788uae.4
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Apr 2018 19:16:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201804140551.tpWKSeZ6%fengguang.wu@intel.com>
References: <201804140551.tpWKSeZ6%fengguang.wu@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 15 Apr 2018 11:15:37 +0900
Message-ID: <CAK7LNATz0vD8qUs5vA4QVmSkjk=VU5849FaHwtndDFdrDrcsCg@mail.gmail.com>
Subject: Re: [kbuild:kconfig-shell-v3 28/30] als.c:undefined reference to `latent_entropy'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-04-14 6:24 GMT+09:00 kbuild test robot <lkp@intel.com>:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig-shell-v3
> head:   cab76bbc77d9c585f35b5b9289850a3ae64bb879
> commit: b45650d6f720bf0bae5b6685098ad65552cacf7a [28/30] gcc-plugins: allow to enable GCC_PLUGINS for COMPILE_TEST
> config: s390-allmodconfig (attached as .config)
> compiler: s390x-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout b45650d6f720bf0bae5b6685098ad65552cacf7a
>         # save the attached .config to linux build tree
>         make.cross ARCH=s390
>
> All errors (new ones prefixed by >>):
>
>    arch/s390/kernel/als.o: In function `verify_facilities':
>>> als.c:(.init.text+0x24): undefined reference to `latent_entropy'
>    als.c:(.init.text+0xae): undefined reference to `latent_entropy'
>
> ---


Thanks.

I will squash the following fixup.



--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -30,7 +30,7 @@ static void conf_message(const char *fmt, ...)
 static const char *conf_filename;
 static int conf_lineno, conf_warnings;

-const char conf_defname[] = "arch/$ARCH/defconfig";
+const char conf_defname[] = "arch/$(ARCH)/defconfig";

 static void conf_warning(const char *fmt, ...)
 {





-- 
Best Regards
Masahiro Yamada
