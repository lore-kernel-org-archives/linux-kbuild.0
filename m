Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:49230 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758263AbcAKJ6B (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Jan 2016 04:58:01 -0500
Date: Mon, 11 Jan 2016 10:57:59 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Kernel build fails "cannot =?utf-8?Q?m?=
 =?utf-8?B?b3ZlIOKAmGFyY2gvYXJtL2Jvb3QvY29tcHJlc3NlZC8ucGlnZ3kuZ3ppcC5v?=
 =?utf-8?B?LnRtcCI=?= then succeeds
Message-ID: <20160111095758.GA22768@amd>
References: <20160111082603.GA24950@amd>
 <20160111085831.GA7012@amd>
 <569374A2.5050602@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <569374A2.5050602@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>

On Mon 2016-01-11 10:23:46, Michal Marek wrote:
> On 2016-01-11 09:58, Pavel Machek wrote:
> > Second try:
> > 
> >   AS      arch/arm/boot/compressed/piggy.gzip.o
> >   AS      arch/arm/boot/compressed/piggy.gzip.o
> > mv: cannot move ‘arch/arm/boot/compressed/.piggy.gzip.o.tmp’ to ‘arch/arm/boot/compressed/.piggy.gzip.o.cmd’: No such file or directory
> 
> I guess you are missing 3939f3345050 ("ARM: 8418/1: add boot image
> dependencies to not generate invalid images"). Without this fix and with
> 'make uImage zImage', two make instances try to produce a zImage at the
> same time.

Since it is known, I have just updated my scripts not to trigger it in
4.0 kernel. I'll try to get this project to move to newer kerenl, but
it needs realtime extensions so I'm not sure if/when we can do that.

Thanks!

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
