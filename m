Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726345AbgD2IuI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Apr 2020 04:50:08 -0400
Date: Wed, 29 Apr 2020 10:49:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 0/2] Build ORC fast lookup table in scripts/sorttable tool
Message-ID: <20200429084933.GF13592@hirez.programming.kicks-ass.net>
References: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Huaixin Chang <changhuaixin@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, bp@alien8.de, hpa@zytor.com, jpoimboe@redhat.com, luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com, tglx@linutronix.de, x86@kernel.org, yamada.masahiro@socionext.com

On Wed, Apr 29, 2020 at 02:46:24PM +0800, Huaixin Chang wrote:
> Move building of fast lookup table from boot to sorttable tool. This saves us
> 6380us boot time on Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz with cores.

And what does it add to the build time?
