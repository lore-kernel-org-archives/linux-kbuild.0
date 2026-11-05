Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851605;
	b=CvTrnXQx5WgpmuftdO4jEFywrIkipOpFplZEU7exAy1/jZCLZfCTPJfuhB+qLZwDqsGQ
	 dk4zHD4WKzS6TajQMjKHI+UDEidHwV2yOKCV5tYuxF2eVq3ELW5o/IcJE92tV3WuWNLxb
	 gTvtpNCQtgk4msY45YjNFQIOq/Xm3m1J/zHU+hIM328LoUdEPJ35/eKmdyPbdJatMo2Bf
	 lFFcgiXF5pizFcYLWd9lNb1c6MURXQosrpbDwHWQuyJrwwhqP5LABqrsAid7FgrzwZZ73
	 DjUU6PIm6HzuJ7X3ZV2vDnjpXBX2pQarQulPc+x0h2QIE0vgnYcYvs0APFxb60qmaSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851605;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IZ0bc19mShU8CRBKQ/MWs57BmD5jYU0VvDsgtRwVk+s=;
	b=bXj87Q4Dw/j/sm/sm/2gW7mfGGbjCs1q427QFdCZwTFUT3LT5bdCqxW0oXXhLHp0d6Uv
	 5UCNopVNDmoyk5mp0RXvPG8ec3JBeF5VDyRVYGBKTdHb42WTaCqp7jFaGnCUOziKHWTH+
	 eapMrqJez9arvm8B2D+hWzFDL/u0RCxILdKgNZrIWeBvFRwHFHavLqEPsLUJqC/5Xdmid
	 F8qfB/nTbCLnHlWhjKuK376Tn79yeYgjprfO1+Y1r3Zfs8q1MVnw8ezJqkPpvIEV2d9jo
	 Txjb5O12IE8Qe1kxOdtSJaj3Rj5NMNto69GWgdptyY1tQ7JBYG/PSHEpsN7pWgwrkwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBDVozvr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B4E606A31B;
	Thu,  5 Nov 2026 04:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBDVozvr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7171F00A02;
	Thu,  5 Nov 2026 04:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793851605;
	bh=IZ0bc19mShU8CRBKQ/MWs57BmD5jYU0VvDsgtRwVk+s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GBDVozvrSGEe8RW09746fW8FlXK5DACWUygM3bX+0RSrkvcDzjtCKcP8kLUPavcqJ
	 EP9/XF2Q57+lCdlmOuLm5zUMEBGimsfWk+Ws2HuSSp3SVHXvoeuw6Upod17K3J69GU
	 3dSiAQnn6xSDb5unn+n6CaBy4ktUlGYELA9N6hpECa+XCbHm8MdfCJDK1ao7Tq7jgj
	 4lfrjOZLasSkkgQ4szUZ97dwHKuw5vC67jzQ6clWcMbDpimZLCSbeDJF1UVNYv1xCc
	 eTMQby3OK30P4kP5eNN7arZbxjqM/Jhr6SwRG9rZC0L2zclBfmCtRmsUAT8lvuBQhL
	 49c0Z48DnclQw==
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
Subject: Re: [PATCH v2] kconfig: fix dangling check_top after an unexpected
 recursive dependency
From: Nathan Chancellor <nathan@kernel.org>
To: Leizhen Zhang <lzsx618@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, julianbraha@gmail.com, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261008164528.3685545-1-lzsx618@gmail.com>
References: <20261008164528.3685545-1-lzsx618@gmail.com>
Date: Wed, 04 Nov 2026 21:06:37 -0700
Message-Id: <179385159707.826739.4691823071555399095.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274; i=nathan@kernel.org;
 h=from:subject:message-id; bh=6vaMQPq+oJIi+T4T9QwlIS14IlW6PmuZNte86c8SeT4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlvGC4c+nP3WOhCK99V6iIeW+pvL9+/7ivvk2vXM7qn6
 Zz/EDXlSEcpC4MYF4OsmCJL9WPV44aGc84y3jg1CWYOKxPIEAYuTgGYyNsqRoZthfM9b6s/M2Or
 +TNX60VdvXna+t0VwV7lZb96L2UVe09hZPiu33Dk/a0Qn/UWjd+vLVB5I/p5h/yfznsCTvNXOXh
 oVnECAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> If the last symbol of a recursive dependency is a choice value,
> sym_check_print_recursive() pushes the on-stack cv_stack onto the
> dependency stack. If the choice is then not found on the stack, the
> function prints "unexpected recursive dependency error" and returns
> without removing cv_stack again. check_top is left pointing into the
> stack frame of the returned function, and the next dep_stack_remove()
> dereferences it:
> 
>   AddressSanitizer: stack-use-after-return ... in dep_stack_remove
> 
> This can be triggered by an (invalid) Kconfig file in which a symbol is
> a choice value of two choices and the second choice depends on it:
> 
>   choice
>   	prompt "c1"
>   config A
>   	bool "a"
>   endchoice
> 
>   choice
>   	prompt "c2"
>   	depends on A
>   config A
>   	bool "a"
>   endchoice
> 
> Jump to the existing cleanup at the end of the function instead of
> returning directly.
> 
> Found by fuzzing Kconfig input with ASan/UBSan.
> 
> Fixes: d595cea62403 ("kconfig: print more info when we see a recursive dependency")
> Assisted-by: Claude:claude-opus-5-5 ASan UBSan libFuzzer
> Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

