Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:42577 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751080AbZFDJNE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Jun 2009 05:13:04 -0400
Date: Thu, 4 Jun 2009 11:15:19 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [Patch 1/2] kbuild: two trivial fixes for check headers
Message-ID: <20090604091519.GA9571@uranus.ravnborg.org>
References: <20090604080406.7005.27662.sendpatchset@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090604080406.7005.27662.sendpatchset@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Amerigo Wang <amwang@redhat.com>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

On Thu, Jun 04, 2009 at 04:01:52AM -0400, Amerigo Wang wrote:
> 
> Remove a useless 'extern' in an exported header.
> Fix a comment headers_check.pl.

These two patches has nothing in commom.

> 
> Signed-off-by: WANG Cong <amwang@redhat.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> 
> ------
> diff --git a/include/mtd/jffs2-user.h b/include/mtd/jffs2-user.h
> index fa94b0e..10dc7ef 100644
> --- a/include/mtd/jffs2-user.h
> +++ b/include/mtd/jffs2-user.h
> @@ -18,7 +18,7 @@
>  #undef je32_to_cpu
>  #undef jemode_to_cpu
>  
> -extern int target_endian;
> +int target_endian;

You now declare a global variable named target_endian each time you include this file - which is wrong.
