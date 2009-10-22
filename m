Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:50088 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755277AbZJVU3f (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Oct 2009 16:29:35 -0400
Date: Thu, 22 Oct 2009 22:29:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: unifdef problem (xen)
Message-ID: <20091022202938.GA1795@merkur.ravnborg.org>
References: <20091022125223.66610093.rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091022125223.66610093.rdunlap@xenotime.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org, jeremy@goop.org

On Thu, Oct 22, 2009 at 12:52:23PM -0700, Randy Dunlap wrote:
> Hi,
> 
> I'm using xen.git
> <git://git.kernel.org/pub/scm/linux/kernel/git/jeremy/xen.git>.
> 
> When I build allmodconfig on x86_64 (with O=xx64), I see this warning:
> 
> 
> unifdef: /xen/xx64/usr/include/xen/privcmd.h.tmp: 79: Premature EOF (#if line 33 depth 1)
> unifdef: output may be truncated
> 
> 
> The original file contains:
> #ifndef __user
> #define __user
> #endif

The problem is scripts/headers_install.pl
Here we do:

    $line =~ s/([\s(])__user\s/$1/g;

And this zaps the newline when we see __user.

It is not obvious why this zaps the newline - must be
some perl foo I have forgotten.

I checked this by removing the unlink in said perl script
and looking at the .tmp file.


	Sam
