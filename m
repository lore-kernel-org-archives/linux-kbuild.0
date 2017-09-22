Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:33133 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751726AbdIVE1Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Sep 2017 00:27:16 -0400
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com [209.85.161.176]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id v8M4R5cW018916
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Sep 2017 13:27:05 +0900
Received: by mail-yw0-f176.google.com with SMTP id w22so5414396ywa.13
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Sep 2017 21:27:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAqcGHk71o00QQEWOg_zObNHmWfB2hR3+fh9K32XEEpe5qsvZg@mail.gmail.com>
References: <20170816110855.6021-1-riku.voipio@linaro.org> <20170816110855.6021-2-riku.voipio@linaro.org>
 <CAK7LNAQtAq3zhP0zY8pW=wdka23UKqJWyqPuXnk0m4LEfT6EKw@mail.gmail.com> <CAAqcGHk71o00QQEWOg_zObNHmWfB2hR3+fh9K32XEEpe5qsvZg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 22 Sep 2017 13:26:24 +0900
Message-ID: <CAK7LNARX93df8Q45njqL0PQ=Lkkgw1z04rJoiTfuxrHwXTHGvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>, Ben Hutchings <ben@decadent.org.uk>, Jim Davis <jim.epost@gmail.com>

Hi Riku


2017-09-20 19:35 GMT+09:00 Riku Voipio <riku.voipio@linaro.org>:

>>>  bindeb-pkg: FORCE
>>> -       $(MAKE) KBUILD_SRC=
>>> -       +$(call cmd,builddeb)
>>> +       $(call cmd,updateversion)
>>> +       $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
>>> +       dpkg-buildpackage -r"fakeroot -u" -a$$(cat debian/arch) -b
>>
>> IIUC, the whole of dpkg-buildpackage process is run under "fakeroot -u".
>> Correct?
>
> No, dpkg-buildpackage will call -rfakeroot only for binary-arch targets


You are right.
I tested this and seems to work so.


>> It will internally invokes "make intdeb-pkg",
>> then $(call cmd,builddeb) calls "fakeroot -u" recursively,
>> this seems redundant to me.
>
> it wont, since it's checks if if = 0 - which will be true under. But
> all this can be indeed removed
> if we can call builddeb directly as discussed below.


Right.
I missed that id -u is already 0 in this case.



>> Maybe,
>>
>>      dpkg-buildpackage -r"$(KBUILD_PKG_ROOTCMD)" -a$$(cat debian/arch) -b
>>
>> makes more sense?
>
>>> +
>>> +cat <<EOF > debian/rules
>>> +#!/usr/bin/make -f
>>> +
>>> +ifneq (,\$(filter parallel=%,\$(DEB_BUILD_OPTIONS)))
>>> +    NUMJOBS = \$(patsubst parallel=%,%,\$(filter parallel=%,\$(DEB_BUILD_OPTIONS)))
>>> +    MAKEFLAGS += -j\$(NUMJOBS)
>>> +endif
>>> +
>>> +build:
>>> +       \$(MAKE) ARCH=${ARCH}
>>> +
>>> +binary-arch:
>>> +       \$(MAKE) KDEB_VERSION=${version} ARCH=${ARCH} intdeb-pkg
>>
>>
>> Hmm, instead of recursive make,
>> is it possible to run scripts/package/debuild directly here?
>
> I though it's not possible because I need variables from kernel make.
> Now that I check, I see only  $KCONFIG_CONFIG which I think we can
> assume to be .config. Also some ARCH and SRCARCH variables which are
> hardcoded anyways in mkdebian. I'll try.


Most of the variables are exported from the top-level Makefile.

KCONFIG_CONFIG  ?= .config
export KCONFIG_CONFIG

....

export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC


So, I think you can refer $KCONFIG_CONFIG from scripts/package/debuild.
(I have not tested it, though...)




-- 
Best Regards
Masahiro Yamada
