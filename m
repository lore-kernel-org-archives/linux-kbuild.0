Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:46034 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1754153Ab0ESAFS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 May 2010 20:05:18 -0400
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Tue, 18 May 2010 17:05:15 -0700
Date: Tue, 18 May 2010 17:05:14 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH 1/3 v2] kbuild/makefiles.txt: Fix examples and content
Message-Id: <20100518170514.0260dd64.rdunlap@xenotime.net>
In-Reply-To: <20100518231558.GD8700@haskell.muteddisk.com>
References: <1273603385-20587-1-git-send-email-mfm@muteddisk.com>
	<20100512043038.GB5358@cr0.nay.redhat.com>
	<20100518231558.GD8700@haskell.muteddisk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: matt mooney <mfm@muteddisk.com>
Cc: =?ISO-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong@gmail.com>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, mec@shout.net, kai@tp1.ruhr-uni-bochum.de, sam@ravnborg.org, jengelh@gmx.de

On Tue, 18 May 2010 16:15:58 -0700 matt mooney wrote:

> Hi Randy, 
> 
> Should I resubmit these and include the main list? Or just forget about
> them? 

Hi Matt,
You should remind me about them.
I'll take care of them.  Thanks.


> Thanks,
> matt
> 
> On 12:30 Wed 12 May     , Américo Wang wrote:
> > On Tue, May 11, 2010 at 11:43:05AM -0700, matt mooney wrote:
> > >
> > >Update section 3.3 Loadable module goals - obj-m, from $(<module_name>-objs) to $(<module_name>-y) for easier addition of conditional objects to the module. The examples are also updated to reflect the current state of each Makefile used.
> > >
> > >Signed-off-by: matt mooney <mfm@muteddisk.com>
> > 
> > 
> > The whole patchset looks good to me, so,
> > 
> > Reviewed-by: WANG Cong <xiyou.wangcong@gmail.com>
> > 
> > But note that I am not a native English-speaker, let's
> > see what Randy will say.
> > 
> > Thanks.
> > 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
