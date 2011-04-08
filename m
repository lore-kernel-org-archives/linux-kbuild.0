Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpoproxy1-pub.bluehost.com ([69.89.21.11]:41769 "HELO
	cpoproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1757775Ab1DHTvS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Apr 2011 15:51:18 -0400
Date: Fri, 8 Apr 2011 12:51:10 -0700
From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH] move some .pci_fixup_* sections into .init
Message-ID: <20110408125110.52aa90c4@jbarnes-desktop>
In-Reply-To: <4D5262C30200007800030F9C@vpn.id2.novell.com>
References: <4D5262C30200007800030F9C@vpn.id2.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@novell.com>
Cc: linux-kbuild@vger.kernel.org, mingo@elte.hu, tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, hpa@zytor.com

On Wed, 09 Feb 2011 08:47:47 +0000
"Jan Beulich" <JBeulich@novell.com> wrote:

> .pci_fixup_final is only used from .init.text, and hence can (along
> with the respective handler functions) reside in .init.*.
> 
> Several other .pci_fixup_* sections are needed only during boot and
> suspend/resume, and can therefore be moved into .init.* if
> !CONFIG_PM_OPS.
> 
> While generally section mismatch checking is being turned on by this
> patch for all of .pci_fixup_*, for .pci_fixup_header it is being
> suppressed for the moment as it caused way too much fallout.
> Theoretically, all respective handlers must get their __init/__devinit
> removed, as this gets processed from a non-__init, non-__devinit
> function.
> 
> This also adds a previously missing comma in the definition of
> ALL_INIT_DATA_SECTIONS.
> 
> Signed-off-by: Jan Beulich <jbeulich@novell.com>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Jesse Barnes <jbarnes@virtuousgeek.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@elte.hu>

This didn't apply for me, but I'd be happy to take the PCI parts, can
you re-send against my linux-next branch (assuming it's not already
applied to some other tree).

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center
