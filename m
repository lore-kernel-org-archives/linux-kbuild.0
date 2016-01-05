Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44603 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753472AbcAEARu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Jan 2016 19:17:50 -0500
Message-ID: <1451953068.12837.6.camel@ellerman.id.au>
Subject: Re: [PATCH v3 0/2] Create specific kconfig for kselftest
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 05 Jan 2016 11:17:48 +1100
In-Reply-To: <568A4AC5.1050703@linaro.org>
References: <1450346273-31633-1-git-send-email-bamvor.zhangjian@linaro.org>
	 <1450395897.19696.0.camel@ellerman.id.au>
	 <CAFy1USTM1B_pWuPUun+yrhcHspNUOm9_2giWwJgOaJvgWDsiEA@mail.gmail.com>
	 <1451883424.14373.1.camel@ellerman.id.au> <568A4AC5.1050703@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, linux-api <linux-api@vger.kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, yann.morin.1998@free.fr, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Mark Brown <broonie@kernel.org>, dvhart@infradead.org, mmarek@suse.comlinux-kbuild@vger.kernel.org

On Mon, 2016-01-04 at 18:34 +0800, Bamvor Jian Zhang wrote:
> On 01/04/2016 12:57 PM, Michael Ellerman wrote:
> [...]
> >
> > No I meant Makefile, the very top level Makefile.
> >
> > There is already a kselftest target in there (line 1077), I meant we would add
> > a kselftest-mergeconfig target in there.
>
> I am trying to add it in top level Makefile, it says:

> $ make kselftest-mergeconfig
> make[1]: *** No rule to make target 'kselftest-mergeconfig'.  Stop.
> Makefile:553: recipe for target 'kselftest-mergeconfig' failed
> make: *** [kselftest-mergeconfig] Error 2
>
> It works when I get rid of the config at the end of this target. So, I guess
> that this is because the "%config" in this Makefile. How should I overwrite
> this wildcard?

Yes you're right that is the problem.

If you call it 'kselftest-merge' it works.

I'm not sure there's an easy way to fix it. For now maybe just call it
'kselftest-merge' or something, to avoid the name clash.

CC'ing Michal in case he has any ideas.

cheers

