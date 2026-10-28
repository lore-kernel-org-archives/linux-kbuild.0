Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219961;
	b=ALmWiXB4XqqFPzm0S1fuF8jeYVqLhrM5VDZBDhK5ua2cdCroe/JZITwS95xXy7yIJ/Zk
	 X57b3pPVWAZW3vUX1SO4PKA1euDPeDiRpH8joo69khm+U6b2kHtp2mjs31no+u44hjHLh
	 xXLj2TZXb1ItBzcepNGdXjbwrgEiTSQzOUVbN7ZiSArqEzcvdH6mAhC2tugxAhA1aFDPS
	 e+FQ8mRHYYCyQKiIgtr1gheKe/D67sECgXSoz9nyvJI5JcyDDePKs2eDb12/mE832+sGV
	 qibljx6Gbg4BIhd49EljH3wSu7Ndv9AU6HEgL1B7QYBAV9JLjEfWT+TVAtkjBcD27PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219961;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=AsqdEmF/8xgiYYNQxurq8Pu831i2D78zYIQi5P7Tf4Y=;
	b=cBnLOM3nt2VbyeYxVWrPRuGsNcTno4CHL474/+GANZZWFn/FuIx1pSz55CnR9rJoRVjC
	 v4e7pVl0KyMp463r9de9uZoT07NjRLpInNYpZ6QmSgoxwWwciXYnnTTxpV7sYIuVdbHHQ
	 1vVvK6dW0mQaIi5NX4oTJxbN+kaG+0jNOsHpPxnve8bfFHKzZ+Hc/ea0yiLzTtXoKjfNc
	 rVFRINqE/GXAJU8jZ8r738i+Z0JpxXo2jfUf0sHYIv0OIs2fv/KvRHPw5kL4bm+XWTDcK
	 TWp3N5aeh5Zav/dIgHcjuADrAsQjv4cU2c3sLGSwm+qeMWxT6k1B3ltGtn2pYda2jyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqx26p+E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81556606A31F;
	Wed, 28 Oct 2026 20:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqx26p+E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396B91F01825;
	Wed, 28 Oct 2026 20:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793219961;
	bh=AsqdEmF/8xgiYYNQxurq8Pu831i2D78zYIQi5P7Tf4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fqx26p+E27bygQewzuLIfxb6QTpK/NxrA49m9reuHlYzNigciYcfpcPAaRIjE/Zwf
	 +juQW8+wbymRhgMNADixLLDfSfFAErufxe/uak5P4Wnya+Bp/RIR+lQVsF6vsYI/fd
	 VfUEorRBkx3Cztwl82JuOnswBQ5JfeivCzJyA7ZR+DYdMe42u69sAdYd3JHCMJTNPc
	 z+JyQfvRr3Ybt/qheGHUbQeyB+wc6jx/YEwmiV4NfGBgTrhFDjOV8fQt6YB90g/Kva
	 C1Dd7/M7na+xkJ5LMMhZnHrB1ZHG0o9gqs5u2bE26ODIstaqBO9DT6a+oRciD9Md9i
	 kYq6RUXDla5aw==
From: Sasha Levin <sashal@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Wentao Zhang <wentaoz5@illinois.edu>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nsc@kernel.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [RFC PATCH 16/20] coverage: add MC/DC measurement
Date: Wed, 28 Oct 2026 16:39:17 -0400
Message-ID: <20261028203918.2355157-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028191432.GA669102@ax162>
References: <20261028120034.871983-1-sashal@kernel.org> <20261028120034.871983-17-sashal@kernel.org> <20261028191432.GA669102@ax162>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 28, 2026 at 12:14:32PM -0700, Nathan Chancellor wrote:
>On Wed, Oct 28, 2026 at 07:59:40AM -0400, Sasha Levin wrote:
>> Larger decisions, and decisions the compiler can't instrument, produce
>> warnings. Starting with Clang 22 they are kept from becoming errors
>> with CONFIG_WERROR; older versions can't be used together with it.
>
>What is the reason for keeping these warnings in the build as opposed to
>just disabling them altogether? Are developers expected to address them
>and if so, how? It seems odd to keep them in the build but prevent them
>from breaking the build unless they are not intended to be acted on, in
>which case they should just be disabled outright.

They're not meant to be acted on. Clang only put them in a warning group
(-Wpgo-coverage) in 22, so before that there was no way to turn them
off, which is why I just left them on. I'll disable them in v2 where
Clang allows it.

-- 
Thanks,
Sasha
