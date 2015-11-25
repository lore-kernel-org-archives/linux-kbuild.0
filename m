Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35542 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752493AbbKYMas (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 Nov 2015 07:30:48 -0500
Subject: Re: [PATCH 2/3] kbuild: Allow to specify composite modules with
 modname-m
References: <1446038742-13482-1-git-send-email-mmarek@suse.cz>
 <1446038742-13482-2-git-send-email-mmarek@suse.cz>
From: Michal Marek <mmarek@suse.com>
Message-ID: <5655A9F4.3020305@suse.com>
Date: Wed, 25 Nov 2015 13:30:44 +0100
MIME-Version: 1.0
In-Reply-To: <1446038742-13482-2-git-send-email-mmarek@suse.cz>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, daniel.vetter@ffwll.ch, Peter Chen <Peter.Chen@freescale.com>, linux-usb@vger.kernel.org, Joern Engel <joern@logfs.org>, Prasad Joshi <prasadjoshi.linux@gmail.com>, logfs@logfs.org

Dne 28.10.2015 v 14:25 Michal Marek napsal(a):
> From: Michal Marek <mmarek@suse.com>
> 
> This allows to write
> 
>   drm-$(CONFIG_AGP) += drm_agpsupport.o
> 
> without having to handle CONFIG_AGP=y vs. CONFIG_AGP=m. Only support
> this syntax for modules, since built-in code depending on something
> modular cannot work and init/Makefile actually relies on the current
> semantics. There are a few drivers which adapted to the current
> semantics out of necessity; these are fixed to also work when the
> respective subsystem is modular.
> 
> Cc: Peter Chen <Peter.Chen@freescale.com>
> Cc: linux-usb@vger.kernel.org
> Cc: Joern Engel <joern@logfs.org>
> Cc: Prasad Joshi <prasadjoshi.linux@gmail.com>
> Cc: logfs@logfs.org
> Signed-off-by: Michal Marek <mmarek@suse.com>
> ---
>  drivers/misc/ibmasm/ibmasm.h   | 2 +-
>  drivers/usb/chipidea/otg_fsm.h | 2 +-
>  fs/logfs/logfs.h               | 2 +-
>  scripts/Makefile.build         | 8 ++++++--
>  scripts/Makefile.lib           | 4 ++--
>  5 files changed, 11 insertions(+), 7 deletions(-)

I applied the whole series to kbuild.git#kbuild now.

Michal

