Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:54036 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753118Ab0C2Vdg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Mar 2010 17:33:36 -0400
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Mon, 29 Mar 2010 14:33:34 -0700
Date: Mon, 29 Mar 2010 14:33:34 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: Is root kernel parameter expected to be the first one or
 something?
Message-Id: <20100329143334.9b295e1d.rdunlap@xenotime.net>
In-Reply-To: <4BB1108C.60202@example.com>
References: <4B9FD5D1.8040203@example.com>
	<4B9FDAF3.9010804@xenotime.net>
	<4BB10A9D.7000506@example.com>
	<20100329133809.af969338.rdunlap@xenotime.net>
	<4BB1108C.60202@example.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: piotr@hosowicz.com
Cc: linux-kbuild@vger.kernel.org

On Mon, 29 Mar 2010 22:41:48 +0200 Piotr Hosowicz wrote:

> Randy Dunlap wrote:
> > On Mon, 29 Mar 2010 22:16:29 +0200 Piotr Hosowicz wrote:
> > 
> >> Hello,
> >>
> >> Today I had built a new next kernel with these parameters. I did not get 
> >> what I expected
> > 
> > I don't think I understand your question.
> > What did you expect?
> 
> I expected higher resolution console, smaller font etc

Boy was I confused.  I thought that your question was about the root=
kernel boot parameter.

Well, there are several questions to be asked.  and one more comment.

1.  what video (framebuffer) driver are you using?
2.  is it builtin the kernel image or is it a loadable module?
3.  have you read Documentation/svga.txt and Documentation/fb/{fbcon,vesafb}.txt ?


And my comment is that your question (about video) would be better on the
linux-fbdev@vger.kernel.org mailing list.  It's not about kbuild/kconfig,
unless kconfig is not saving the build parameters correctly...


---
~Randy
