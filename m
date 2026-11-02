Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615190;
	b=zbVW5Jfx3J9U1ClOn7FginHyfUCqc7/TLwznO1YnDi9O2lDkVGdBN6bHGjpZr+llfyS2
	 KoX95Ylkh27/7YhsqDOxAzgvYpjuKzCe5WI84IXdLuOaPTO5pbc1lBWAFZFELh93N091v
	 Z0KWE6T477ImhL9g9ySGJepjyYGrDLIXqQrIh2xgHc1PgKShufKYLeGe2Pi5Ahk0Ity/r
	 MaLa3vlnD3RgATB1mvZm6JpFAB+MyvIfRe+jvoX0HYEeKCXiBNJuKUVxXgs8AE34dL5bD
	 2y1KC4pbJ8KVeT50IP9rj1Fsk69SOs+5id8wIFNlcHlIUqbSg9C8gWLTLG+e9hT33yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615190;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=QE4Fm8P9kaRPnSUO+vequIWxhQjIp0636j59RvPYeZw=;
	b=Q+uKZk8RhKr7cXOhCVS2OkGpHtVCjHRk7EjqQVwmpKIMgkg64LK6YZ9UZMfxYnFJtDua
	 cbpUhkOYRwhGjpfncNdjHyHfTWhNAJrTI7/zWJIkf4KVeFdTYQXjb0Sc/J3EehnUwTmo3
	 XKooQNet9KpVbZzcz+RLkqh1Itrt/hIw+GUHJQ05M64AWK3Z7kHZDNmhwL8g7yw88T0m7
	 +JwSYgsuOjjv487LU0Dlo7cyxmUG3Hb0rOxwlekzseLhegNZJDqrGDPnQuYR1UC5o6uYT
	 X9Oflzb/HlpE7y0f3NjzN1K1tcbG5vL/6LLwoFaBjqF+HqrwEAtgHGNhU9POU6QxX5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aIfYYy/9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E33606A324;
	Mon,  2 Nov 2026 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aIfYYy/9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84611F000C1;
	Mon,  2 Nov 2026 10:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793615189;
	bh=QE4Fm8P9kaRPnSUO+vequIWxhQjIp0636j59RvPYeZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aIfYYy/96l8rnWUYfaTJEpmio4b6R2/quUZPo66qXhO4D3NkPs8TDzt3JFrpYjUR2
	 KvycBbU1clN7lU/phc5Q8/REGeaU6eWmTc/bRj0a6AtXJ9WvAf2NpMAm7bkdRdUWnu
	 bQTHsN5KoRdID1DnkDJJKZvGjaQzCEgzhwaIXIzeEjOE5LGfSiciOjhR01jVU27Ebp
	 LgvFrINofw15VkaOd2PJjAFmRCsDmXvabwiXQgUOugAoZCA0I/RFjihYbXqIgOYIZk
	 GaK6c8r0hbk54L18/i+YF07XEnEsswzOFfUi4CQq6lCCbLe6mmi9h9FgiaKSEAQfnQ
	 KuQX6kPDuHMwg==
From: Sasha Levin <sashal@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Speed up KConfig - fix hashtable confusion
Date: Mon,  2 Nov 2026 05:26:27 -0500
Message-ID: <20261102102627.526313-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
References: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
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

On Sun, Nov 01, 2026 at 12:08:15PM -0800, Linus Torvalds wrote:
> The reason is that it's called just a lot, but it *really* doesn't
> help that the scripting versions of the hashtable functions has not
> understood the subtler issues of the hashing code that it took from
> the kernel side, and in the process got things very very wrong.

I'm not sure why we have a copy of include/linux/hashtable.h in
scripts/, but it's silly that it has diverged slightly from what we do
in-kernel, and now we're chasing bugs caused by that divergence.

Can we instead align both back to be the same, or even use
include/linux/hashtable.h directly from scripts/?

--
Thanks,
Sasha
