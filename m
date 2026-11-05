Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793853778;
	b=RU6q4FE0ZF29tb+MH40bzzF4RI/i4ILNpea1uCVE/F/L/x5RmgE/3q7XzZIji5I6oLsJ
	 riVGuxpbUaaUBuSUcTb9Jo27b4vrE+p17c+Brwv8yqxJWQojSjyceaIf7N4LpnbRdN3oM
	 h9+XiZ71FjXapVKJg/v+d2oqK7C2PtnQuyX9BGvciA41Fr5EdJAeCWDnzos4sW0z82b77
	 zQDh8jArfgJYDEWcNWzKP7a7fC0EHUJwQ4oUyMs+kdMxrNrZNQsrHskkenrRPvEx2ZX9n
	 Hox2H3Qbk/wklnrhVrBBUvvaGfHqRn+vNECbMjZATFAaJjbJgVhtgjiEyHgAD7j/ozw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793853778;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cN6YJ1UnxOE16ti8xYaxD9MJqzQpgNzKBI/Qx70ZbgA=;
	b=tO2LrnImKw6+RZYAiU4KUJCujQ62BNqC5c2ZcKp5rl6C5VsYQxTPWwGruVq+NPAKSqdk
	 bsKi+e6QV//y4HezfN0CvgpQwBBgL4OcoU05ObhgcY8HaQNc36vo4w5KCLCFigjGhcymc
	 1LyOhoF60vwT60AK6S0VTa4Uf6qWeGPTJpg3I4qm+9l7i01yCE3VQJxFykmFILzRqf3DK
	 +CWLtHlozcCp1FPQ5wvyNd1ak5iMMvuul85nIe47jYD358PBUNoe18G7vi/w9WI2OA7Lr
	 cZ0NCFHEg5QQpIIIdEnK214rHJ7pxkFgiosP0jB0H9UYiK0h0sKXA8mTkSBvHYVKKEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1UXq+0k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578FA606A32C;
	Thu,  5 Nov 2026 04:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1UXq+0k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A8B1F000C1;
	Thu,  5 Nov 2026 04:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793853777;
	bh=cN6YJ1UnxOE16ti8xYaxD9MJqzQpgNzKBI/Qx70ZbgA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=D1UXq+0kLGwHk/Lgm8ny/UprJEvxodjQXYpqXFGEDngiNmZ9FKC6LxLhTtegM4UFq
	 FEnJpiKLoWtNmCfzFZyNdlzFaaVzHgsvKfJVSUYyhBi2vMCxup7eyLHtVtW0bRhs3m
	 I1FkmaQ28ws5+xIm4wugUR14+tTJUEDY6BpzZ2dxvmWJbkK99W8J4uBU7YLRmFupF+
	 /l0nHrcday7jYHaTgOPMu/V2OFQs/dOjwcaiJpZJA9amvjjgV5LA3ETHe/bu3JKeDi
	 oLgX3Ak0lmY3X04kIHYm1cfJI80+V8KEGGNVa4Vy+OGwm1lvnBdDtnkAxmKQcD2/k2
	 XKpoFhl5/OPkA==
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kbuild: dtbinst: Create destination directories before
 installing
From: Nathan Chancellor <nathan@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-topic-dtbs_install_fix-v1-1-8cf50b642cba@oss.qualcomm.com>
References: <20261016-topic-dtbs_install_fix-v1-1-8cf50b642cba@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 21:42:49 -0700
Message-Id: <179385376961.826739.14151847592351019006.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1081; i=nathan@kernel.org;
 h=from:subject:message-id; bh=cpRbEdk5DsK63rlgJb74umfHVwDwiUBoMgEzBYQ/bcU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlvOH1Pa76eXBvW9l0rhcdZ8Oyb2+VHZ5svDT+8svTqk
 rscpUkLOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEMpcwMhxUPDir819t/8OY
 wjPHTFuSs3p5r8ypW/E9V1gyn8s6+RYjw+G4Xp1p/Zu63+u5/Nf6N7uyKUPowfXTB4Ll858sf1B
 XxwYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> dtbs_install installs each DTB with 'install -D', which creates the
> parent directory of the destination on demand. With a parallel build,
> two DTBs that share a not yet existing directory are installed
> concurrently and both try to create it. The loser fails, which aborts
> the whole build:
> 
>   install: cannot create directory 'debian/linux-image-7.1.0/usr/lib/linux-image-7.1.0/arm'
>   make[6]: *** [scripts/Makefile.dtbinst:23: .../arm/foundation-v8-gicv3.dtb] Error 1
> 
> The failure depends on job scheduling, so it shows up as a build that
> fails for no apparent reason and passes when re-run.
> 
> Create all destination directories up front, the same way
> scripts/Makefile.modinst does for modules, so the install rules no
> longer race.
> 
> Fixes: aefd80307a05 ("kbuild: refactor Makefile.dtbinst more")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Seems reasonable to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Rob, do you want to take this or should we take it via Kbuild?

-- 
Cheers,
Nathan

