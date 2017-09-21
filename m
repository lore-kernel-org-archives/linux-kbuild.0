Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:57695 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751636AbdIUBPb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 21:15:31 -0400
MIME-Version: 1.0
In-Reply-To: <20170920173246.11224-1-shuahkh@osg.samsung.com>
References: <20170920173246.11224-1-shuahkh@osg.samsung.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 21 Sep 2017 10:14:38 +0900
Message-ID: <CAK7LNAT1A2fRE5O9w-ySbVUL2jDD9HZYyZWTOyRQm0L46cPWqA@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: kselftest and kselftest-clean fail for make
 O=dir case
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Michal Marek <mmarek@suse.com>, shuah@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, emilio.lopez@collabora.co.uk, Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>, ebiederm@xmission.com, Tim.Bird@sony.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org

2017-09-21 2:32 GMT+09:00 Shuah Khan <shuahkh@osg.samsung.com>:
> kselftest and kselftest-clean targets fail when object directory is
> specified to relocate objects. Fix it so it can find the source tree
> to build from.
>
> make O=/tmp/kselftest_top kselftest
>
> make[1]: Entering directory '/tmp/kselftest_top'
> make[2]: Entering directory '/tmp/kselftest_top'
> make[2]: *** tools/testing/selftests: No such file or directory.  Stop.
> make[2]: Leaving directory '/tmp/kselftest_top'
> ./linux-kselftest/Makefile:1185: recipe for target
> 'kselftest' failed
> make[1]: *** [kselftest] Error 2
> make[1]: Leaving directory '/tmp/kselftest_top'
> Makefile:145: recipe for target 'sub-make' failed
> make: *** [sub-make] Error 2
>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
> Changes v1 - V2: Simplify logic - use $(srctree)
>
>  Makefile | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 64cbc66cebca..7735fc32b24e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1169,14 +1169,13 @@ headers_check: headers_install
>
>  # ---------------------------------------------------------------------------
>  # Kernel selftest
> -
>  PHONY += kselftest
>  kselftest:
> -       $(Q)$(MAKE) -C tools/testing/selftests run_tests
> +       $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
>
>  PHONY += kselftest-clean
>  kselftest-clean:
> -       $(Q)$(MAKE) -C tools/testing/selftests clean
> +       $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests clean
>
>  PHONY += kselftest-merge
>  kselftest-merge:
> --

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>




-- 
Best Regards
Masahiro Yamada
