Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm15-vm7.access.bullet.mail.gq1.yahoo.com ([216.39.63.193]:21711
	"EHLO nm15-vm7.access.bullet.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752890Ab3IQXSa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Sep 2013 19:18:30 -0400
Message-ID: <5238E35F.3060206@att.net>
Date: Tue, 17 Sep 2013 18:18:55 -0500
From: Daniel Santos <danielfsantos@att.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] lib: Add .config options for error strings in printks
References: <1379459317-13046-1-git-send-email-daniel.santos@pobox.com> <1379459317-13046-3-git-send-email-daniel.santos@pobox.com>
In-Reply-To: <1379459317-13046-3-git-send-email-daniel.santos@pobox.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Santos <daniel.santos@pobox.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>

On 09/17/2013 06:08 PM, danielfsantos@att.net wrote:
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -58,6 +58,7 @@ config DYNAMIC_DEBUG
>   	  implicitly compiles in all pr_debug() and dev_dbg() calls, which
>   	  enlarges the kernel text size by about 2%.
>   
> +
>   	  If a source file is compiled with DEBUG flag set, any
>   	  pr_debug() calls in it are enabled by default, but can be
>   	  disabled at runtime as below.  Note that DEBUG flag is
> @@ -113,6 +114,58 @@ config DYNAMIC_DEBUG
whoops! Please ignore this carriage return! :)

