Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:42189 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756276AbaBROg1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:36:27 -0500
Message-ID: <53036FBD.8030307@zytor.com>
Date: Tue, 18 Feb 2014 06:35:41 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH 13/20] Kbuild, lto: Set TMPDIR for LTO v2
References: <1392733738-8290-1-git-send-email-andi@firstfloor.org> <1392733738-8290-14-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392733738-8290-14-git-send-email-andi@firstfloor.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

On 02/18/2014 06:28 AM, Andi Kleen wrote:
>  
> +ifdef CONFIG_LTO
> +# LTO gcc creates a lot of files in TMPDIR, and with /tmp as tmpfs
> +# it's easy to drive the machine OOM. Use the object directory
> +# instead
> +TMPDIR ?= ${objtree}
> +export TMPDIR
> +endif
> +

We still prefer $(...) in Makefiles, no?

	-hpa


