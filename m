Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52757 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754647AbcIOEyS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Sep 2016 00:54:18 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: whitelist unresolved modversions CRCs
In-Reply-To: <20160914024507.8759-1-npiggin@gmail.com>
References: <20160914024507.8759-1-npiggin@gmail.com>
Date: Thu, 15 Sep 2016 14:54:14 +1000
Message-ID: <87a8f9oj9l.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>

Nicholas Piggin <npiggin@gmail.com> writes:

> These are a symptom of CRC generation failure in generic
> build code, and not powerpc specific.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
