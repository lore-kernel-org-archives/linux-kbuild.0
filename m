Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:51497 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757431AbcBSSWm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Feb 2016 13:22:42 -0500
Subject: Re: [PATCH] arm64, kbuild: make "make install" not depend on vmlinux
References: <1455861950-21832-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNATs3Xkp05cYsUAhUtQuvrpo=dUe5R6+bQjcLdpPrG_S3w@mail.gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <56C75D6E.1020002@suse.cz>
Date: Fri, 19 Feb 2016 19:22:38 +0100
MIME-Version: 1.0
In-Reply-To: <CAK7LNATs3Xkp05cYsUAhUtQuvrpo=dUe5R6+bQjcLdpPrG_S3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Robert Richter <rric@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Dne 19.2.2016 v 18:29 Masahiro Yamada napsal(a):
> Just for clarification:
> 
> This patch has been applied to arm64 tree.
> 
> Michal,
> Just ignore this patch.

Sure. I assumed that a patch touching solely arch/arm* will go through
the respective arm tree.

Michal
