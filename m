Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:64854 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752622Ab3CEMHp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Mar 2013 07:07:45 -0500
Message-ID: <5135DF44.2040806@openwrt.org>
Date: Tue, 05 Mar 2013 13:04:20 +0100
From: Florian Fainelli <florian@openwrt.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 -next 5/5] Kconfig: Make x86 and arm kernels default
 to the LZ4-compressed
References: <1362484056-9778-1-git-send-email-kyungsik.lee@lge.com> <1362484056-9778-6-git-send-email-kyungsik.lee@lge.com>
In-Reply-To: <1362484056-9778-6-git-send-email-kyungsik.lee@lge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kyungsik Lee <kyungsik.lee@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@arm.linux.org.uk>, "H. Peter Anvin" <hpa@zytor.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org, celinux-dev@lists.celinuxforum.org, Nicolas Pitre <nico@fluxnic.net>, David Sterba <dsterba@suse.cz>, Nitin Gupta <nitingupta910@gmail.com>, Joe Millenbach <jmillenbach@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Michal Marek <mmarek@suse.cz>, hyojun.im@lge.com, chan.jeong@lge.com, raphael.andy.lee@gmail.com

Hello,

On 03/05/2013 12:47 PM, Kyungsik Lee wrote:
> This patch makes x86 and arm kernels default to the LZ4-compressed
> to test new LZ4 code in the linux-next. This is requested by
> Andrew Morton.

I do not think making this the default is good idea, because the lz4demo 
utility that you need to actually compress the kernel (used in patch 2) 
is not installed nor available by default on most systems, while gzip 
is. Considering that such a concern was already raised in your v2 
patchset, I am surprised to see this.
--
Florian
