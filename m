Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33708 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751330Ab2BXWTP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Feb 2012 17:19:15 -0500
Message-ID: <4F480CDE.8010605@suse.cz>
Date: Fri, 24 Feb 2012 23:19:10 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Kconfig and toolchain dependencies
References: <4F2C51A5.1040800@zytor.com>
In-Reply-To: <4F2C51A5.1040800@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

Dne 3.2.2012 22:29, H. Peter Anvin napsal(a):
> Right now, we don't have a good way to encode toolchain dependencies in
> Kconfig.  This makes it hard to add optional features which depend on
> newer toolchain features.
> 
> If we just add them, then it breaks all*config and randconfig on
> platforms with the older toolchains unless the user manually adds
> exclusion rules.  This is bad for testing.
> 
> It seems relatively straightforward to do if we were to manifest some
> CONFIG_ variables based on the target toolchain, e.g.
> 
> CONFIG_GCC=0x040601

(sorry for the late reply)

It would be a bit tricky, because the toolchain version depends also on
CONFIG_CROSS_COMPILE. So Kconfig would need to know the semantics of
CONFIG_CROSS_COMPILE and CONFIG_GCC and the dependency of the latter on
the former.

Michal
