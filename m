Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:36145 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750732Ab0ELE0s (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 12 May 2010 00:26:48 -0400
Date: Wed, 12 May 2010 12:30:38 +0800
From: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH 1/3 v2] kbuild/makefiles.txt: Fix examples and content
Message-ID: <20100512043038.GB5358@cr0.nay.redhat.com>
References: <1273603385-20587-1-git-send-email-mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1273603385-20587-1-git-send-email-mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: matt mooney <mfm@muteddisk.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, mec@shout.net, kai@tp1.ruhr-uni-bochum.de, sam@ravnborg.org, jengelh@gmx.de

On Tue, May 11, 2010 at 11:43:05AM -0700, matt mooney wrote:
>
>Update section 3.3 Loadable module goals - obj-m, from $(<module_name>-objs) to $(<module_name>-y) for easier addition of conditional objects to the module. The examples are also updated to reflect the current state of each Makefile used.
>
>Signed-off-by: matt mooney <mfm@muteddisk.com>


The whole patchset looks good to me, so,

Reviewed-by: WANG Cong <xiyou.wangcong@gmail.com>

But note that I am not a native English-speaker, let's
see what Randy will say.

Thanks.
