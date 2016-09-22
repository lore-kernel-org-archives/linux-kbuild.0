Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55013 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756686AbcIVMwL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Sep 2016 08:52:11 -0400
Subject: Re: linux-next: build failure after merge of the kbuild tree
References: <20160915160839.037798db@canb.auug.org.au>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <6d1714b2-0744-079a-ca28-b1e00e4ae767@suse.cz>
Date: Thu, 22 Sep 2016 14:52:09 +0200
MIME-Version: 1.0
In-Reply-To: <20160915160839.037798db@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, linux-kbuild@vger.kernel.org

On 2016-09-15 08:08, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the dax-misc tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
> 
> arch/powerpc/kernel/built-in.o: In function `__ksymtab_clear_pages':
> (___ksymtab+clear_pages+0x0): undefined reference to `clear_pages'
> 
> Caused by commit
> 
>   9445aa1a3062 ("ppc: move exports to definitions")
> 
> I applied the following fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 15 Sep 2016 16:04:12 +1000
> Subject: [PATCH] ppc: there is no clear_pages to export
> 
> Fixes: 9445aa1a3062 ("ppc: move exports to definitions")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied to kbuild.git#kbuild now.

Thanks,
Michal

