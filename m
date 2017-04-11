Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:35295 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751997AbdDKSxh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Apr 2017 14:53:37 -0400
Subject: Re: [PATCH] scripts: kconfig: implement a sort method
References: <20170411111227.20846-1-felipe.balbi@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7d017fc8-9e0b-f8a8-a877-edcc07c91949@infradead.org>
Date: Tue, 11 Apr 2017 11:53:36 -0700
MIME-Version: 1.0
In-Reply-To: <20170411111227.20846-1-felipe.balbi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Felipe Balbi <felipe.balbi@linux.intel.com>, yann.morin.1998@free.fr
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On 04/11/17 04:12, Felipe Balbi wrote:
> With a growing amount of Kernel configuration, it's
> getting ever more difficult to find anything on
> menuconfig. Because of that, implement mergesort for
> kconfig to make it a little easier for anybody
> building kernels.

Search works for me, but I don't mind Sort either.

Why only menuconfig?  Is it the one that you use mostly?

Any Help text for Sort?  or is it obvious what it does?  (no)


In an 80x25 terminal (window), the < Sort > option wraps around
past column 80.

I haven't looked at the source code (lately), but I think that it
would OK to not have the (extra) spaces inside the <...> brackets.
I.e., instead of
  │        <Select>    < Exit >    < Help >    < Save >    < Load >    < Sort  
   >
just have
  │        <Select>    <Exit>    <Help>    <Save>    <Load>    <Sort>

Or the <Select> does not need to be indented as much as it is.


And BTW, Yann made kconfig an orphan today. :(


> Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> ---
>  scripts/kconfig/lxdialog/menubox.c | 18 +++++----
>  scripts/kconfig/mconf.c            | 83 +++++++++++++++++++++++++++++++++++---
>  2 files changed, 89 insertions(+), 12 deletions(-)


-- 
~Randy
