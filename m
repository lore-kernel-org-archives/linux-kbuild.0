Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:49247 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754678Ab0I0K5H (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Sep 2010 06:57:07 -0400
Subject: Re: [RFC] kconfig: simplify select-with-unmet-direct-dependency
 warning
From: Catalin Marinas <catalin.marinas@arm.com>
In-Reply-To: <1285532648-28943-1-git-send-email-lacombar@gmail.com>
References: <1285532648-28943-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 27 Sep 2010 11:57:03 +0100
Message-ID: <1285585023.31188.7.camel@e102109-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Sun, 2010-09-26 at 21:24 +0100, Arnaud Lacombe wrote:
> This is an attempt to simplify the expressing printed by kconfig when a
> symbol is selected but still has direct unmet dependency.

I haven't analysed the patch but I gave it a try and the result is a bit
weird.

I tried an ARMv7 platform which has CPU_V7 enabled. This selects
CPU_32v6K. The simplified entries:

config CPU_V7
	bool "Support ARM V7 processor"
	select CPU_32v6K

I changed CPU_32v6K to not depend on CPU_V7:

config CPU_32v6K
	bool "Support ARM V6K processor extensions"
	depends on CPU_V6

There is another option which isn't set in my config, however it gets
reported:

config CPU_MMP2
	bool
	select CPU_V6
	select CPU_32v6K

And the error kbuild reports with this patch is:

warning: (CPU_V7 && CPU_MMP2) selects CPU_32v6K which has unmet direct
dependencies (CPU_V6)

The weird thing is the inclusion of CPU_MMP2 above. First of all, it
isn't set in my .config. Secondly, it selects CPU_V6 so CPU_32v6K would
have met its dependency.

-- 
Catalin

