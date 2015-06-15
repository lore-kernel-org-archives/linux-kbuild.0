Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55483 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750734AbbFOOMp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Jun 2015 10:12:45 -0400
Message-ID: <557EDD5B.5050703@suse.cz>
Date: Mon, 15 Jun 2015 16:12:43 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/package/Makefile: rpmbuild is needed for rpm
 targets
References: <CA+r1ZhiyQbakrxr4saPE_mFjwjGG4aJxLHm3oCvqD=4=ByBA_w@mail.gmail.com> <1433794748-6570-1-git-send-email-jim.epost@gmail.com>
In-Reply-To: <1433794748-6570-1-git-send-email-jim.epost@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2015-06-08 22:19, Jim Davis wrote:
> Before rpm release 4.1, in 2002, either the rpm command or the
> rpmbuild command could be used in the rpm-pkg or binrpm-pkg targets,
> and the Makefile chose the rpm command if the rpmbuild command wasn't
> found.
> 
> After release 4.1, however, the rpm command could no longer be used in
> place of the rpmbuild command.  As the rpmbuild command is not
> installed by default, this can lead to failures with the rpm-pkg and
> binrpm-pkg targets:
> 
> rpm --define "_builddir ." --target \
>     x86_64 -bb ./binkernel.spec
>     rpm --target: unknown option
>     scripts/package/Makefile:60: recipe for target 'binrpm-pkg' failed
> 
> Change the Makefile to use rpmbuild unconditionally to avoid this.
> 
> Signed-off-by: Jim Davis <jim.epost@gmail.com>

I agree that compatibility with rpm < 4.1 is not an issue nowadays and
"rpmbuild: command not found" is a lot more informative error message. I
applied the patch to kbuild.git#misc.

thanks,
Michal

