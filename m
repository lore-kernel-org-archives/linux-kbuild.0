Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60485 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755361AbdCJVUv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Mar 2017 16:20:51 -0500
Subject: Re: [PATCH 1/6] arm64: Use full path in KBUILD_IMAGE definition
References: <20161122213434.14788-1-mmarek@suse.com>
 <20170310175854.GE18894@arm.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <ba676afc-d52c-5f79-1794-2b751054bf53@suse.com>
Date: Fri, 10 Mar 2017 22:20:43 +0100
MIME-Version: 1.0
In-Reply-To: <20170310175854.GE18894@arm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org

Dne 10.3.2017 v 18:58 Will Deacon napsal(a):
> Hi Michael,
> 
> On Tue, Nov 22, 2016 at 10:34:29PM +0100, Michal Marek wrote:
>> The KBUILD_IMAGE variable is used by the rpm and deb-pkg targets, which
>> expect it to point to the image file in the build directory. The
>> builddeb script has a workaround for architectures which only provide
>> the basename, but let's provide a clean interface for packaging tools.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will.deacon@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Signed-off-by: Michal Marek <mmarek@suse.com>
>> ---
>>  arch/arm64/Makefile | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> What's the plan for this patch? I'm happy to merge it,

Great, please merge it.


> but I don't see
> the rest of the series queued anywhere.

I'll see what remains and submit the rest via the kbuild tree.

Thanks,
Michal
