Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41469 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753054AbcDUXND (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Apr 2016 19:13:03 -0400
Subject: Re: [PATCH] scripts: kconfig: implement a sort method
References: <1461269279-11525-1-git-send-email-felipe.balbi@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <57195E78.9080805@infradead.org>
Date: Thu, 21 Apr 2016 16:12:56 -0700
MIME-Version: 1.0
In-Reply-To: <1461269279-11525-1-git-send-email-felipe.balbi@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Felipe Balbi <balbif@gmail.com>, yann.morin.1998@free.fr
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, balbi@kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>

On 04/21/16 13:07, Felipe Balbi wrote:
> With a growing amount of Kernel configuration, it's
> getting ever more difficult to find anything on
> menuconfig. Because of that, implement mergesort for
> kconfig to make it a little easier for anybody
> building kernels.

Hi,

Please explain the problem and the solution better.  I don't
get it.

Thanks.

> Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> ---
> 
> let me know if you folks prefer to turn this into
> default behavior and drop the extra Sort button, I
> didn't wanna be too disruptive by default and, at
> least for now, kept Kconfig as it is and require
> user to either press '.' or move cursor to the Sort
> button and hit ENTER.
> 
> Anyway, give it a go and let me know if anybody sees
> any issues which I might have missed.
> 
>  scripts/kconfig/lxdialog/menubox.c | 18 +++++----
>  scripts/kconfig/mconf.c            | 83 +++++++++++++++++++++++++++++++++++---
>  2 files changed, 89 insertions(+), 12 deletions(-)


-- 
~Randy
