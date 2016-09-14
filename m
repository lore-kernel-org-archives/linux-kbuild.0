Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36863 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758858AbcINXlQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Sep 2016 19:41:16 -0400
Date: Thu, 15 Sep 2016 09:41:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] powerpc/64: whitelist unresolved modversions CRCs
Message-ID: <20160915094113.3d4b1777@canb.auug.org.au>
In-Reply-To: <20160914024507.8759-1-npiggin@gmail.com>
References: <20160914024507.8759-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>

Hi Nick,

On Wed, 14 Sep 2016 12:45:07 +1000 Nicholas Piggin <npiggin@gmail.com> wrote:
>
> These are a symptom of CRC generation failure in generic
> build code, and not powerpc specific.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

OK, so I will use this as a merge fix patch for the kbuild tree today
(instead of the revert I have been doing).

-- 
Cheers,
Stephen Rothwell
