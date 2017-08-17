Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:38575 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752514AbdHQHpC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Aug 2017 03:45:02 -0400
Received: by mail-lf0-f47.google.com with SMTP id y15so26025272lfd.5
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Aug 2017 00:45:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+r1Zhi=cJTk7F31jP4xochL0UoF_qOm6EJcWwgQ+1ZSnmf75A@mail.gmail.com>
References: <20170816110855.6021-1-riku.voipio@linaro.org> <20170816110855.6021-2-riku.voipio@linaro.org>
 <CA+r1Zhi=cJTk7F31jP4xochL0UoF_qOm6EJcWwgQ+1ZSnmf75A@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Thu, 17 Aug 2017 10:45:00 +0300
Message-ID: <CAAqcGHkiEH9apwtPNxGtOMU5_e8dvAhNmPeOeyrwL7gai0VuHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, debian-kernel <debian-kernel@lists.debian.org>

Hi Jim,

Thanks for testing.

On 17 August 2017 at 03:24, Jim Davis <jim.epost@gmail.com> wrote:
> On Wed, Aug 16, 2017 at 4:08 AM,  <riku.voipio@linaro.org> wrote:
>>
>> deb-pkg and bindeb-pkg removing need for handrulled source/changes
>
> handrolled?
>
> A quick test on a Ubuntu 16.04 vm with these patches applied on top of
> 4.13-rc5 generated a few warnings that didn't appear before:

Before investing too much energy polishing, I'd like to know that
people find the approach reasonable. So in fact this patch was
intended more as an RFC.

> dpkg-architecture: warning: specified GNU system type i686-linux-gnu
> does not match CC system type x86_64-linux-gnu, try setting a correct
> CC environment variable
> dpkg-buildpackage: warning: debian/rules is not executable; fixing that
> make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent
> make rule.
> make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent
> make rule.
> make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent
> make rule.
> dpkg-genchanges: warning: package linux-firmware-image-4.13.0-rc5+ in
> control file but not in files list
> dpkg-genchanges: warning: package linux-image-4.13.0-rc5+-dbg in
> control file but not in files list

The last warning is becaues mkdebian make debian/control inone go.
With a little bit of added complexity we can only add the packages
that the builddeb script will generate. But then we have to keep the
logic in mkdebian and builddeb in sync.

Riku
