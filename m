Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57813 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755302Ab0CKKCS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Mar 2010 05:02:18 -0500
Message-ID: <4B98BFA8.2000001@suse.cz>
Date: Thu, 11 Mar 2010 11:02:16 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/Makefile.lib: Align the output of LZO
References: <a04018f332b27cc76806012bce73d688ff6903ad.1268300521.git.wuzhangjin@gmail.com>
In-Reply-To: <a04018f332b27cc76806012bce73d688ff6903ad.1268300521.git.wuzhangjin@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wu Zhangjin <wuzhangjin@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Albin Tonnerre <albin.tonnerre@free-electrons.com>

On 11.3.2010 10:42, Wu Zhangjin wrote:
> From: Wu Zhangjin <wuzhangjin@gmail.com>
> 
> The output of LZO is not aligned with the other output:
>   ...
>   CC      drivers/usb/mon/usbmon.mod.o
>   LZO    arch/mips/boot/compressed/vmlinux.lzo
>   ...
> 
> This patch fixes it.
> 
> Signed-off-by: Wu Zhangjin <wuzhangjin@gmail.com>

Thanks, applied.

Michal
