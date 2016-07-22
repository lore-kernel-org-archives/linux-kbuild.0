Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:48276 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753333AbcGVL7m (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Jul 2016 07:59:42 -0400
Subject: Re: [PATCH] kbuild: make samples depend on headers_install
References: <20160704143949.2357806-1-arnd@arndb.de>
From: Michal Marek <mmarek@suse.com>
Message-ID: <57920AAC.8020304@suse.com>
Date: Fri, 22 Jul 2016 13:59:40 +0200
MIME-Version: 1.0
In-Reply-To: <20160704143949.2357806-1-arnd@arndb.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kbuild@vger.kernel.org, Peter Foley <pefoley2@pefoley.com>, Jiri Kosina <jkosina@suse.cz>, linux-kernel@vger.kernel.org

On 2016-07-04 16:39, Arnd Bergmann wrote:
> Olof's build test setup keeps failing to compile arm64 kernels
> because of a toolchain that uses outdated kernel headers:
> 
> /work/build/batch/samples/seccomp/bpf-fancy.c:13:27: fatal error: linux/seccomp.h: No such file or directory
> 
> This is of course something he could change, but it also indicates
> that others may run into the same problem. Running 'make headers_install'
> avoids the issue by ensuring that the kernel headers are put into
> the $(objdir)/usr/include path before we build the samples.
> 
> The same problem happened for the Documentation build in the
> past and was fixed up with commit 8e2faea877eb ("Make Documenation
> depend on headers_install"). This adds an identical Makefile dependency
> for the samples/ subdirectory.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to kbuild.git#kbuild.

Michal

