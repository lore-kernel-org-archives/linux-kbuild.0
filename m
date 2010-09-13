Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:51720 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751696Ab0IMOyP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Sep 2010 10:54:15 -0400
Message-ID: <4C8E3B15.2040807@suse.cz>
Date: Mon, 13 Sep 2010 16:54:13 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Kconfig add reportoldconfig and updateoldconfig targets
References: <20100913143830.GK2919@stro.at>
In-Reply-To: <20100913143830.GK2919@stro.at>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, Bastian Blank <waldi@debian.org>, Ben Hutchings <ben@decadent.org.uk>

On 13.9.2010 16:38, maximilian attems wrote:
> From: Bastian Blank <waldi@debian.org>
> 
> This patch has been around for a looong time in Debian kernels
> and might be useful for others. The reportoldconfig target
> is used for the official linux-2.6 image builds. It outputs
> to the build log the changed configs and sets any unset to
> it's default. 

2.6.26-rc1 has listnewconfig and oldnoconfig, which do more or less the
same. And I think we have enough *config targets already, so unless
there is a problem that is hard to solve with the current kconfig plus
some scripting (*), I'd vote for not adding further special-purpose
*config targets.

(*) Such as the defconfig cleanup that took hours with a brute-force
python script, but was easily achieved by a patch that added the
savedefconfig target.

Michal
