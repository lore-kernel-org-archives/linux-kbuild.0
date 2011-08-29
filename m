Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from darkcity.gna.ch ([195.226.6.51]:36775 "EHLO mail.gna.ch"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753977Ab1H2RqE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Aug 2011 13:46:04 -0400
Subject: Re: Kernel almost hangs when CONFIG_DRM_RADEON=y
From: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Date: Mon, 29 Aug 2011 19:38:26 +0200
In-Reply-To: <20110829171750.GD2025@gere.osrc.amd.com>
References: <20110829141612.GB2025@gere.osrc.amd.com>
	 <1790021880.1347470.1314632844694.JavaMail.root@zmail02.collab.prod.int.phx2.redhat.com>
	 <20110829155501.GC2025@gere.osrc.amd.com>
	 <CACqU3MVZek9TCcZEAbJXZqy9JZs3cbzNVJpwjOhS8OoKqH_YZQ@mail.gmail.com>
	 <20110829171750.GD2025@gere.osrc.amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Message-ID: <1314639506.30297.29.camel@thor.local>
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Arnaud Lacombe <lacombar@gmail.com>, David Airlie <airlied@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Pavel Ivanov <paivanof@gmail.com>, Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@gmail.com>, linux-kbuild@vger.kernel.org

On Mon, 2011-08-29 at 19:17 +0200, Borislav Petkov wrote: 
> On Mon, Aug 29, 2011 at 12:10:45PM -0400, Arnaud Lacombe wrote:
> > do you want something ala:
> > 
> > config EXTRA_FIRMWARE
> >     string
> >     default ""
> >     append "FOO" if BAR
> >     append "FOZ" if BAZ
> > 
> > or maybe a new type "list" which would behave as a comma/space separated value.
> > 
> > config EXTRA_FIRMWARE
> >     list "bla"
> >     append "FOO" if BAR
> >     append "FOZ" if BAZ
> 
> Yeah, actually Kyle's note (http://lkml.org/lkml/2011/8/29/289) makes
> much more sense for linux and the whole firmware in the kernel deal.
> So it looks like the drivers should be taught to wait for userspace to
> appear [...]

What would be the point of building radeon into the kernel then? It's
not gonna be active before the module could be loaded...


-- 
Earthling Michel Dänzer           |                   http://www.amd.com
Libre software enthusiast         |          Debian, X and DRI developer
