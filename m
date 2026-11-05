Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856249;
	b=pIo+qtL4BuQ6sRmthtFZNO62QSkyz6EnSlpxhKJsedXRoUdUp3EpZghXxURgaKedQUZP
	 DYgATphp6a9HfarW0l0bLeklUeTkc6xuQ4nN5RPkDTH8IGttXEY5ZEC3RPSe76Floyq/v
	 ot5ATi7+FiQEbOXTv0bfvMXhZrazOM7ORTnJ+5bUY6SZMVN63rjhHqmQ9w3CI012gUzpf
	 WEWgjtL5zCttkq8MLJMePUWpliwuORtI4aETBnFqzHiI7fsz7s5QhcOMo/1A4sKsLIS9G
	 uCiY7g2CR9bzge7fHjzPS1qcowC+U1g5GIGR9I88hqio3Gx+vKRpD8dxas2oJtQ0Aig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856249;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ILoB454xbFbHLsKflWQrUGwexE0/EjSSyi9KCdzFexA=;
	b=WR+Gpb8BIrNaAhMWs5oGxipgoPN9O6XpG4ttpf0IzilLyeXWUejdX9pbGJ3G1mgt3Zaa
	 KEMHV0CvA05fXmYWgt9JD6bkJaGiYaZS5EOUwjcwyQkyGLgRTrlhxRaSBNo34VG3/bQQ7
	 ZUgBpyKY5Kz4DBPL0tT6+9lHnqf+KrPwqk8QcuX3DBTA1o5Rda/0BfMa/PJ9nJfR/d2YY
	 0RoAVvxOakM37UNULmzdputqflKpX59ArbpTGwKmYiwbzjnMIvHER6ha3aypnOJ50nlxt
	 Xba9S9A5GgA8b1aQAQLwoQUMuX3HP5a9OfikInU3JRfvTjmQaOml6vNkEfnBNHqPxsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=al++uHaj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B26D606A31B;
	Thu,  5 Nov 2026 05:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=al++uHaj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730981F000C1;
	Thu,  5 Nov 2026 05:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793856249;
	bh=ILoB454xbFbHLsKflWQrUGwexE0/EjSSyi9KCdzFexA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=al++uHajPhWFtt20R1WcEOxb8Dd6rDvN9EIezhWJy/I4xlz30ZbM5UX2wRMFEjlFl
	 mTAMAD7jOoOzF7eoXch/QqG1oP36Apuy6IHF94e5zwYSG2ED3O1tktXh3LLuTMOniK
	 9F7ivGgfG/ZPMC7roQCC2CLZyP1/VpsjOEfAMjkgQ0mWKlZf3Euj4ktxffzPt7olu5
	 4SF+qGWMOL60bQmZeM/NEx14/lOdhGlOyQT3bTcAdFmxmGRk/GlVyEtn0+1JUu79C9
	 I9EC7lUWQLeOGZhH3tuSze7oTzV9OU5BDpCGrkC+AW9Aw0618pGMCE+ml9yiG5DP+K
	 Bt+JSPvZbRapA==
Date: Wed, 4 Nov 2026 22:24:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Han Wang <nesthanwang@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>, Bill Wendling <morbo@google.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
Message-ID: <20261105052401.GA862715@ax162>
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
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
In-Reply-To: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>

On Wed, Nov 04, 2026 at 05:45:55PM -0800, Douglas Anderson wrote:
> From: Han Wang <nesthanwang@google.com>
> 
> AutoFDO profiles are commonly collected on one kernel revision and
> reused across subsequent commits or stable merges before a fresh
> profile is generated. While AutoFDO uses function-relative line
> numbers to tolerate edits above a function, adding or removing lines
> inside a function (or an inlined helper) shifts all subsequent
> relative line offsets within that function. Without stale profile
> salvaging, shifted callsites fail to match their nested inlinee
> profiles in SampleProfileLoader (dropping profile-guided inlining for
> those callees) and basic block sample counts are misattributed to the
> wrong instructions, degrading branch probability estimation and
> machine function splitting.
> 
> Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
> since LLVM 17) for C, Rust, and ThinLTO builds when
> CLANG_AUTOFDO_PROFILE is specified. This instructs SampleProfileMatcher
> to use lexical callsite anchors within functions to fuzzy-match and
> remap shifted line offsets when querying the profile.
> 
> While -salvage-stale-profile is not enabled by default in LLVM due to
> the minor compile-time/memory cost of sequence-matching callsite
> anchors (which is unnecessary when profiles are freshly generated on
> the exact commit being built) and the heuristic nature of fuzzy
> matching on heavily rewritten functions, enabling it makes sense for
> the kernel: hardware PMU profiles are rarely regenerated on every
> commit, and anchoring on callsite names is strictly more resilient
> than blind line-offset lookup when functions are edited.
> 
> As a side benefit, remapping shifted line offsets also avoids feeding
> mismatched weights from stale profiles into MIRProfileLoader's flow
> inference solver (applyFlowInference), working around a compiler bug
> [1] where a small intra-function line shift (such as in
> __vm_normal_page() in mm/memory.c) can cause applyFlowInference to
> spend 30+ minutes compiling unmap_page_range().
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [1]
> Signed-off-by: Han Wang <nesthanwang@google.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Much of the commit-message justification here is AI-generated. Sorry!
> :( Folks who know better, feel free to call bullshit.

The justification does not seem wrong to me on initial read but it
definitely feels like the first and third paragraphs could be reduced in
verbosity since this can basically be summarized by "AutoFDO profiles
are often reused, which can be problematic without profile salvaging
enabled, which is designed for this exact situation".

> Honestly, this patch came about because of AI analysis compiles taking
> 30 minutes to run (see the clang bug [1]). It seems to work around the
> problem. Obviously, we should fix the compiler. That being said, upon
> further analysis it seemed like adding this flag was beneficial
> anyway, so I'm posting it upstream. If folks disagree, we can simply
> drop this patch.

I would definitely like to see that issue triaged but like you say, it
probably does not need to done before this is merged since it has
reasonable justification on its own. I would love to get thoughts from
other folks though.

>  scripts/Makefile.autofdo | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 57a3aba6ffc2..3b1e65a13ffa 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -13,13 +13,16 @@ endif
>  ifdef CLANG_AUTOFDO_PROFILE
>    CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
>    CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
> +  CFLAGS_AUTOFDO_CLANG += -mllvm -salvage-stale-profile
>    RUSTFLAGS_AUTOFDO_CLANG += -Zprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -Zfunction-sections=y
>    RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-split-machine-functions
> +  RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-salvage-stale-profile
>  endif
>  
>  ifdef CONFIG_LTO_CLANG_THIN
>    ifdef CLANG_AUTOFDO_PROFILE
>      KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
> +    KBUILD_LDFLAGS += --mllvm=-salvage-stale-profile
>    endif
>    KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
>    KBUILD_LDFLAGS += $(call ld-option,-plugin-opt=-function-splitting=all,-plugin-opt=-split-machine-functions)
> -- 
> 2.56.0.455.g6c5a503b38-goog
> 

-- 
Cheers,
Nathan
