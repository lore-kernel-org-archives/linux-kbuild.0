Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:59905 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753382AbdCOPDs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Mar 2017 11:03:48 -0400
Subject: Re: kbuild/mkspec: Fix architectures where KBUILD_IMAGE isn't a full
 path
References: <1489276762-22280-1-git-send-email-trini@konsulko.com>
 <20170315145118.GA30463@bill-the-cat>
From: Michal Marek <mmarek@suse.com>
Message-ID: <39bd8ad9-ce11-3d81-95a9-235ceaded812@suse.com>
Date: Wed, 15 Mar 2017 16:03:44 +0100
MIME-Version: 1.0
In-Reply-To: <20170315145118.GA30463@bill-the-cat>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tom Rini <trini@konsulko.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>

Dne 15.3.2017 v 15:51 Tom Rini napsal(a):
> I found https://patchwork.kernel.org/patch/9442211/ today and I see that
> it was brought up again just before I sent my patch.  I just want to
> point out that 9442211 doesn't address arm, arc, and sh and they will
> still not have a functional rpm build target.  This is at least probably
> important for arm.  Of course all of those could also be addressed with
> a patch similar to 9442211, and my main concern is making sure
> everything gets fixed one way or another.  Thanks!

The patch is 1/6 of a series that also covers other architectures, but
patchwork won't should you the rest of the thread. Have a look here for
instance: https://lkml.org/lkml/2016/11/22/750.

Michal
