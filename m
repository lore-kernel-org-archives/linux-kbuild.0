Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34900 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753127Ab2AWVSf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Jan 2012 16:18:35 -0500
Date: Mon, 23 Jan 2012 22:18:34 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: disable -Wmissing-field-initializers for W=1
Message-ID: <20120123211834.GA3981@sepie.suse.cz>
References: <1327290850-5405-1-git-send-email-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1327290850-5405-1-git-send-email-kirill.shutemov@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: linux-kbuild@vger.kernel.org, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, linux-kernel@vger.kernel.org

On Mon, Jan 23, 2012 at 05:54:10AM +0200, Kirill A. Shutemov wrote:
> -Wmissing-field-initializers is too noisy to be useful on W=1. Let's
> move it to W=2.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>  scripts/Makefile.build |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index d2b366c..1535a2f 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -62,7 +62,7 @@ endif
>  ifdef KBUILD_ENABLE_EXTRA_GCC_CHECKS
>  warning-  := $(empty)
>  
> -warning-1 := -Wextra -Wunused -Wno-unused-parameter
> +warning-1 := -Wextra -Wunused -Wno-unused-parameter -Wno-missing-field-initializers

I would use $(call cc-disable-warning, missing-field-initializers), so
that W=1 has a chance of working with gcc 3.x.

Michal
