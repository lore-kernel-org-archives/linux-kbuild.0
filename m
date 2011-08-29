Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]:50753 "EHLO
	TX2EHSOBE008.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754454Ab1H2RR7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Aug 2011 13:17:59 -0400
Date: Mon, 29 Aug 2011 19:17:50 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: Kernel almost hangs when CONFIG_DRM_RADEON=y
Message-ID: <20110829171750.GD2025@gere.osrc.amd.com>
References: <20110829141612.GB2025@gere.osrc.amd.com>
 <1790021880.1347470.1314632844694.JavaMail.root@zmail02.collab.prod.int.phx2.redhat.com>
 <20110829155501.GC2025@gere.osrc.amd.com>
 <CACqU3MVZek9TCcZEAbJXZqy9JZs3cbzNVJpwjOhS8OoKqH_YZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CACqU3MVZek9TCcZEAbJXZqy9JZs3cbzNVJpwjOhS8OoKqH_YZQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: David Airlie <airlied@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Pavel Ivanov <paivanof@gmail.com>, Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@gmail.com>, linux-kbuild@vger.kernel.org

On Mon, Aug 29, 2011 at 12:10:45PM -0400, Arnaud Lacombe wrote:
> do you want something ala:
> 
> config EXTRA_FIRMWARE
>     string
>     default ""
>     append "FOO" if BAR
>     append "FOZ" if BAZ
> 
> or maybe a new type "list" which would behave as a comma/space separated value.
> 
> config EXTRA_FIRMWARE
>     list "bla"
>     append "FOO" if BAR
>     append "FOZ" if BAZ

Yeah, actually Kyle's note (http://lkml.org/lkml/2011/8/29/289) makes
much more sense for linux and the whole firmware in the kernel deal.
So it looks like the drivers should be taught to wait for userspace to
appear instead of Kconfig helping them build-in firmware. And then we
should go ahead and remove CONFIG_EXTRA_FIRMWARE completely...

Thanks.

-- 
Regards/Gruss,
Boris.

