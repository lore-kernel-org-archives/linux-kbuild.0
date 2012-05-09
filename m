Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:64156 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755393Ab2EIHM5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 May 2012 03:12:57 -0400
Message-ID: <4FAA18F1.6080508@redhat.com>
Date: Wed, 09 May 2012 09:12:49 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
MIME-Version: 1.0
Subject: Re: [PATCH 04/23] x86, realmode: Move reboot_32.S to unified realmode
 code
References: <1336501366-28617-1-git-send-email-jarkko.sakkinen@intel.com> <1336501366-28617-5-git-send-email-jarkko.sakkinen@intel.com>
In-Reply-To: <1336501366-28617-5-git-send-email-jarkko.sakkinen@intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Joseph Cihula <joseph.cihula@intel.com>, Shane Wang <shane.wang@intel.com>, hpa@linux.intel.com

Il 08/05/2012 20:22, Jarkko Sakkinen ha scritto:
> +	xorl	%ecx, %ecx
> +	movl	%cr0, %edx
> +	andl	$0x00000011, %edx
> +	orl	$0x60000000, %edx
> +	movl	%edx, %cr0
> +	movl	%ecx, %cr3
> +	movl	%cr0, %edx
> +	andl	$0x60000000, %edx	/* If no cache bits -> no wbinvd */

Shouldn't this be a testl?

> +	jz	2f
> +	wbinvd
> +2:
> +	andb	$0x10, %dl

... because otherwise this is really a mov $0, %edx and it sounds wrong.
 It doesn't really matter, nobody really uses bit 4 of CR0 anymore,
still would be nice to fix it.

> +	movl	%edx, %cr0

Paolo
