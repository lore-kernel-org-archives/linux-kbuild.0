Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:55130 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752661AbdCBEOv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Mar 2017 23:14:51 -0500
Date: Thu, 2 Mar 2017 04:05:40 +0000
From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v2] staging: mkspec: added aarch64 ifarch case.
Message-ID: <20170302040539.GB15590@arm.com>
References: <20170301172414.GA29242@mtbu-fae-softiron1.internal.tilera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170301172414.GA29242@mtbu-fae-softiron1.internal.tilera.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: James Tau <jtau@mellanox.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.com, catalin.marinas@arm.com, cmetcalf@mellanox.com

On Wed, Mar 01, 2017 at 09:24:14AM -0800, James Tau wrote:
> Patch attempting to fix native 'make rpm' build on ARM64 machines by adding an
> "ifarch aarch64" case.  Without it, build fails because the 'cp ...' in the
> default case can't find the built image.
> 
> Signed-off-by: James Tau <jtau@mellanox.com>
> ---
>  scripts/package/mkspec | 4 ++++
>  1 file changed, 4 insertions(+)

Is this the same issue that was fixed by:

http://lkml.kernel.org/r/20161122213434.14788-1-mmarek@suse.com

?

I was assuming that Michael was going to queue those, but I could be wrong.

Will
