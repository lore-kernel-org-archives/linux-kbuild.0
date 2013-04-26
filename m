Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:18841 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753754Ab3DZS5M (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Apr 2013 14:57:12 -0400
Date: Fri, 26 Apr 2013 20:57:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] fix make headers_install when path is too long
Message-ID: <20130426185709.GA13399@merkur.ravnborg.org>
References: <513895F9.2050900@windriver.com> <1366994198-30550-1-git-send-email-nicolas.dichtel@6wind.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366994198-30550-1-git-send-email-nicolas.dichtel@6wind.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: bruce.ashfield@windriver.com, mmarek@suse.cz, linux-kbuild@vger.kernel.org

On Fri, Apr 26, 2013 at 06:36:38PM +0200, Nicolas Dichtel wrote:
> If headers_install is executed from a deep/long directory structure, the
> shell's maximum argument length can be execeeded, which breaks the operation
> with:
> 
> | make[2]: execvp: /bin/sh: Argument list too long
> | make[2]: ***
> 
> Instead of passing each files name with the entire path, I give only the file
> name without the source path and give this path as a new argument to
> headers_install.pl.
> 
> Because there is three possible path, I have tree input-files list, one per
> path.
> 
> Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> ---
> 
> I come back to this issue. Here is another proposal to fix this pb.
> Comments are welcome.
> 
>  scripts/Makefile.headersinst | 20 ++++++++++++++------
>  scripts/headers_install.pl   |  8 ++++----

In the kbuild tree the perl script has been replaced by a shell script.
You should base you patch on the kbuild-tree (or -next).

	Sam
