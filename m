Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud3.xs4all.net ([194.109.24.22]:47159 "EHLO
	lb1-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753606AbbGEIqR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Jul 2015 04:46:17 -0400
Message-ID: <1436005169.20057.60.camel@tiscali.nl>
Subject: Re: [PATCH, resend] build: fix broken kernel RPM source symlink
From: Paul Bolle <pebolle@tiscali.nl>
Date: Sat, 04 Jul 2015 12:19:29 +0200
In-Reply-To: <1435664842-17908-1-git-send-email-ec@numascale.com>
References: <1435664842-17908-1-git-send-email-ec@numascale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Espen Carlsen <ec@numascale.com>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel J Blueman <daniel@numascale.com>, Steffen Persvold <sp@numascale.com>

On di, 2015-06-30 at 13:47 +0200, Espen Carlsen wrote:
> Fix the 'rpm-pkg' makefile target to always generate the correct
> /usr/src/kernel/<ver> symlink; this fails on non-RPM-native systems

          /kernels/

> eg Ubuntu.
> 
> On a non-RPM-native system, the symlink created by rpmbuild points to
> the source tree, so the ln -sf commands to overwrite build and source 
> will
> create a new link inside the directory pointed to by the build and 
> source
> symlinks. This will break the -devel.rpm, as the build and source 
> symlinks
> will point to non existing directories after installing them.

Perhaps this is all obvious but what exactly happens currently and what
happens after this change? (An example might help readers that are just
as easily confused as I am. Perhaps that might also explain why this is
only an issue on non-RPM-native systems.)

It doesn't help that the description of -T in "man ln" is rather
unhelpful. "info ln" was better, after following some references, but
I'm still not sure what it buys you for this issue.
 
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec

> -echo "ln -sf /usr/src/kernels/$KERNELRELEASE build"
> -echo "ln -sf /usr/src/kernels/$KERNELRELEASE source"
> +echo "ln -sfT /usr/src/kernels/$KERNELRELEASE build"
> +echo "ln -sfT /usr/src/kernels/$KERNELRELEASE source"

Thanks,


Paul Bolle
