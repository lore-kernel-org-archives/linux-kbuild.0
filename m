Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60410 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753202Ab1JNWyu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Oct 2011 18:54:50 -0400
Message-ID: <4E98BDB8.2080403@suse.cz>
Date: Sat, 15 Oct 2011 00:54:48 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: strange build failure when kconfig symbol is bool but not when
 tristate
References: <4E98B845.8050009@xenotime.net>
In-Reply-To: <4E98B845.8050009@xenotime.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux kbuild list <linux-kbuild@vger.kernel.org>

On 15.10.2011 00:31, Randy Dunlap wrote:
> (my turn)
> 
> I have seen this randconfig build error 2-3 times in the past 3 months:
> (this one is from linux-next of 20111014.)
> 
> net/built-in.o: In function `unregister_8022_client':
> (.text+0x26157): undefined reference to `llc_sap_close'
> net/built-in.o: In function `register_8022_client':
> (.text+0x261b6): undefined reference to `llc_sap_open'
> net/built-in.o: In function `p8022_request':
> p8022.c:(.text+0x261e5): undefined reference to `llc_build_and_send_ui_pkt'
> net/built-in.o: In function `snap_request':
> psnap.c:(.text+0x26487): undefined reference to `llc_build_and_send_ui_pkt'
> net/built-in.o: In function `snap_init':
> psnap.c:(.init.text+0xb22): undefined reference to `llc_sap_open'
> net/built-in.o: In function `snap_exit':
> psnap.c:(.exit.text+0x16): undefined reference to `llc_sap_close'
> 
> I finally found that if I change drivers/net/tokenring/Kconfig
> symbol TR from bool to tristate, the build completes successfully,
> but I don't understand why this is happening.

It seems that you have TR built-in, but LLC modular, i.e. the 'select
LLC' is not doing what it should. Can you attach the whole config?

Michal
