Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4F43806D6;
	Wed, 29 Apr 2026 17:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777483501; cv=none; b=HcR3TUw60z1GxGKttzk8PRgKJ08fnPzK6O9MgMR/UYGdldzQiEIskVhkN6+7xuDiRyhq9kxnYIx3pFoazKCrIyXfV9ie5gZ1U9h6Qki1vFHzlP7FtQ2n0DTYerVIl1sfe4VKI0aG3sAi6XMb873W3qAWdfcoCcxa4QxhM8usHPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777483501; c=relaxed/simple;
	bh=mffL2JW6T8+5RordXSJf9JdbCYGneKu1w5+tmtqfz+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiQ1NFkHQTK0RgkOHscVGynDQZsO4x9X84s824d97ziiqQzMCrbB87gUpiWXdh65pTSB+n1GxPh0HzROuZn+OjtczS0y0g6JDOCkjY88tWjiPvycKBdoD3qgQQETjbPPC9BV+HXDrROU4WL+GUpv+fj/5+asc4Ntc72gUzyycLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9a7nIEx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9a7nIEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3DFC19425;
	Wed, 29 Apr 2026 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777483500;
	bh=mffL2JW6T8+5RordXSJf9JdbCYGneKu1w5+tmtqfz+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9a7nIEx9f9IH+TQpYvB3d7+jjUMIbFmLu+q3cqPiWyiAQX8bjIVpcFvozhkXmKLX
	 5CSDK1qHF5qfLyt5WzlhHeHTJZKUQop0g29qlP9xcic4b9KxnB0MaCT3XJpEl1PmDb
	 GkV8IAzywCzIgqtfb6V5Q2ya3yuEAhmyQTY/UKRm60YNA8F/LEFhEyq53Ue9N8Xebj
	 zEjvw6kyIKKZ9rWQlpvkv/2R+ZHB5fX/zN7OkILIdaSv5/ZK4fbV3bA44J43cZIFhV
	 QE5Y3BUKGltUAZa3433J5sAMIsM8USUoxQ4ARODeDBW5YmFdBtS4WFtR3sq1p/eY+N
	 WPYuIeVfcbE3w==
Date: Wed, 29 Apr 2026 10:24:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 11/14] x86/build: Drop unused '-ffreestanding' addition
 to KBUILD_CFLAGS
Message-ID: <20260429172455.GA2407772@ax162>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-11-81d9b2e8ee75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-11-81d9b2e8ee75@kernel.org>

On Tue, Apr 28, 2026 at 10:59:17PM -0400, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the condition to add '-ffreestanding' to
> KBUILD_CFLAGS for 32-bit x86 is always false, so the if block can be
> removed.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: H. Peter Anvin <hpa@zytor.com>
> ---
>  arch/x86/Makefile | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 46fec0b08487..5720f2470cfc 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -124,11 +124,6 @@ ifeq ($(CONFIG_X86_32),y)
>          include $(srctree)/arch/x86/Makefile_32.cpu
>          KBUILD_CFLAGS += $(cflags-y)
>  
> -    ifneq ($(call clang-min-version, 160000),y)

Sashiko points out [1] that the condition of this block, added by

  d70da12453ac ("hardening: Enable i386 FORTIFY_SOURCE on Clang 16+")

results in GCC builds still having '-ffreestanding' enabled. I don't
think this should be a problem but if we want to be more conservative, I
could turn this into an

  ifdef CONFIG_CC_IS_GCC

block to keep the same behavior for GCC while avoiding the flag
altogether for clang. Regardless, the commit message will need
rewording.

[1]: https://sashiko.dev/#/patchset/14621?part=11

> -        # https://github.com/llvm/llvm-project/issues/53645
> -        KBUILD_CFLAGS += -ffreestanding
> -    endif
> -
>          percpu_seg := fs
>  else
>          BITS := 64
> 
> -- 
> 2.54.0
> 
