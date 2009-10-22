Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from claw.goop.org ([74.207.240.146]:46752 "EHLO claw.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752180AbZJVTy5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Oct 2009 15:54:57 -0400
Message-ID: <4AE0B891.1010100@goop.org>
Date: Thu, 22 Oct 2009 12:54:57 -0700
From: Jeremy Fitzhardinge <jeremy@goop.org>
MIME-Version: 1.0
Subject: Re: unifdef problem (xen)
References: <20091022125223.66610093.rdunlap@xenotime.net>
In-Reply-To: <20091022125223.66610093.rdunlap@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org, sam@ravnborg.org

On 10/22/09 12:52, Randy Dunlap wrote:
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
>
> and the generated/unifdef output file contains:
> #ifndef #define #endif
>
> all on one line.
>
> Is this expected/normal?  Is this a problem with unifdef or with something
> in xen.git?
>   

I'd say its a bug in unifdef, but I'm not precisely sure what its trying
to do.

That said, there's no reason for those lines to be in privcmd.h, I think.

    J
