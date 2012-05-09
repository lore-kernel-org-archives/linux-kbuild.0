Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:41884 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758008Ab2EIPvs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 May 2012 11:51:48 -0400
Message-ID: <4FAA9207.8070709@intel.com>
Date: Wed, 09 May 2012 08:49:27 -0700
From: "H. Peter Anvin" <h.peter.anvin@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 02/23] x86, realmode: realmode.bin infrastructure
References: <1336501366-28617-1-git-send-email-jarkko.sakkinen@intel.com> <1336501366-28617-3-git-send-email-jarkko.sakkinen@intel.com>
In-Reply-To: <1336501366-28617-3-git-send-email-jarkko.sakkinen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Joseph Cihula <joseph.cihula@intel.com>, Shane Wang <shane.wang@intel.com>, hpa@linux.intel.com

On 05/08/2012 11:22 AM, Jarkko Sakkinen wrote:
> diff --git a/arch/x86/realmode/Makefile b/arch/x86/realmode/Makefile
> new file mode 100644
> index 0000000..f22a4f8
> --- /dev/null
> +++ b/arch/x86/realmode/Makefile
> @@ -0,0 +1,20 @@
> +#
> +# arch/x86/realmode/Makefile
> +#
> +# This file is subject to the terms and conditions of the GNU General Public
> +# License.  See the file "COPYING" in the main directory of this archive
> +# for more details.
> +#
> +#
> +
> +subdir- := rm
> +
> +obj-y += rmpiggy.o
> +
> +$(obj)/rmpiggy.o: $(obj)/rm/realmode.relocs $(obj)/rm/realmode.bin
> +
> +$(obj)/rm/realmode.bin: FORCE
> +	$(Q)$(MAKE) $(build)=$(obj)/rm $@
> +
> +$(obj)/rm/realmode.relocs: FORCE
> +	$(Q)$(MAKE) $(build)=$(obj)/rm $@

OK, this bit seems to cause serious problems.  Specifically, this
invokes the rm/ Makefile twice, and they end up doing two independent
builds in parallel, stepping on each other in the process.

Sam, Michal: do you have any suggestions for how to do the above better?

	-hpa
