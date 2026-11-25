Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648216;
	b=QfYB3QJ7fbII7OsQketsZJNiHSIXMq9jy2J1MsRrFpv0u6Hk4o9DjhTFa/Oug1D9kmm5
	 jcTzW7mKt2z7adOVAEEEAepCBJlLfU4yyzF7qYxr4YOEXxjoTKYoJCMLuIMm7QOFMbw5T
	 25qgd3+TJDrHR7vmT0DPJLnl16PUZEPA6VTnY6YrECBuJ1nz9I3KszdhKp4gB/cyvHLBF
	 I4XAmgcCSKjuAPO9QLOINY/PfZwNBZkZ15i1XpaIBVvfn2oa2Ex6AdOsdcS7g8jB3Lzwh
	 wu2LI1vH0KapWc5Vla698atBNWfL6dKesh7YmCTD7DeKdC8KBDy/P18MZJBAt6ULlBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648216;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=m3GJxlGj0azuDPZoGR5k/X5Csq7kPX8Bj7+lpyBb/r4=;
	b=wcT1F+hggYf92A7KqmXbaHLl8bG5NEP0jGqWIjxkoSXo2iFLSnGsO0N34s3+i3rMiB8l
	 Oa1zw2rUYUZDDrOMCQHjv+oNHBwLSQEliZWqUUwxFgE9eJ/gzTpf2bNsIEpFfnRsVMZGb
	 xDbvauT+OPBviEfvbvuaARte93x150YTUIEzuz6dv3gBG/fgEd3hqh/9zChA0Njfyn0Eb
	 poqVXIZNrccHFajnHbG1OAqU7rmxT+VH1tIDOZV0rJ54HsQ+LqqwmUulfVVyHL7RDzHz3
	 83EVtulIEvrlVPoeAJ2TbU1Jy33Wbt1QXxIS8nSBbk8GB8Hq9dOXc1QQQeznzcMAErw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LMrYJXXm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BFA606A333;
	Wed, 25 Nov 2026 23:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LMrYJXXm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD2E1F000D0;
	Wed, 25 Nov 2026 23:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795648216;
	bh=m3GJxlGj0azuDPZoGR5k/X5Csq7kPX8Bj7+lpyBb/r4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LMrYJXXmwE9Um5fWOppFdRbWQouDqJJnYjeaVF2jm0RD7mQs92975ePjPqPMESF+M
	 aJmFd8AdF9bqXqHy2fwqBTv776+/0W1gLJ2109/Xt1W2XG8K41FA/GGp6qgWOIeSrw
	 ZIvWNw+ZXUOAKQ1p8SJXQn3OCUW9cgAMBr0e0xz3vseKx1R++Mo/XbspM3JeAxE8Fd
	 VIOVetcJiZKoS3TLLi5GplVfvXe8RTQbP3JXkppLNWfSIK1yEvEmFla41CbwVU6xWs
	 ObqtmhShd77Gh+PoDZiwKsHw6c821D/LsNHwyaQZuqNLyICxO3Msl2fQCAZeZB6QNV
	 xxatrYD0pleiQ==
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
Subject: Re: [PATCH] kconfig: warn about malformed KCONFIG_SEED values
From: Nathan Chancellor <nathan@kernel.org>
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>, 
 "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
Date: Wed, 25 Nov 2026 16:10:10 -0700
Message-Id: <179564821041.3369856.2083626361406656618.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3895; i=nathan@kernel.org;
 h=from:subject:message-id; bh=yUref+BatIH1CfDhNYmtWum8QHtrY7It7k/mSbU2ALY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDNnsWZdyn3fz1B0+3u788+SV4opAXx/N4JK0bcZO7WeKD
 h+YFfGjo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzk/VdGhr/yirMyHQzfxKfu
 0t3xwjD8Q7nwgjnv7okqfX74XLF9KQvDf19Xj4Ib76wMbjunPzlY3DG9Q6MxdD5Dpv+uh/x79VS
 FuAE=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On 2026-11-18 07:15 +0000, Priyanshu Singh wrote:
