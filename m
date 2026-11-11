Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424218;
	b=PkGzmcE3owbYr7IFs60djZe3/wf271Qn7da0np/VgdewB4swuOGqhESgkOLCwWCq1X6d
	 8qLZkXesF3iMKrqx//936xDJ8aIL8BNs03M0L7YVnp+yd19+o3a84/FC/XAaiQS8F/SnZ
	 Ia9JpSi39szvMTfDdgwdm3hQGH13ab0Tdx5NnZs4yNIFqiG+anOOGiWCoHSn9YoRBktWs
	 pNXIhW/hQHCrIQp5uO8kyJSz7aZoGX202kQ8egWIpLx77cg+fmK1kd8x5EAtNxP/3qKxc
	 F7bF0yhHevWudN/vID62nMK5R7bxii07YBbxvMZut0MrQ8a+JmbLkOoL8TsG91uyjKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424218;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=+rBX7d/EEtg3bXXJ8i3/SD7ofTCrRkqKBFM77ENN8Mw=;
	b=K43/aG6RLfSVAXsunY86pQMH9KcugYMgalp9Z/2LUKGSN40He9XeOVEyXuSlIYtcHmL9
	 f24h6m5lgH1BUp3gZJEblgfutcQl3yvKkB3dPHFFZCCmQrtcpM2iV0EaZvH16iJRgeJ5g
	 ISrHce9V/2jYl7IjWoNVZLIXkWbCpoXJguzIpMrcVXOmXrqFyaD8cYjzsVJ4ACYot/XCm
	 CqoTRmXb8M/lfcZjGLUyME0JnDMpzZVbdrRtDfnlIeRLAI4iw2QeFPKP/eKgQDigknl+O
	 DAPb28DaZxMtxu8wvHPT958+/3ymmInqQk9Z9tYpcrWqtscKDZx7whruGfKs/PDNQJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lC6M5Xcm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DABA606A324;
	Wed, 11 Nov 2026 19:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lC6M5Xcm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62921F00A05;
	Wed, 11 Nov 2026 19:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794424217;
	bh=+rBX7d/EEtg3bXXJ8i3/SD7ofTCrRkqKBFM77ENN8Mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lC6M5XcmXeAjB6/G56JuQP+f97s1Kseg/6LJYhtCOa5xMY5kCisJuGfKik0iB1q9N
	 pbYK47QGwW1wJtwpCtX89LrtsQ+IPsyQi8rhSSZNHTUD1MkcRgzhzJ072VlB2LDIs3
	 pDL9sWAuheGhoMw7j81HoYcqPBntfrhdU4csequY+ETM5lUvSfCG8qf4u83/FaweMY
	 TcIBOtyxjLsObe+OltjqLCxkG4D55uIRlKl3y0RQGJdI6bzDk46qvcxdF5o6zBMqYi
	 fbQeSQBVumEQUjzHsjkh4T/FGvRUVJ55JFAqaIvUYROg3I1LK4zPsOL9U+P68QDlCB
	 7VZAnrMJn8sTg==
Date: Wed, 11 Nov 2026 12:10:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/4] scripts/Kconfig.toolchain: Remove
 CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
Message-ID: <20261111191013.GA2689488@ax162>
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
 <20261110-kconfig-toolchain-updates-v1-1-6d4fb636290e@kernel.org>
 <CAKwvOd=gkPRazfqjd2xpvW-Pr8gLXVvxBYuzuyAOWi2xwinRTw@mail.gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=gkPRazfqjd2xpvW-Pr8gLXVvxBYuzuyAOWi2xwinRTw@mail.gmail.com>

On Wed, Nov 11, 2026 at 11:06:06AM -0800, Nick Desaulniers wrote:
> On Tue, Nov 10, 2026 at 9:42 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
> > index 04f4ebdc3cf5..f62de2dea8a3 100644
> > --- a/kernel/gcov/Kconfig
> > +++ b/kernel/gcov/Kconfig
> > @@ -4,7 +4,6 @@ menu "GCOV-based kernel profiling"
> >  config GCOV_KERNEL
> >         bool "Enable gcov-based kernel profiling"
> >         depends on DEBUG_FS
> > -       depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
> 
> did you want to retain `depends on !ARCH_WANTS_NO_INSTR` (deleting the
> ` || CC_HAS_NO_PROFILE_FN_ATTR`)?

No. If CONFIG_CC_HAS_NO_PROFILE_FN_ATTR is always 'y', this whole
'depends on' line is 'y', so it can be removed entirely. The noinstr
part of that dependency was only added because the "no profile"
attribute is only relevant for noinstr.

-- 
Cheers,
Nathan
