Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39373 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752077AbbAIQ1l (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Jan 2015 11:27:41 -0500
Message-ID: <54B00175.4050702@suse.cz>
Date: Fri, 09 Jan 2015 17:27:33 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] kbuild: refactor Makefiles related with cc-version
References: <1419485488-22336-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1419485488-22336-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org
Cc: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, "H. Peter Anvin" <hpa@linux.intel.com>, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Robert Richter <rrichter@cavium.com>, Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Andi Kleen <ak@linux.intel.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On 2014-12-25 06:31, Masahiro Yamada wrote:
> Masahiro Yamada (6):
>   kbuild: fix cc-ifversion macro
>   kbuild: do not add $(call ...) to invoke cc-version or cc-fullversion
>   kbuild,gcov: remove unnecessary workaround
>   kbuild,gcov: simplify kernel/gcov/Makefile
>   kbuild: allow cc-ifversion to have the argument for false condition
>   kbuild,gcov: simplify kernel/gcov/Makefile more

Applied to kbuild.git#kbuild, thanks.

Michal

