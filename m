Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214879;
	b=dM1dOGgzXiVPgayqxjzBnuyHkHmrWDqaPM5FC5InZUor9npwglEcYWf5Hm7VeML+InpB
	 zsb20GDBRHEr3NI9UDIpVmiNuvXXVZn8DuMsRe+Prgdz+VWoPhqpJzIpS00iwSjplXexl
	 QoLtGC0OAeyksf+wL3CNU6XpV8yyW38h1HZXlLmyAja/WS8Fe77/hFb71AIXLKkR89idS
	 9knURm4pSV8hNddrjW9ZUOQJvF0s3ttEK2g/0+9VBS1KyErj+dKu7hPLbsfKUJLN1A6Ju
	 GoWIZjMlvE7P0uTY7dQZL7BLonAH4qfb13DKeVDHPne+2lbOEai8fF4G1TqxjKMU5TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214879;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aWVDvbEQQQ1SjDTO2dDhPAAkUx0gj3dMclo/LMFAu/s=;
	b=ml794H6YkaEpHB5q1aj3W4Y66b9XmZ5MofzrqWSqe3MJ88szjJnd8FUUpkTJr7H28HoU
	 h9MB6mWA+wnOb586IXzrNNgRUAhiGWQDt4ViLyiE2cO+7v4dsLj2SNDOHDWCWoMu+1esT
	 ZReUQV8Yf2jzapmHdYKFqYdpAk+vUKIB7I3wkKV1bRyQhbPf9iPIgd2eWaEE7vtAZ7IZ8
	 GJ1NKJf64GSdli/741frFS4nleUdBhW8A0WAcx2Z4nHWnz24SDkoMWMGLI6qkpnEaLFty
	 jmS7C1xiWI4WgxnAeWx8iZGRd3Y5+VxVYSqw1w4O/F9fdyRe5SkrhWd9ivYol2+fMXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7eMqn8a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF83606AB38;
	Wed, 28 Oct 2026 19:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7eMqn8a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296641F01828;
	Wed, 28 Oct 2026 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793214879;
	bh=aWVDvbEQQQ1SjDTO2dDhPAAkUx0gj3dMclo/LMFAu/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h7eMqn8a8EdRBoi0X6nQ2LgNYHVdM2nmxsFYYPFJhseEhpgfO/hmFqWZ8d8bMYDtW
	 T0nx51XwU1r1azFSFuhrqHZUmWELHLojmC3c7BOgrQ5PobT7aUyr0d+Gpx/HiX8zYT
	 q7f3N2oyG2j5j/1ZK4aSq7pKJxO/azTvygQs1JnyosJ0FE4r6V5TtdSvDufRuhgxDw
	 6P9glPp8xTu1YRQEf3bM/sveV9h05QQ2FcH9jhPhE07r3GQtvVODHdO1pPxTuiDJdB
	 PdkBHXIuLria+haObP79SizdHZULGJKIRLSmhFJHaKYxBgXc5rpjZwysCwDiti/0+3
	 LNZth8EzkCjKQ==
Date: Wed, 28 Oct 2026 12:14:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, Wentao Zhang <wentaoz5@illinois.edu>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Bill Wendling <morbo@google.com>, Chuck Wolber <chuck@wolber.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nsc@kernel.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [RFC PATCH 16/20] coverage: add MC/DC measurement
Message-ID: <20261028191432.GA669102@ax162>
References: <20261028120034.871983-1-sashal@kernel.org>
 <20261028120034.871983-17-sashal@kernel.org>
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
In-Reply-To: <20261028120034.871983-17-sashal@kernel.org>

On Wed, Oct 28, 2026 at 07:59:40AM -0400, Sasha Levin wrote:
> Larger decisions, and decisions the compiler can't instrument, produce
> warnings. Starting with Clang 22 they are kept from becoming errors
> with CONFIG_WERROR; older versions can't be used together with it.

What is the reason for keeping these warnings in the build as opposed to
just disabling them altogether? Are developers expected to address them
and if so, how? It seems odd to keep them in the build but prevent them
from breaking the build unless they are not intended to be acted on, in
which case they should just be disabled outright.

-- 
Cheers,
Nathan
