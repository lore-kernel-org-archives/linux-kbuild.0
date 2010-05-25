Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:38345 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753837Ab0EYPdU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 May 2010 11:33:20 -0400
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Tue, 25 May 2010 08:33:17 -0700
Date: Tue, 25 May 2010 08:33:16 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH 1/3 v2] kbuild/makefiles.txt: Fix examples and content
Message-Id: <20100525083316.dba6892a.rdunlap@xenotime.net>
In-Reply-To: <20100512043038.GB5358@cr0.nay.redhat.com>
References: <1273603385-20587-1-git-send-email-mfm@muteddisk.com>
	<20100512043038.GB5358@cr0.nay.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?ISO-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong@gmail.com>
Cc: matt mooney <mfm@muteddisk.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, mec@shout.net, kai@tp1.ruhr-uni-bochum.de, sam@ravnborg.org, jengelh@gmx.de

On Wed, 12 May 2010 12:30:38 +0800 Américo Wang wrote:

> On Tue, May 11, 2010 at 11:43:05AM -0700, matt mooney wrote:
> >
> >Update section 3.3 Loadable module goals - obj-m, from $(<module_name>-objs) to $(<module_name>-y) for easier addition of conditional objects to the module. The examples are also updated to reflect the current state of each Makefile used.
> >
> >Signed-off-by: matt mooney <mfm@muteddisk.com>
> 
> 
> The whole patchset looks good to me, so,
> 
> Reviewed-by: WANG Cong <xiyou.wangcong@gmail.com>
> 
> But note that I am not a native English-speaker, let's
> see what Randy will say.


Added all 3 patches to my patch queue.  Thanks, Matt.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