> randconfig parses KCONFIG_SEED with signed strtol(), causing several
> validation and cross-architecture bugs:
> 
> - Artificial constraints and portability issues:
>   32-bit seeds in [0x80000000, 0xFFFFFFFF] and values > UINT_MAX
>   are capped to LONG_MAX (0x7FFFFFFF) on 32-bit hosts instead of
>   matching 64-bit host behavior.
> - Whitespace handling asymmetry: Trailing whitespace leaves
>   *endp != '\0', discarding the seed in favor of gettimeofday()
>   while leading whitespace is accepted.
> - Garbage handling: Invalid strings (e.g., "xyz", "42_foo") fall back
>   to the clock seed and exit with status 0, ignoring KCONFIG_WERROR.
> 
> Switch to strtoull(..., 0) and consume trailing whitespace so
> whitespace-padded seeds are not discarded. Reject 0b/0B prefixes
> explicitly so C11 and C23 builds behave identically.
> 
> Emit a warning whenever KCONFIG_SEED deviates from a canonical unsigned
> 32-bit integer, and exit(1) if KCONFIG_WERROR is set. Otherwise, retain
> modulo 2^32 truncation for parseable 64-bit integers and fall back to
> the clock seed on unparseable inputs or ERANGE overflow.
> 
> Add regression tests in scripts/kconfig/tests/randconfig_seed/.
> 
> Fixes: 0d8024c6ebad ("kconfig: allow specifying the seed for randconfig")
> Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
> ---
> Notes for reviewers:
> - 0b/0B guard: Under glibc 2.38+ with -std=gnu2x/-std=c23, strtoull()
>   maps to __isoc23_strtoull() which accepts 0b/0B binary prefixes in
>   base 0, whereas C11 stops at 'b'. Rejecting 0b/0B prior to strtoull()
>   keeps behavior identical across toolchains.
> - Backward compatibility (KCONFIG_WERROR unset): Non-canonical but
>   parseable 64-bit integers (whitespace, signs, -1, or > UINT_MAX
>   timestamps like `date +%s%N`) emit a warning and truncate modulo 2^32
>   across both 32-bit and 64-bit hosts, while unparseable strings or
>   > 64-bit ERANGE overflows fall back to gettimeofday().
> 
> Input                   Pre-Patch (64-bit)    Pre-Patch (32-bit)    Post-Patch (32 & 64-bit)
> ----------------------  --------------------  --------------------  ------------------------------------
> "42" / "0x2a"           0x2A (quiet)          0x2A (quiet)          0x2A (quiet)
> "0x80000000"            0x80000000 (quiet)    0x7FFFFFFF (clamp)    0x80000000 (quiet)
> " 42"                   0x2A (quiet)          0x2A (quiet)          0x2A + warn (WERROR -> exit 1)
> "42 "                   Clock fallback        Clock fallback        0x2A + warn (WERROR -> exit 1)
> "-1"                    0xFFFFFFFF (quiet)    0xFFFFFFFF (quiet)    0xFFFFFFFF + warn (WERROR -> exit 1)
> "4294967296" (2^32)     0x0 (quiet)           0x7FFFFFFF (clamp)    0x0 + warn (WERROR -> exit 1)
> "18446744073709551616"  0xFFFFFFFF (clamp)    0x7FFFFFFF (clamp)    Clock fallback + warn (WERROR -> 1)
> "0b1010"                Clock (C11)/10 (C23)  Clock (C11)/10 (C23)  Clock fallback + warn (WERROR -> 1)
> "xyz" / "42_foo"        Clock (ignores WERR)  Clock (ignores WERR)  Clock fallback + warn (WERROR -> 1)
> 
> Tested via `make testconfig` (40 passed).

I am pretty ambivalent about this patch. Most of what you bring up in
the commit message is in "who cares" territory for me personally since

- 32-bit builds are going to be pretty uncommon nowadays

- Fixes is over 13 years old and it does not look like anyone has
  noticed this in practice based on searching linux-kbuild

- The documentation states this is just an integer value; if people are
  plugging in arbitrary values, that's on them

- Most people are just going to be using a previously generated
  KCONFIG_SEED; can these issues happen with the default logic?

That said, Julian and Nicolas are free to disagree with me.

-- 
Cheers,
Nathan

