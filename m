Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35664 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759022AbcLBMdm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Dec 2016 07:33:42 -0500
Subject: Re: [PATCH v4] Fixes for compiling with clang
References: <20161126182006.24815-1-pefoley2@pefoley.com>
 <20161128064446.4892-1-pefoley2@pefoley.com>
 <b4a882d3-6125-e7b7-6c60-901fabfc23d9@suse.com>
 <CAOFdcFMTQbkE4ODTmrxq2dkzkNV8PXcMD0V3UhXyL62xvhgTGA@mail.gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <d419e823-8321-94d2-6f14-eac68e007eba@suse.com>
Date: Fri, 2 Dec 2016 13:33:39 +0100
MIME-Version: 1.0
In-Reply-To: <CAOFdcFMTQbkE4ODTmrxq2dkzkNV8PXcMD0V3UhXyL62xvhgTGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Foley <pefoley2@pefoley.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Behan Webster <behanw@converseincode.com>

On 2016-12-01 19:13, Peter Foley wrote:
> On Tue, Nov 29, 2016 at 6:22 AM, Michal Marek <mmarek@suse.com> wrote:
>> Dne 28.11.2016 v 07:44 Peter Foley napsal(a):
>> This adds new -Wno-* options also for the gcc case, is there a reason
>> for this? Also, the -Wno-missing-field-initializers option is not
>> available in some old gccs, so we would need a HOSTCC equivalent of
>> cc-disable-warning.
>>
>> Michal
> 
> It appeared that the conditional was simply reversed, as
> -fno-delete-null-pointer-checks is only supported by gcc, and
> explicitly not supported by clang.
> (see https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/Makefile?id=61163efae02040f66a95c8ed17f4407951ba58fa)
> It could be that the fno-delete-null-pointer-checks option was simply
> misplaced, and the Wno-options should still be guarded by if(clang),
> would that be a better approach?

I think so. The -Wno-* options had not been present before clang support
was added. It really looks like the -fno-delete-null-pointer-checks
should not be there. Added Behan to CC.

Michal

