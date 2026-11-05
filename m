Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863916;
	b=qjZi0r7wS1hHYooSS5vajC/HUZraDVqZsxPM4exAdbxTGAQz9XZQSfarBfhOS88TYn9l
	 aJ8F/yz2KNebOSsoPCDaOSCcS0rlWboHVTelIkBTtcdBvzx8x6K/IbqvR8eZqRv3gh1uH
	 CS+BNotJUA/i04EbiF7gYsV0gGdSkJmAjcdCA2HDOrdFEkXDfxveg9QvyLLuK10UHbPsA
	 lw9Mk9z/drxolA8psvSF7AQeli+xI2TS+lEpNLc+XPpMNGYeMyUgP01AOGut6klJV27m4
	 2kUS1ASUIsy0nqq5sREHrxhVPJIkdZrRxT6tohcOhaxLW7NJ5zmValSvtpJYj++LUeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863916;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NjGc1TPp0xOkq0TE8NHi20xeoX+nqJ/b3gkRrdoCLW8=;
	b=roMd3LXmXrYXdUp2VwHXJmkJYQB4LPfQLaxFbd50LPs+/VcR6hlXA0su5MVlotoztqTP
	 jImfmIMK8VhCWgCGCKWT4HxTz6MpiDEwddt/dofdTn9mCEpTfXv0VpbZyp5REdMR9UeV1
	 wXQUsOZIrfRQeAxoLAaVTGw6OdFc/M56lDapIjVxD3EPYkrfV1p/3L/CQwXLArEsA3XSI
	 8Sapkljz1pqYWmgInA5l6JvNAtHzaZD0mH+xd7YMkgQ9QYzzdRQG+W7fRPcrMIta3Ta9R
	 5JTgwTQjCXcs0XEKzruES5mM7UTFhLQk8Mt3luvX1+RUpeSpKAczjPOCH2AeMJjV4TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QLaS/qvA";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF6F606A338;
	Thu,  5 Nov 2026 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLaS/qvA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8131F0093A;
	Thu,  5 Nov 2026 07:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863916;
	bh=NjGc1TPp0xOkq0TE8NHi20xeoX+nqJ/b3gkRrdoCLW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QLaS/qvA5nvDRnXSgT0aiZKTEsRfTzPnfwdMSTMNy79UV8qzdR7W9Huwvv/OB/ndB
	 uALOlk+58O9AsebhB486VMopNpPOGQ7YKoGH7a2k1Q+9aqDts+swfaQLDPLGO+mDDP
	 PV7CiYeTaApJQJhf/emeR+8ut14RI2mpJ8kvGJD4TrHzeDayma0ZXgzwVIGeFQPOCc
	 jDo7hCcK+qaCZfGAd5u0QO22uFX0JC7RShCidKEK6gRqmO4kpHSdsXUJoXALeX9rLs
	 mw7ZzUmt2J9HxFPJ904gE7pTW6KoMmB1mkdiGdwnmBMaqiKnYXUcTQrVqbtEs/jxSJ
	 C/0JqRnlwUoxg==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	julianbraha@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kconfig: fix dangling check_top after an unexpected recursive dependency
Date: Thu,  5 Nov 2026 08:31:40 +0100
Message-ID: <179386358246.407677.563154238207301900.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008164528.3685545-1-lzsx618@gmail.com>
References: <20261008164528.3685545-1-lzsx618@gmail.com>
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
Content-Transfer-Encoding: 8bit

On Thu, 08 Oct 2026 11:45:28 -0500, Leizhen Zhang wrote:
> If the last symbol of a recursive dependency is a choice value,
> sym_check_print_recursive() pushes the on-stack cv_stack onto the
> dependency stack. If the choice is then not found on the stack, the
> function prints "unexpected recursive dependency error" and returns
> without removing cv_stack again. check_top is left pointing into the
> stack frame of the returned function, and the next dep_stack_remove()
> dereferences it:
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kconfig: fix dangling check_top after an unexpected recursive dependency
      https://git.kernel.org/kbuild/c/fa887263

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas

