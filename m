Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27672 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726090AbgDXUco (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Apr 2020 16:32:44 -0400
Date: Fri, 24 Apr 2020 15:32:31 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH 02/16] Revert "objtool: Skip samples subdirectory"
Message-ID: <20200424203231.b4lonbdgzkoxf7ug@treble>
References: <20200423073929.127521-1-masahiroy@kernel.org>
 <20200423073929.127521-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200423073929.127521-3-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

On Thu, Apr 23, 2020 at 04:39:15PM +0900, Masahiro Yamada wrote:
> This reverts commit 8728497895794d1f207a836e02dae762ad175d56.
> 
> This directory contains no object.
> 
> Cc: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  samples/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/samples/Makefile b/samples/Makefile
> index f8f847b4f61f..5ce50ef0f2b2 100644
> --- a/samples/Makefile
> +++ b/samples/Makefile
> @@ -1,6 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for Linux samples code
> -OBJECT_FILES_NON_STANDARD := y
>  
>  obj-$(CONFIG_SAMPLE_ANDROID_BINDERFS)	+= binderfs/
>  obj-$(CONFIG_SAMPLE_CONFIGFS)		+= configfs/
> -- 
> 2.25.1

Hm, somehow I was thinking this would work recursively for
subdirectories.  Anyway, you're right:

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh
