Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36839 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753395AbcFGJiZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Jun 2016 05:38:25 -0400
Subject: Re: Regression in "kbuild: fix if_change and friends to consider
 argument order"
References: <1465263518.3885.9.camel@intel.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <5756960E.5020706@suse.com>
Date: Tue, 7 Jun 2016 11:38:22 +0200
MIME-Version: 1.0
In-Reply-To: <1465263518.3885.9.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>, "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>

On 2016-06-07 03:38, Zanoni, Paulo R wrote:
> Hi
> 
> I recently noticed that alternating between "make" and "make targz-pkg"
> rebuilds the whole Kernel. This was not happening before. As a Kernel
> developer, my build/install/test environment heavily relies on the fact
> that "make targz-pkg" only quickly generates the tarball if everything
> is already built, so this change is heavily impacting my development
> environment.
> 
> I did some bisection and concluded that the first bad commit is:
> 
> commit 9c8fa9bc08f60ac657751daba9fccf828a36cfed
> Author: Masahiro Yamada
> Date:   Sat May 7 15:48:26 2016 +0900
>     kbuild: fix if_change and friends to consider argument order
> 
> I also verified that if I just revert this commit on top of the
> most recent tree it goes back to the usual behavior.
> 
> I read the commit message and it seems that some unneeded rebuilds are
> somewhat expected, but I can't understand why such a change in the
> command line like the one I did triggers everything to be rebuilt.
> IMHO, it really shouldn't. I also wonder that maybe the regression I'm
> experiencing was not expected in the original change, so maybe there's
> a way to keep the original improvement caused by the mentioned patch
> without the regression I'm experiencing.
> 
> How to reproduce (exact commands I used at every bisect step):
> 
> $ make tinyconfig
> $ time make -j4 V=2 # this should build things
> $ time make -j4 V=2 # just to make sure nothing will be rebuilt
> $ time make -j4 V=2 targz-pkg

I can reproduce it.

Michal

