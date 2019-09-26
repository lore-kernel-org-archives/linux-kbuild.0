Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:38035 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727409AbfIZDZ0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Sep 2019 23:25:26 -0400
MIME-Version: 1.0
References: <cover.1569452305.git.skhan@linuxfoundation.org> <b3c50f4c726df521039f57295b53349227f629d9.1569452305.git.skhan@linuxfoundation.org>
In-Reply-To: <b3c50f4c726df521039f57295b53349227f629d9.1569452305.git.skhan@linuxfoundation.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 26 Sep 2019 12:24:41 +0900
Message-ID: <CAK7LNATCFF9ERTwtPnnbMLGv++NJ_5zXxB0=NWHdSGrYADj3ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests: Add kselftest_install target to main Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Michal Marek <michal.lkml@markovi.net>, "Cc: Shuah Khan" <shuah@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Shuah,



On Thu, Sep 26, 2019 at 8:05 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> Add kselftest_install target to install tests from the top level
> Makefile. This is to simplify kselftest use-cases for CI and
> distributions where build and test systems are different.
>
> This change addresses requests from developers and testers to add
> support for installing kselftest from the main Makefile.
>
> In addition, make the install directory the same when install is
> run using "make kselftest_install" or by running kselftest_install.sh.
> Also fix the INSTALL_PATH variable conflict between main Makefile.
>
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

So, if these two patches were applied, we would see the following:


PHONY += kselftest_build
kselftest_build:
        $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests all

PHONY += kselftest
kselftest:
        $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests

PHONY += kselftest_install
kselftest_install:
        $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests install

PHONY += kselftest-clean
kselftest-clean:
        $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests clean


I do not want to see this endless crap addition just for
changing the working directory to $(srctree)/tools/testing/selftests



Why don't you use pattern rule?
Those will be reduced into the two rules.



PHONY += kselftest
kselftest:
        $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests

kselftest-%: FORCE
        $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests $*



This also avoids your inconsistency about
"kselftest-" vs "kselftest_".


Given the existing "kselftest-clean" and "kselftest-merge",
"kselftest_build" and "kselftest_install"
(using an underscore instead of n hyphen)
would add needless confusion.


-- 
Best Regards
Masahiro Yamada
