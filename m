Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:37906 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752275AbZFEWNU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 18:13:20 -0400
Date: Sat, 6 Jun 2009 00:14:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 1/3] kernel/kallsyms.c: replace deprecated __initcall with device_initcall and fix whitespace
Message-ID: <20090605221437.GJ29008@uranus.ravnborg.org>
References: <200905122102.n4CL2pC0007217@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200905122102.n4CL2pC0007217@imap1.linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kbuild@vger.kernel.org, mkatiyar@gmail.com

On Tue, May 12, 2009 at 01:43:35PM -0700, akpm@linux-foundation.org wrote:
> From: Manish Katiyar <mkatiyar@gmail.com>
> 
> Fix coding style whitespace issues and replace __initcall with
> device_initcall.  Fixed multi-line comments as per coding style.
> 
> Errors as reported by checkpatch.pl :-
> Before:
> total: 14 errors, 14 warnings, 487 lines checked
> After :
> total: 0 errors, 8 warnings, 507 lines checked
> 
> Compile tested binary verified as :-
> Before:
>  text    data     bss     dec     hex filename
>  2405       4       0    2409     969 kernel/kallsyms.o
> After :
>  text     data     bss     dec     hex filename
>  2405       4       0    2409     969 kernel/kallsyms.o
> 
> Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Applied,
	Sam
