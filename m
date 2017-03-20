Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:35650 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753491AbdCTKNH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Mar 2017 06:13:07 -0400
Date: Mon, 20 Mar 2017 10:13:15 +0000
From: Will Deacon <will.deacon@arm.com>
Subject: Re: kbuild/mkspec: Fix architectures where KBUILD_IMAGE isn't a full
 path
Message-ID: <20170320101315.GB17263@arm.com>
References: <1489276762-22280-1-git-send-email-trini@konsulko.com>
 <20170315145118.GA30463@bill-the-cat>
 <39bd8ad9-ce11-3d81-95a9-235ceaded812@suse.com>
 <20170315153755.GR19897@bill-the-cat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170315153755.GR19897@bill-the-cat>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tom Rini <trini@konsulko.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>

On Wed, Mar 15, 2017 at 11:37:55AM -0400, Tom Rini wrote:
> On Wed, Mar 15, 2017 at 04:03:44PM +0100, Michal Marek wrote:
> > Dne 15.3.2017 v 15:51 Tom Rini napsal(a):
> > > I found https://patchwork.kernel.org/patch/9442211/ today and I see that
> > > it was brought up again just before I sent my patch.  I just want to
> > > point out that 9442211 doesn't address arm, arc, and sh and they will
> > > still not have a functional rpm build target.  This is at least probably
> > > important for arm.  Of course all of those could also be addressed with
> > > a patch similar to 9442211, and my main concern is making sure
> > > everything gets fixed one way or another.  Thanks!
> > 
> > The patch is 1/6 of a series that also covers other architectures, but
> > patchwork won't should you the rest of the thread. Have a look here for
> > instance: https://lkml.org/lkml/2016/11/22/750.
> 
> Ah, OK, thanks.  I'll just hope it gets in soon, I like being able to
> easily drop new kernels in on my arm64 box :)

I'll pick up the arm64 patch this week (I was on holiday last week).

Will
