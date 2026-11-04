Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776795;
	b=gz0oFHcN4NHp0a4McyjKenE1pp6Iw0Q+AsP8VInuexP0deh6CQWb1exUwi1dBmra7qXU
	 XnFVnvm5XMyVUN2J76O0z+wqjDXkMhBhHmmxgEDLBKhFpLzwyAaBn0PPBofd6dzn8sJwv
	 daT+5aFDXPecBBqGXvuiimE+f7HW3eEW6yv4o9r3/rTGnpv33UUHYJ2LXAxs0YnE1DE5Q
	 f1kK34IheCgfQw+5Ef1sZOBns2bH68SQq8gTzVnbb6ryf7epv351/NNlGauaPMLF2Ih9C
	 VMcF57awrP7I4lUACJQ+DM5kN0/xKYCkJh8ZAfz1vpyM5hUA8tnpOPUGF/BWpB7psHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776795;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=uIRkKn6uoWxcDOi5p8SVIeStzCN1wuOBrWkpwdJMI/c=;
	b=OQ9QyEotH0A1r4gcwNl+7ulrb3W8zL5XnQiqSTqZcdvtti8Qdh2CKdm5atJ3D1u46NGL
	 gBueVVJubyNf0Kx/VZKg75moRYTL5TgNR/D9cQQ3/7qVp5Ux/CXz0O7r1ZazR97pmIClM
	 as2cUMk2SyqUILd2RwKDDbj1m4FuoZ4ghNHvRGFgFN4NS2YAY/TtEVD17L5CXUeKf7bag
	 pkadtb6NoP+5PGaUwldyOISvcfRdBGTUapb9eysQR6znSHRRlENEhPyH4YeWOfs77mLYD
	 qRT+n+XagbRrY8VkVtI/SEIIw4caheYy2cvEPGNk6BRA8AHgRDL5ihOAJQshXGcRgWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H03d/ywy";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D5A606A32D;
	Wed,  4 Nov 2026 07:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H03d/ywy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F411F00919;
	Wed,  4 Nov 2026 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776794;
	bh=uIRkKn6uoWxcDOi5p8SVIeStzCN1wuOBrWkpwdJMI/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=H03d/ywyeINYckpmJB5NdEvd2p69fNcO9Q2XxyJ14yeVe7P+OMJB8hu+3+XfflWD2
	 N8YT0RxW9ZXxsAkU+G+gYyRY0FbcjQYnXfzcXhwEYjjb5rZEWg++oNH/sIbpNxZhAY
	 Piq+D0kh6XVC/OWBNfO75XPH2/c5JxS8+kw57tcz+wJBSfcsE/cyv+bINfyky3/bvg
	 NJev4rwbv4W/HXqlM00rVmldlT1iFEjIFQgdisVQ65PcOLuJKqL1nggYGjKxiwrToh
	 fdShm8QPC0sPhcuJkQKPO2ufSvopXWGZih+3QdD7xmUVUcBYQskdGhKgmr35g7Kha3
	 ieRCrwkOYCcxg==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
 Mathias Krause <minipli@grsecurity.net>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260923123936.2227924-1-minipli@grsecurity.net>
References: <20260923123936.2227924-1-minipli@grsecurity.net>
Subject: Re: [PATCH] kbuild: prevent building single targets twice
Message-Id: <179377654924.66367.8940768399381296629.b4-ty@b4>
Date: Wed, 04 Nov 2026 08:15:49 +0100
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
X-Mailer: b4 0.17-dev-fde28
X-Developer-Signature: v=1; a=openpgp-sha256; l=728; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=TrTzQAk266kLjmg6LbpybPxDMuFphoTLFdvjwRD8zWY=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBq6tvKmgglQYMzf8kU6aIqfDl+44sKSIruVduoR
 EXMkeSozxGJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCaurbygAKCRAHUgpwFiYS
 aQJCD/96BNYVHifdXqpNEi+pqFwetpOv/CUnPbkicMuidJ53FLrgoYmeaW7c46O4bJCYN3nviqH
 QulTFCjKMHY54Oc7t4GI44Xp409n0R4VEne7RwyIg10GqlQ1tfUW+LhnJknvCy1VhzFCV+vN9fy
 7WlzlBso9PQtBotD0Qsq5l+RygkiyCMVrJRsIcYaDybEMs0Dw89Tqk6VgTUeYpGB6gYvKRMADbH
 hoLA95r1dMfDLFUyU43T+/3cZBGx+MdmwWP8NtoD0mhuA5K74EuS43iVbnVPZd6xkES6XxeBHIb
 xJjgRRqb1082r5oxrv609agn1Vhtit3KCt48JnGjrZGMXLPKaZXpu/uA5e15OfrAFn1at2hv4CL
 c+jukgk8xiPdhXe1WDdgJUKGZ2nQad2hv6QnDtfgv5f/38v1a5RSThYhp8U7qXkp2EMxCWSmwcw
 eOi4YsCjdRE9mC2SZcYRs6gSfE6rBxDaRfsKSzBzZgvGPy2jWJkG6rtwJ/8LoDlhtFnLbsQ2q+3
 hOCNPXXEcheuXXJHw3496ddZCASbgWU6EhjU/hWcLjS9n0wUhkI3qHPTuItmTERtjwKm3kLi1IS
 QcXfV7c1wrAMzJ8xKgMil9KlA1V7BsUcXV9HiDcmUrlqds/yb475gNYO4lD1RQ5cBVRylb4LXh1
 cXo/fzMl/xIO5rA==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Wed, 23 Sep 2026 14:39:36 +0200, Mathias Krause wrote:
> kbuild: prevent building single targets twice

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kbuild: prevent building single targets twice
      https://git.kernel.org/kbuild/c/329d8e7d

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to a kbuild-*-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the main branch (kbuild-next or kbuild-fixes)
in about a week if no issues are found.

Best regards,
-- 
Nicolas


