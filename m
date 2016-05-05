Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:56430 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756734AbcEEOmR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 May 2016 10:42:17 -0400
Subject: Re: [PATCH v1] builddeb: fix missing headers in linux-headers package
References: <1459445479-10948-1-git-send-email-asamson@codeaurora.org>
From: Christopher Covington <cov@codeaurora.org>
Message-ID: <572B5BC4.7080402@codeaurora.org>
Date: Thu, 5 May 2016 10:42:12 -0400
MIME-Version: 1.0
In-Reply-To: <1459445479-10948-1-git-send-email-asamson@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azriel Samson <asamson@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Timur Tabi <timur@codeaurora.org>

On 03/31/2016 01:31 PM, Azriel Samson wrote:
> The kernel headers package (linux-headers) doesn't include
> header files from other architectures required to build
> out-of-tree modules.
> 
> For e.g. on ARM64, opcodes.h includes the same file from ARM
> which causes the following error:
> ./arch/arm64/include/asm/opcodes.h:1:43: fatal error:
> ../../arm/include/asm/opcodes.h: No such file or directory
> compilation terminated.
> 
> Signed-off-by: Azriel Samson <asamson@codeaurora.org>
> ---
>  scripts/package/builddeb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 6c3b038..06ba0d9 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -322,7 +322,7 @@ fi
>  
>  # Build kernel header package
>  (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) > "$objtree/debian/hdrsrcfiles"
> -(cd $srctree; find arch/$SRCARCH/include include scripts -type f) >> "$objtree/debian/hdrsrcfiles"
> +(cd $srctree; find arch/*/include include scripts -type f) >> "$objtree/debian/hdrsrcfiles"
>  (cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
>  (cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
>  (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"

Any feedback on this? Michal, do you think this would be appropriate to
include in 4.7?

Thanks,
Christopher Covington

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
