Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:48284 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756286Ab1EFKSh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 May 2011 06:18:37 -0400
Subject: Re: [PATCH] Add $KERNELRELEASE to firmware install path
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 06 May 2011 11:18:32 +0100
In-Reply-To: <4DC3CA39.30806@suse.cz>
References: <20110505173939.GA20575@dev1756.snc6.facebook.com>
	 <4DC3CA39.30806@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1304677113.20656.2.camel@i7.infradead.org>
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arun Sharma <asharma@fb.com>, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On Fri, 2011-05-06 at 12:15 +0200, Michal Marek wrote:
> 
> On 5.5.2011 19:39, Arun Sharma wrote:
> > Useful in the presence of multiple kernels with different
> > firmware versions.
> 
> The changelog should also include the udev version that is able to find 
> the firmware there (v127, August 2008). FWIW, SUSE has been using this 
> patch since about that time, but we forgot to push this :-|. Anyway

No, this is fundamentally broken. Do not do it.

The firmware lives in /lib/firmware, not in /lib/firmware/$KERNELVERSION

There is *no* reason to move it there. If a given firmware file changes
in an incompatible way, it needs to have had a new filename *anyway*
(think of it like a new soname on a shared library).

And we shouldn't be updating the legacy firmware images in the kernel
*anyway*; nobody should be using those any more. They were *purely* for
backward compatibility. Everyone should be shipping the
linux-firmware.git images instead.

-- 
dwmw2

