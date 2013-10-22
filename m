Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0173.hostedemail.com ([216.40.44.173]:39160 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754307Ab3JVQgK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Oct 2013 12:36:10 -0400
Message-ID: <1382459764.2041.90.camel@joe-AO722>
Subject: Re: [PATCH 1/3] kbuild: Increase kallsyms max symbol length
From: Joe Perches <joe@perches.com>
Date: Tue, 22 Oct 2013 09:36:04 -0700
In-Reply-To: <1382456783-22826-2-git-send-email-andi@firstfloor.org>
References: <1382456783-22826-1-git-send-email-andi@firstfloor.org>
	 <1382456783-22826-2-git-send-email-andi@firstfloor.org>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Mario <jmario@redhat.com>, Andi Kleen <ak@linux.intel.com>

On Tue, 2013-10-22 at 08:46 -0700, Andi Kleen wrote:
> From: Joe Mario <jmario@redhat.com>
> 
> [AK: This seems like a ticking time bomb even without LTO,
> so should be merged now. It causes very weird problems.
> Thanks to Joe for tracking them down.]
> 
> With the added postfixes that LTO adds for local
> symbols, the longest name in the kernel overflows
> the namebuf[KSYM_NAME_LEN] array by two bytes.  That name is:
> __pci_fixup_resumePCI_VENDOR_ID_SERVERWORKSPCI_DEVICE_ID_SERVERWORKS_HT1000SBquirk_disable_broadcom_boot_interrupt.1488004.672802
> 
> Double the max symbol name length.
[]
> diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
> index 6883e19..711a50f 100644
> --- a/include/linux/kallsyms.h
> +++ b/include/linux/kallsyms.h
> @@ -9,7 +9,7 @@
>  #include <linux/kernel.h>
>  #include <linux/stddef.h>
>  
> -#define KSYM_NAME_LEN 128
> +#define KSYM_NAME_LEN 256

Doesn't doubling seems a tad excessive given the
silly length of that symbol above?


