Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60733 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752286Ab1LKU7T (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 Dec 2011 15:59:19 -0500
Message-ID: <4EE519AB.20402@suse.cz>
Date: Sun, 11 Dec 2011 21:59:23 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: -I option expansion and -Wmissing-include-dirs
References: <20111125134617.GA31133@shutemov.name>
In-Reply-To: <20111125134617.GA31133@shutemov.name>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: linux-kbuild@vger.kernel.org

On 25.11.2011 14:46, Kirill A. Shutemov wrote:
> Hi,
> 
> Currently, kbuild makes -I option expansion without any check if the
> resulting include directory exists. It produce warnings if you try to build
> with W=1 which enables -Wmissing-include-dirs. For example:
> 
> $ make W=1 O=~/var/tmp drivers/gpu/drm/drm_auth.o
>   Using /home/space/kas/git/public/linux as source for kernel
>   GEN     /home/space/kas/var/tmp1/Makefile
>   CHK     include/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CALL    /home/space/kas/git/public/linux/scripts/checksyscalls.sh
>   CC [M]  drivers/gpu/drm/drm_auth.o
> cc1: warning: include/drm: No such file or directory [enabled by default]
> 
> It would be nice to address the issue.

That's not a kbuild bug but a drm Makefile bug. It should be passing
-I$(src)/include/drm. But it apparently builds even with the wrong
argument, so it can probably go away.

Michal

