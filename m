Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:33799 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751884AbdITPza (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 11:55:30 -0400
MIME-Version: 1.0
In-Reply-To: <1505912486-30251-1-git-send-email-yamada.masahiro@socionext.com>
References: <1505912486-30251-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 21 Sep 2017 00:54:41 +0900
Message-ID: <CAK7LNASAEwjY6bF8Su5+=uSmsGfks-txxxD1z__RXTKULqyknQ@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: (bin)rpm-pkg: fix version number handling
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Riku Voipio <riku.voipio@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-09-20 22:01 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The "Release:" field of the spec file is determined based on the
> .version file.
>
> However, the .version file is not copied to the source tar file.
> So, when we build the kernel from the source package, the UTS_VERSION
> always indicates #1.  This does not match with "rpm -q".
>
> The kernel UTS_VERSION and "rpm -q" do not agree for binrpm-pkg, either.
> Please note the kernel has already been built before the spec file is
> created.  Currently, mkspec invokes mkversion.  This script returns an
> incremented version.  So, the "Release:" field of the spec file is
> greater than the version in the kernel by one.
>
> For the source package build (where .version file is missing), we can
> give KBUILD_BUILD_VERSION=%{release} to the build command.
>
> For the binary package build, we can simply read out the .version file
> because it contains the version number that was used for building the
> kernel image.
>
> We can remove scripts/mkversion because scripts/package/Makefile need
> not touch the .version file.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v3:
>   - add ' 2>/dev/null || echo 1' in case .config is missing for rpm-pkg
>
> Changes in v2:
>   - Remove bogus comment in mkspec

Applied to linux-kbuild/fixes.


-- 
Best Regards
Masahiro Yamada
