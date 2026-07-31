Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F1645C6FB;
	Fri, 31 Jul 2026 23:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785540148; cv=none; b=Sx/pCtXYXmz2/dcme00xZnig+g+JmsqzxXMewEakzBdSjoW1q09DeuhICN2PABrSRqITkNxV/mWqG6yxR2hTXK+Mx/4oKPYPXv7XyeDtBQED9JUf3MQeFOJhBCH/pjO/uX4dNPkKmFX+cEV7CB09rQsZzILXxndji1Q0STtQktA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785540148; c=relaxed/simple;
	bh=523cXtNjm0QXrh4neuhzn/H7vGgf0cRD9aq9YHCrER4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=H82r767NwIcsItOZUH7vtGTw2plxkeoYST7xU4cBfWSeZ3K2UIgwXJJXN/CtBxfqjkINAnGGJsfItDrjS2FfzSInOO/ATXfs1ZNdJP8SOhAZH3jYCzI5vIzjmt8Cd/Y72IdWo9Iy5sbHFP+z+l4LhgY0ZZNtsClMesJy1F2WcFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACLTv/hX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACLTv/hX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666F11F00AC4;
	Fri, 31 Jul 2026 23:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785540147;
	bh=wBOnGNR2qLSVLRJLGB4ATvlgCqlZ0OR+uxAy9mmP6b8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ACLTv/hXKH+LWepYmsrE1eotCkS4b4hc1b/ee21wX+zmrx7AlMUtFGgtGAGXH4WsO
	 0CDCnfi7WWnr4WkK3o1lBJJVPiANuppMoMW5miBAykHnGrTGOedGQ0WaK6QAxuT7kg
	 0St63So0pxELu/sNqsILU2ZaYWrdNSYKLw2KLn4xL8nkjBUFv0W8wkYUNX0rElACsB
	 m3UhzGHsa+sEUW5GoLaMKT0GjFe8S84x2hMAqdJcoHGWFiL5bNs/16/aprKZyDfppT
	 mfOI90BAAbKPwG9MuEajKckYQuM+0Jpy4/rQmIqjDVC4GpEYhmvaNF0Cew7teWkjvY
	 Q7i8mBwKYIaGg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] kbuild: link-vmlinux.sh: more reliable 3rd pass
 linking
From: Nathan Chancellor <nathan@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Guenter Roeck <linux@roeck-us.net>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
References: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
Date: Fri, 31 Jul 2026 16:22:17 -0700
Message-Id: <178554013759.3652505.7898833065785451675.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177; i=nathan@kernel.org;
 h=from:subject:message-id; bh=523cXtNjm0QXrh4neuhzn/H7vGgf0cRD9aq9YHCrER4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFm5evqal/mq3kisOnLxRZ1H6dqfPwRV5P7/W2L8IcB87
 6GQyug1HaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiS6Yz/BVRnLP7/erstV8v
 PPz0xuf3xh+albMXfJ0vXvXYbnuB06EDDP8LJu48o1k7T/WHp8SNgJm/9mobfauKvfH4agJv6fo
 bm17yAwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Hi Andre,

> link-vmlinux.sh currently only uses the file size of
> .tmp_vmlinux?.kallsyms.o to determine if it needs to do a third pass. I
> was hitting a case where file size didn't change, but symbols changed
> sufficiently to still move subsequent symbols in vmlinux to invalidate
> kallsyms.
> 
> In particular kallsyms_names grew by one byte between
> .tmp_vmlinux1.kallsyms.o and .tmp_vmlinux2.kallsyms.o, moving the next
> symbol to the next alignment offset (4 bytes), moving many subsequent
> symbols in the final vmlinux image in turn (until abosrbed by further
> alignment instructions). This failed the final link with:
> 
>     Inconsistent kallsyms data
>     Try "make KALLSYMS_EXTRA_PASS=1" as a workaround
> 
> The two patches here are independent of each other:
> * Patch 2 in this series addresses the actual issue and also has a more
>   detailed explanation with exact failure case
> * Patch 1 could be omitted if deemed useless, but I found it useful
>   while debugging the issue. It just updates the kallsyms.c to instruct
>   the assembler to also emit symbol sizes.
> 
> Cheers,
> Andre'
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> André Draszik (2):
>       kallsyms: add symbol size for kallsyms symbols that can change size
>       kbuild: link-vmlinux.sh: improve detection of third pass requirement

Thanks a lot for this series! This "Inconsistent kallsyms data" has been
plauging our continuous integration for quite a while but I could never
consistently reproduce the problem enough to actually investigate it. I
have run it through my full test matrix and not noticed any additional
problems. I will continue to hammer on it to see if this message ever
occurs again.

Tested-by: Nathan Chancellor <nathan@kernel.org>

This should probably have some decent soak time in -next to make sure it
does not introduce any regressions. If we do not take it for 7.3 at this
point, I will make sure it gets applied as soon as 7.3-rc1 is out,
aiming to submit it for 7.4.

One note: the diff in the scissor area of second patch makes it fail to
apply.

-- 
Cheers,
Nathan

