Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:42406 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751223AbaGGGvr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Jul 2014 02:51:47 -0400
Date: Mon, 7 Jul 2014 08:51:41 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 3/3] ARM: only select ARM_PATCH_PHYS_VIRT if MMU is
 enabled
Message-ID: <20140707065141.GC7827@pengutronix.de>
References: <1404295043-6661-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1404295043-6661-3-git-send-email-u.kleine-koenig@pengutronix.de>
 <20140702103512.GG32514@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140702103512.GG32514@n2100.arm.linux.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, Russell King - ARM Linux <linux@arm.linux.org.uk>

Hello,

(adding Yann and linux-kbuild to recipents)

On Wed, Jul 02, 2014 at 11:35:12AM +0100, Russell King - ARM Linux wrote:
> On Wed, Jul 02, 2014 at 11:57:23AM +0200, Uwe Kleine-König wrote:
> > This fixes the following warning:
> > 
> > 	warning: (ARCH_MULTIPLATFORM && ARCH_INTEGRATOR && ARCH_SHMOBILE_LEGACY) selects ARM_PATCH_PHYS_VIRT which has unmet direct dependencies (!XIP_KERNEL && MMU && (!ARCH_REALVIEW || !SPARSEMEM))
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> > I'm not sure why ARCH_MULTIPLATFORM appears here. It depends on MMU,
> > isn't selectable at the same time as ARCH_REALVIEW and XIP_KERNEL
> > depends on !ARCH_MULTIPLATFORM.
> 
> The message is extremely confusing.  It would read better if those
> && were || - because ARM_PATCH_PHYS_VIRT is selected by
> ARCH_MULTIPLATFORM _or_ ARCH_INTEGRATOR _or_ ARCH_SHMOBILE_LEGACY:
right, so there are two things that could be improved here. The
resolution I'd prefer is to make this two warnings:

   ARCH_INTEGRATOR selects ARM_PATCH_PHYS_VIRT which has unmet direct dependencies (!XIP_KERNEL && MMU)
   ARCH_SHMOBILE_LEGACY selects ARM_PATCH_PHYS_VIRT which has unmet direct dependencies (!XIP_KERNEL && MMU)

ARCH_REALVIEW cannot be selected at the same time as ARCH_INTEGRATOR or
ARCH_SHMOBILE_LEGACY, so that can be dropped. And as stated above
ARCH_MULTIPLATFORM isn't an issue.

This doesn't have the natural language problem that ARCH_MULTIPLATFORM
*and* ARCH_INTEGRATOR *and* ARCH_SHMOBILE_LEGACY all select
ARM_PATCH_PHYS_VIRT.

> config ARCH_MULTIPLATFORM
>         select ARM_PATCH_PHYS_VIRT
> 
> config ARCH_INTEGRATOR
>         select ARM_PATCH_PHYS_VIRT
> 
> config ARCH_SHMOBILE_LEGACY
>         select ARM_PATCH_PHYS_VIRT
> 
(For reference, the patch did:

	-       select ARM_PATCH_PHYS_VIRT
	+       select ARM_PATCH_PHYS_VIRT if MMU

for ARCH_INTEGRATOR and ARCH_SHMOBILE_LEGACY)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
