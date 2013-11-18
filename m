Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58357 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751363Ab3KROJW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Nov 2013 09:09:22 -0500
Date: Mon, 18 Nov 2013 15:09:20 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] deb-pkg: Inhibit initramfs builders if
	CONFIG_BLK_DEV_INITRD is not set
Message-ID: <20131118140920.GA31395@pobox.suse.cz>
References: <1384484605.2771.13.camel@deadeye.wl.decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384484605.2771.13.camel@deadeye.wl.decadent.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Petr Baudis <pasky@ucw.cz>, linux-kbuild@vger.kernel.org, Thomas Lange <lange@debian.org>, debian-kernel@lists.debian.org, initramfs@vger.kernel.org

On Fri, Nov 15, 2013 at 03:03:25AM +0000, Ben Hutchings wrote:
> The kernel postinst hook for initramfs-tools will build an initramfs
> on installation unless $INITRD is set to 'No'.  make-kpkg generates a
> postinst script that sets this variable appropriately, but we don't.
> Set it based on CONFIG_BLK_DEV_INITRD.
> 
> This should also work with dracut when <http://bugs.debian.org/729622>
> is fixed.
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---

Applied to kbuild.git#misc, thanks.

Michal
