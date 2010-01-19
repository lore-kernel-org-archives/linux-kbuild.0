Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60650 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751458Ab0ASRjN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Jan 2010 12:39:13 -0500
Subject: Re: [PATCH] kconfig: dont hardcode path to lsmod
From: Steven Rostedt <srostedt@redhat.com>
In-Reply-To: <8bd0f97a1001190923p6104acb4if5ec7225d549b713@mail.gmail.com>
References: <1263883920-17289-1-git-send-email-vapier@gentoo.org>
	 <20100119142545.GB3473@hack>
	 <8bd0f97a1001190923p6104acb4if5ec7225d549b713@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 Jan 2010 12:38:28 -0500
Message-Id: <1263922708.2737.139.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: =?ISO-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong@gmail.com>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

On Tue, 2010-01-19 at 12:23 -0500, Mike Frysinger wrote:
> On Tue, Jan 19, 2010 at 09:25, Américo Wang wrote:
> > On Tue, Jan 19, 2010 at 01:52:00AM -0500, Mike Frysinger wrote:
> >>The lsmod utility has always been installed into /bin with the newer
> >>module-init-tools package, so let lsmod be found via PATH instead of
> >>hardcoding the old modutils /sbin path.
> >>
> >
> > Some distro doesn't set /sbin to PATH, so for me a better solution
> > would be making PATH contain /sbin, and then use "lsmod".
> 
> read my changelog -- module-init-tools has always installed into /bin.
>  so what your distro does with /sbin doesnt matter.

I still have boxes where lsmod is in /sbin, but that's beside the point.

The patch I made checked for lsmod
in /sbin /bin /usr/bin /usr/sbin /usr/local/bin and /usr/local/sbin. I
could also make it do "lsmod" after that.

-- Steve


