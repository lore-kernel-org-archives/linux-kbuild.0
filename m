Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:54538 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751580AbcIVMsO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Sep 2016 08:48:14 -0400
Subject: Re: [PATCH] powerpc/64: whitelist unresolved modversions CRCs
References: <20160914024507.8759-1-npiggin@gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <92e4d1b9-0607-6523-43e0-7a5a6fc4de72@suse.cz>
Date: Thu, 22 Sep 2016 14:48:11 +0200
MIME-Version: 1.0
In-Reply-To: <20160914024507.8759-1-npiggin@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>

On 2016-09-14 04:45, Nicholas Piggin wrote:
> These are a symptom of CRC generation failure in generic
> build code, and not powerpc specific.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> 
> Hi Michal,
> 
> Please merge this via your trees with Al's patches.

Done, thanks for the patch.

Michal

