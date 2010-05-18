Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta05.emeryville.ca.mail.comcast.net ([76.96.30.48]:52654 "EHLO
	qmta05.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753313Ab0ERXTM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 May 2010 19:19:12 -0400
Date: Tue, 18 May 2010 16:15:58 -0700
From: matt mooney <mfm@muteddisk.com>
Subject: Re: [PATCH 1/3 v2] kbuild/makefiles.txt: Fix examples and content
Message-ID: <20100518231558.GD8700@haskell.muteddisk.com>
References: <1273603385-20587-1-git-send-email-mfm@muteddisk.com>
 <20100512043038.GB5358@cr0.nay.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20100512043038.GB5358@cr0.nay.redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: =?iso-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong@gmail.com>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, mec@shout.net, kai@tp1.ruhr-uni-bochum.de, sam@ravnborg.org, jengelh@gmx.de

Hi Randy, 

Should I resubmit these and include the main list? Or just forget about
them? 

Thanks,
matt

On 12:30 Wed 12 May     , Américo Wang wrote:
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
> 
> Thanks.
> 
