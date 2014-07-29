Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43618 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753377AbaG2MX4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jul 2014 08:23:56 -0400
Message-ID: <53D7925A.8080200@suse.cz>
Date: Tue, 29 Jul 2014 14:23:54 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Kernel binrpm produces brokes grub2 config
References: <53D774F9.3090305@nod.at>
In-Reply-To: <53D774F9.3090305@nod.at>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>, mike.marciniszyn@intel.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, OpenSUSE Kernel Team <opensuse-kernel@opensuse.org>

On 2014-07-29 12:18, Richard Weinberger wrote:
> Hi!
> 
> I'm not sure who to blame, but the below commit breaks the kernel binrpm target for me.
> It produces a faulty grub2 config.
> After installing such a kernel grub2 looks for vmlinuz-XY-rpm and initrd-XY-rpm.
> These files are not existing and the machine does no longer boot.
> Luckily an addition boot entry without the -rpm suffix exists, if remote access works
> one can recover the machine.
> 
> My question is, why do we need these copy of vmlinuz anyway?
> After calling installkernel on the -rpm variants you delete them again...

The typical /sbin/installkernel script does a cp "$2" "/boot/...", so
you can't use the already installed files as its arguments.


> This <insert swear word here> happens on openSUSE 13.1, maybe their installkernel script needs fixing.

I guess that the problem is that grub2-mkconfig sees the temporary
/boot/vmlinuz-*-rpm file and creates a menu entry for it. I guess we
should create the temporary kernel and initrd files somewhere else than
in /boot.

Michal

