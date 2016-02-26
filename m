Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41943 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754444AbcBZPY1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Feb 2016 10:24:27 -0500
Subject: Re: [PATCH] kbuild/mkspec: fix grub2 installkernel issue
References: <alpine.LNX.2.00.1602261612350.22700@cbobk.fhfr.pm>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56D06E29.8060801@suse.com>
Date: Fri, 26 Feb 2016 16:24:25 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.00.1602261612350.22700@cbobk.fhfr.pm>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Jiri Kosina' <jkosina@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016-02-26 16:15, Jiri Kosina wrote:
> mkspec is copying built kernel to temporrary location
> 
> 	/boot/vmlinuz-$KERNELRELEASE-rpm
> 
> and runs installkernel on it. This however directly leads to grub2 
> menuentry for this suffixed binary being generated as well during the run 
> of installkernel script.
> 
> Later in the process the temporary -rpm suffixed files are removed, and 
> therefore we end up with spurious (and non-functional) grub2 menu entries 
> for each installed kernel RPM.
> 
> Fix that by using a different temporary name (prefixed by '.'), so that 
> the binary is not recognized as an actual kernel binary and no menuentry 
> is created for it.
> 
> Signed-off-by: Jiri Kosina <jkosina@suse.cz>

Fixes: 3c9c7a14b627 ("rpm-pkg: add %post section to create initramfs and
grub hooks")

Applied to kbuild.git#misc.

Michal
