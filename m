Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452830;
	b=M73nEZWBDzDQZXFXxZRDAKQvcJ3zvhV2xDjDP0U0j0IW1icLx2uQpVIX/XheHpvrZ0OT
	 h2JuO3nr1kUtslrEZ1EaRWrAmxM9fgyRQItPZmhKVlLZDP5uZxUNTnr9jZtv5n5q/0Um2
	 /VAJyPffK4k645ymfTbjIioqWSMOYPYdDoGnMNU3uC3XHITaAORjT0mLAGiYBDyAbI7n3
	 zkVAfMoQwN+UxVgh9MgsPJoJt+w3RAQl/iHNpJkPCBtA/PeKOn2ZwhTEg2VnJrc2tv2Ai
	 66vlaB2cV6bDJXEvnYFQqXka6qBFezGneA7MKU0HxsdCDxDoSUvQQScYbECfw10MSoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452830;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ps/iPwcqdC4AQfhiiqXvzlyEE/xk71APo1FSjxzqBeI=;
	b=41d0aYiLpxvFaCfOWyS3lbic17kVJZ3J+bg/nqK3J8tHZ2M8CJ+DZ9DLLFdk10K/++CV
	 DOM1fcK0Jn3RuBgpduYVpY5AqtdppnAgEQjIaKo5L+fvlLx7Z8F2FVpE8g2MXi2kPfHt7
	 /8v23NCUA4+tAviX2XLbL7hcww0doNbpm4gknrW2OucxrseJGcDQ+p8NkhChQXr5v300+
	 8QP/PxsrcEwWpkfgYjz8ePFi11DOM9yfRc5PkiY/w8UYbf9PDhjCOfK9P3RRtEJ7B2ZqV
	 KqwCOxzxayfmjOSUCgVzh8wC5jEH2vMjeFqDtmRpj+JvLVw8c83qKG3OM4h/q5X3QKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VlDaRkoW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 71CCD606A31A;
	Mon, 23 Nov 2026 16:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VlDaRkoW
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 94D391F000E1;
	Mon, 23 Nov 2026 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452830;
	bh=ps/iPwcqdC4AQfhiiqXvzlyEE/xk71APo1FSjxzqBeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VlDaRkoWpeo2tXGINpmXJeC9iw+TXRJg2KHvhL4RrMRr3fnFDvMzwl5AgAwsg0Ncd
	 tAro8Z5mj0IzhvD/TBod/Dg+vvFQ61F9pFW2lIR+rguuWPubYrSYKl5MzhRDdKRdBD
	 vgrQr4G/NoV+ZYMtjEDraXmJhIf/AC8Xat8FG6pnzZKPKSihscdsWm9+D09cty+7uJ
	 4kdZ1g4o3hyLjSkhWUb4gSts6EqZGdwFn3XUEdQqepmWmbhClO0pM4BxDuyhbfUdkx
	 5znl7KDkMPfI4X708Cdnkna13bAyBaM3cG/bbnjhjacu5w2QOCxTHYVgQAf57LlcvI
	 zTpafxM6e8kkA==
Date: Mon, 23 Nov 2026 17:53:23 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/3] kbuild: reduce single-build dependencies
Message-ID: <awRvg0ehHuF7aA56@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
References: <20261111-reduce-single-build-dependencies-v1-0-7196ca986a85@kernel.org>
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
In-Reply-To: <20261111-reduce-single-build-dependencies-v1-0-7196ca986a85@kernel.org>

On Wed, Nov 11, 2026 at 02:41:02PM +0100, Vincent Mailhol wrote:
> Building a single .o file depends on the prepare target which contains a
> lot of dependencies. Some of those preparation dependencies are not
> needed for a single .o build.
> 
> This is a small annoyance because a modification of the compilation
> flags causes several prepare dependencies to rebuild. Consequently,
> single-build incurs an artificial penalty.
> 
> Move the generic preparation checks and scripts/mod out of the
> single-build preparation path. The first patch is a preparation change
> to make rq-offsets-file an explicit prepare dependency. The second
> addresses missing-syscalls check and atomic-checks. The third and last
> patch addresses scripts/mod.
> 
> == Illustration ==
> 
> These are the build steps triggered when changing the compilation
> flags (here: adding W=1).
> 
> Before this series...
> 
>   $ time make W=1 init/main.o
>     CC      scripts/mod/empty.o
>     MKELF   scripts/mod/elfconfig.h
>     HOSTCC  scripts/mod/modpost.o
>     CC      scripts/mod/devicetable-offsets.s
>     HOSTCC  scripts/mod/file2alias.o
>     HOSTCC  scripts/mod/sumversion.o
>     HOSTCC  scripts/mod/symsearch.o
>     HOSTLD  scripts/mod/modpost
>     CC      kernel/bounds.s
>     CC      arch/x86/kernel/asm-offsets.s
>     CC      kernel/sched/rq-offsets.s
>     CALL    scripts/checksyscalls.sh 
>     DESCEND objtool
>     CC      init/main.o
>   
>   real	0m3.603s
>   user	0m2.839s
>   sys	0m0.959s
> 
> ... and after:
> 
>   $ time make W=1 init/main.o
>     CC      kernel/bounds.s
>     CC      arch/x86/kernel/asm-offsets.s
>     CC      kernel/sched/rq-offsets.s
>     DESCEND objtool
>     CC      init/main.o
>   
>   real	0m2.060s
>   user	0m1.505s
>   sys	0m0.732s
> 
> (done on an x86_64 cpu).
> 
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> Vincent Mailhol (3):
>       kbuild: make rq-offsets-file an explicit preparation dependency
>       kbuild: move preparation checks out of single-build
>       kbuild: move scripts/mod target out of single-build
> 
>  Kbuild   |  7 +++++--
>  Makefile | 11 +++++++----
>  2 files changed, 12 insertions(+), 6 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261111-reduce-single-build-dependencies-966646f25a0c
> 
> Best regards,
> --  
> Vincent Mailhol <mailhol@kernel.org>

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
