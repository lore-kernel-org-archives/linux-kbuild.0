Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53441 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751885AbbLQXo6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Dec 2015 18:44:58 -0500
Message-ID: <1450395897.19696.0.camel@ellerman.id.au>
Subject: Re: [PATCH v3 0/2] Create specific kconfig for kselftest
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 18 Dec 2015 10:44:57 +1100
In-Reply-To: <1450346273-31633-1-git-send-email-bamvor.zhangjian@linaro.org>
References: <1450346273-31633-1-git-send-email-bamvor.zhangjian@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, linux-api@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, shuahkh@osg.samsung.com, yann.morin.1998@free.fr, khilman@linaro.org, tyler.baker@linaro.org, broonie@kernel.org, dvhart@infradead.org

On Thu, 2015-12-17 at 17:57 +0800, Bamvor Jian Zhang wrote:

> There is a discussion about improving the usability of kselftest by
> creating test-specific kconfig in recent kernel Summit.
> 
> Patch 1 keep test-specific kconfig fragments inside each selftest so
> that merge_configs.sh could build up a kernel that can test the
> specific or all feature(s).
> 
> Patch 2 add config option(kselftest-mergeconfig) in make file as a
> helper to merge all the test config dependecies to .config.
> 
> Changes since v2:
> 1.  Fix the misuse of objtree and srctree in the
>     kselftest-mergeconfig target.
> 
> Changes since v1:
> 1.  Add kselftest-mergeconfig in scripts/kconfig/Makefile according
>     to the suggestion from Michael.

Sorry I only just noticed you put it in scripts/kconfig/Makefile. I meant for
it to go in Makefile, alongside the other kselftest targets.

cheers

