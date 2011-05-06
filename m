Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outappmail001.snc4.facebook.com ([66.220.144.155]:59710 "EHLO
	mx-out.facebook.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932212Ab1EFSon (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 May 2011 14:44:43 -0400
Date: Fri, 6 May 2011 11:44:38 -0700
From: Arun Sharma <asharma@fb.com>
Subject: Re: [PATCH] Add $KERNELRELEASE to firmware install path
Message-ID: <20110506184438.GA30417@dev1756.snc6.facebook.com>
References: <20110505173939.GA20575@dev1756.snc6.facebook.com>
 <4DC3CA39.30806@suse.cz>
 <1304677113.20656.2.camel@i7.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304677113.20656.2.camel@i7.infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Michal Marek <mmarek@suse.cz>, Arun Sharma <asharma@fb.com>, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On Fri, May 06, 2011 at 11:18:32AM +0100, David Woodhouse wrote:
> On Fri, 2011-05-06 at 12:15 +0200, Michal Marek wrote:
> > 
> > On 5.5.2011 19:39, Arun Sharma wrote:
> > > Useful in the presence of multiple kernels with different
> > > firmware versions.
> > 
> > The changelog should also include the udev version that is able to find 
> > the firmware there (v127, August 2008). FWIW, SUSE has been using this 
> > patch since about that time, but we forgot to push this :-|. Anyway
> 
> No, this is fundamentally broken. Do not do it.
> 
> The firmware lives in /lib/firmware, not in /lib/firmware/$KERNELVERSION

I'm not trying to change the way the kernel deals with firmware or
anything. Just trying to make the vanilla kernel packaging scripts more
usable for us.

Without this change, if you have two kernel rpms/debs from different
kernel versions installed, they'll result in a namespace conflict
(rpm/deb install will fail), which gets resolved by this patch.

  -Arun
