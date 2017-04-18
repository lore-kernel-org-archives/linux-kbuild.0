Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:25419 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750758AbdDRObc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Apr 2017 10:31:32 -0400
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com [209.85.161.173]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id v3IEVDfU008285
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Apr 2017 23:31:14 +0900
Received: by mail-yw0-f173.google.com with SMTP id l189so70400993ywb.0
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Apr 2017 07:31:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170331130941.5250-4-riku.voipio@linaro.org>
References: <20170331130941.5250-1-riku.voipio@linaro.org> <20170331130941.5250-4-riku.voipio@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 18 Apr 2017 23:31:12 +0900
Message-ID: <CAK7LNAQT8pSjgW5ujnWWP3MKfU0=XnFKWVeNu-fx5NRRX0XgMg@mail.gmail.com>
Subject: Re: [PATCH 3/3] builddeb: add make fastdeb-pkg target
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>

Hi.


2017-03-31 22:09 GMT+09:00  <riku.voipio@linaro.org>:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> Currently, the deb-pkg and bindeb-pkg targets create multiple packages
> for the kernel binaries, headers, userspace headers and firmware.
>
> For developers who generate Debian packages as part of their development
> workflows, it's often not necessary to generate all these packages.
>
> Introduce new target, fastdeb-pkg, which only generates kernel packages.
> Re-order package build order so that kernel binary package is created
> first and we can exit cleanly unless generating rest packages with the
> old bindeb-pkg and deb-pkg targets.
>
> Cc: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> Tested-By: Jim Davis <jim.epost@gmail.com>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---


Before expanding this even more,
please help me understand this script.

Commit 3716001b implemented source package build
at the end of the builddeb script.
However, the binary packages are still built in its own way.
(So, debian/rules is not used in general workflows,
so we need to test it explicitly somehow.)

Why do not we create a source package first,
then build binary packages from it?


rpm-pkg does that way.
(generate a spec-file, then run rpmbuild)




-- 
Best Regards
Masahiro Yamada
