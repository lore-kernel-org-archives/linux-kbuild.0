Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from b.ns.miles-group.at ([95.130.255.144]:1663 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1756299Ab3IZKo5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Sep 2013 06:44:57 -0400
Message-ID: <52441025.9030308@nod.at>
Date: Thu, 26 Sep 2013 12:44:53 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
Subject: Re: [PATCH 2/8] um: Do not use SUBARCH
References: <1377073172-3662-1-git-send-email-richard@nod.at> <1377073172-3662-3-git-send-email-richard@nod.at> <CALkWK0kCrQ9hPABD_XQ9QFG-vByP+xZWZs+RkVK77+cX7Odz7g@mail.gmail.com>
In-Reply-To: <CALkWK0kCrQ9hPABD_XQ9QFG-vByP+xZWZs+RkVK77+cX7Odz7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ramkumar Ramachandra <artagnon@gmail.com>
Cc: linux-arch@vger.kernel.org, Michal Marek <mmarek@suse.cz>, geert@linux-m68k.org, ralf@linux-mips.org, lethal@linux-sh.org, Jeff Dike <jdike@addtoit.com>, gxt@mprc.pku.edu.cn, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net

Am 26.09.2013 12:40, schrieb Ramkumar Ramachandra:
> Richard Weinberger wrote:
> Forget all that. What matters is that upstream is still broken, and
> users are suffering. Despite a reasonable fix being submitted in July.

So, what exactly is broken in upstream?
make defconfig works as it always did.

make defconfig ARCH=um SUBARCH=x86 (or SUBARCH=i386) will create a defconfig for 32bit.
make defconfig ARCH=um SUBARCH=x86_64 one for 64bit.

Thanks,
//richard
