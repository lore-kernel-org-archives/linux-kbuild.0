Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38945 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1762440AbcINXtx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Sep 2016 19:49:53 -0400
Date: Thu, 15 Sep 2016 09:49:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] powerpc/64: whitelist unresolved modversions CRCs
Message-ID: <20160915094951.20af4df5@canb.auug.org.au>
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

This fixes my build problems.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

-- 
Cheers,
Stephen Rothwell
