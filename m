Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:43503 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S934318Ab2JXUft (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 24 Oct 2012 16:35:49 -0400
Message-ID: <5088510B.7010400@xenotime.net>
Date: Wed, 24 Oct 2012 13:35:23 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: [Q] CONFIG_INOTIFY_USER doesn't get enabled upon defconfig
References: <Pine.LNX.4.64.1210241057590.31768@axis700.grange>
In-Reply-To: <Pine.LNX.4.64.1210241057590.31768@axis700.grange>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Love <rlove@rlove.org>, linux-kbuild@vger.kernel.org

On 10/24/2012 03:02 AM, Guennadi Liakhovetski wrote:

> Hi all
> 
> CONFIG_INOTIFY_USER is marked default "y" in fs/notify/inotify/Kconfig, 
> so, I would expect it to be enabled by any make *_defconfig. However, for 
> some reason, this doesn't happen (e.g. with mackerel_defconfig), which 
> leads to non-functional udev, among others. Any idea why this could be 
> happening?

I think it's because arch/arm/configs/mackerel_defconfig says:

# CONFIG_INOTIFY_USER is not set

-- 
~Randy
