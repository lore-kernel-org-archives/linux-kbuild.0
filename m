Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg004.nifty.com ([202.248.44.42]:17897 "EHLO
	conssluserg004-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752851AbbGXGKf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Jul 2015 02:10:35 -0400
MIME-Version: 1.0
In-Reply-To: <1437484956-23985-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1437484956-23985-1-git-send-email-srinivas.kandagatla@linaro.org>
Date: Fri, 24 Jul 2015 15:10:28 +0900
Message-ID: <CAK7LNAQKJXRkuWnSpyMtp95uOrGYmQkKYGoYwqw-5wUJLF9bFw@mail.gmail.com>
Subject: Re: [PATCH RFC] merge_config.sh: Add support to pass arguments to make
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Michal Marek <mmarek@suse.cz>, yann.morin.1998@free.fr, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Srinivas,


2015-07-21 22:22 GMT+09:00 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
> The issue is flags like ARCH can be passed to make via environment variable
> or at command line by passing "ARCH=" argument to make file. The former case
> works fine if used with merge_config but the later case would not work and
> resulting config file from merge_config is useless.
>
> I hit this issue when I started using config fragments on arm64 bit platform
> and I usually pass ARCH at the make command line.

Me too.  I always pass ARCH from the make command line.

I did a simple test, but I did not hit this issue.

I think both environment variables and make command line variables
are inherited to sub-processes.

I guess this patch is useful only when we directly invoke this shell script,
not via the top-level Makefile.  But, from your statement, I thought
you invoke merge_config.sh from the Makefile.  So, I cannot understand
what you mean.

Moreover, the top-level Makefile exports ARCH, so it is always an
environment variable.

See the line 408:
export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC




> As it is common for users like me to pass ARCH variable in command line,
> providing such flexiblity in merge_config makes more sense.
>
> This patch adds support to pass arguments to make file, without this patch the
> user has to set the enviroment variables which is not explicit.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>




-- 
Best Regards
Masahiro Yamada
