Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907947;
	b=k5wcz+soyc8itYFpYU5bRinwU3S65iC3BEtIjWbQgEzJ00MYX2l1L9TwEye6N2TQb9eY
	 /75tlxUPn3oeVhODFgT1S8pmLbZM6HH+9OS+LAOCj6pKSUBTQMbE+8g9QdbKvD6umP+EU
	 dH+EuiLg9c6xPeVi4olcxYg7nvwe6zJbO6KtjnZCZQTVoJ5nugeW9pSYdXPUYPhXgpilN
	 AMQS71eLRlywcIH7G1EyFqg885wwWVaIV6MgqeNy6gR6Lf+72AFRuX4OokfMK+gJ6BxML
	 4tRoJZVLHIahsEgeFupHUN0sOMInrpkKHgLzQXqlJMKwLUbchc2Xicl9Plf/Mk+9J8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907947;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EGlbhv4ezUOOe77uq/l+TvmyPwmurogPeksnfmWrdcY=;
	b=B1AXEqA/87aIza3OvmOjkkEoJ53/UXRciIUYZ2JZ6GGKQe6yyxz9f8sIvAtIunxTm3bJ
	 /pCDQHxYEr6EIgHmozVnzgz/CGYWoByLvMIHRpqy1qDjJybY0JnK4hkX24mY23RinQR6Q
	 ogDEDhi2s+8Bdxg5hRnzt55GTbb22SpBF+vWRgEgsg0X6XammN1MnuG/aAI/vxWgaOdPY
	 1manESVNqcMXjJ1vz3vegr3Fsb37m0JZGrnZ8sRipc+G2WrwnsY4CG+7n3Z4JeZM6YVU9
	 plz5aw23pLUZ+OwmnXeM+eZ/L/AOZgDrErqQW4ojKx/hYHtI5C89HsoKKIkZo6RDPMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SN8bJtpg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D44606C8BC;
	Thu,  5 Nov 2026 19:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SN8bJtpg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3931F0089F;
	Thu,  5 Nov 2026 19:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907946;
	bh=EGlbhv4ezUOOe77uq/l+TvmyPwmurogPeksnfmWrdcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SN8bJtpgqyL5xO2XbjvuK23L10hNyP+4b7xH26L30i5L6j7VC1a2rA6b/rVgC8mCS
	 1+hIgvvUU86QGgtllgN08bFKu7NJ5EZdETtXt7ImjIDvRAB+sz70sUNeTpgwFE5XvL
	 ps2mCH7bJPMj0H9XYDtqTGefndCEUhPRGvplFOR3K9NLQe1LzYygWKVfqjdTluEK9M
	 ji8D35x/TVQUtDw9CpctA4VErAPc7KTQzpoQNiBrHEQVxNxvdoYzhIrCcIvbIZSH0y
	 BseDoPoW/Y5ZjbtSFXkF56yuAAQF+cRuqO1xuvn46unbOsgBHOiMLBS4XjS3RCUrYn
	 9PjInshZmdqSg==
Date: Thu, 5 Nov 2026 12:45:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: Nicolas Schier <nsc@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Jakub Jelinek <jakub@redhat.com>,
	Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] kbuild: move gcc's -Wconstant-logical-operand to W=2
Message-ID: <20261105194541.GA2668266@ax162>
References: <20261105175748.3057520-1-vineet.gupta@linux.dev>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105175748.3057520-1-vineet.gupta@linux.dev>

On Thu, Nov 05, 2026 at 09:57:45AM -0800, Vineet Gupta wrote:
> GCC 17 adds -Wconstant-logical-operand to -Wall. It warns when an operand
> of && or || folds to a constant other than 0 or 1. Unlike clang's version,
> it also checks constant left operands and operators that come from a
> macro expansion. With CONFIG_WERROR=y, an x86 defconfig build fails in
> prepare0:
> 
>   arch/x86/include/asm/cpufeature.h:72:36: error: use of logical '&&' with constant operand '4194304' [-Werror=constant-logical-operand]
> 
> The warning is meant to catch && written for &. Kernel history has no
> such catch. Of the 13 earlier kernel fixes for clang's version, only
> commit dd7fe5d9fd6a ("rtc: max31335: Fix comparison in
> max31335_volatile_reg()") fixed a bug that the warning found. Commit
> 394b52462020 ("drm/i915/gem: fix bitwise and logical AND mixup") fixed a
> & written for &&, which the warning cannot see. The other fixes rewrote
> correct code. In GCC's own tree, the warning found two sites since it
> was added, and both were false positives.
> 
> Disable the warning for GCC unless W=2 is given. Keep clang's version,
> which skips macros and constant left operands.
> 
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Link: https://lore.kernel.org/all/20261104160722.1637541-1-vineet.gupta@linux.dev/
> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

This probably wants a 'Cc: stable' so that older kernels can build
warning free with GCC 17.

-- 
Cheers,
Nathan
