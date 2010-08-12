Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:45639 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759109Ab0HLJO4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Aug 2010 05:14:56 -0400
Message-ID: <4C63BB09.80609@suse.cz>
Date: Thu, 12 Aug 2010 11:12:41 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] kconfig: fixes for savedefconfig
References: <20100812071023.GA11148@merkur.ravnborg.org>
In-Reply-To: <20100812071023.GA11148@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, =?ISO-8859-1?Q?Arve_Hj=F8nnev=E5g?= <arve@android.com>

On 12.8.2010 09:10, Sam Ravnborg wrote:
> While tranislating all remaining defconfigs in
> the kernel to the minimal format I encountered
> an issue where the resulting .config was not
> equal to the original.
> 
> This was tracked down to missing info in the saved defconfig file.
> 
> Arve reported another problem with tristate choice that was
> reproduceable with a small config sample.
> 
> The followng patches fixes both issues.
> There is no outstanding issue with respect to savedefconfig.

Applied, thanks a lot Sam!

Michal
