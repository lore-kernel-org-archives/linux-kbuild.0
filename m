Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618903;
	b=l3C7vJN98TQj9jnJ/Hmz3OQLKUTmlNjfr3d9XA7DGGAsfeYNQnaoHun2/fAX5cIijbhu
	 yQdwkb6LFF8zWHRSmGEaKWINcy7fAwfJPG2d4RWynm8Z8cWParM8tv21u8rsHrf+tB1tY
	 Cg8LAOF9hmopyIAvfbcRCekh/T6Iws2/Vq1Sw4qDekUWmP8axJhmJb1n3CWKGmAwYfsOj
	 1aUXKwx3yZQqeY3gkqmdsJtfStn0+AbEPgCwKN947GU6kohGkQNmmCbUHnNNQ2pVqEsUL
	 8oZSXH9VjoSR8aKM52ZGWyBuvJJJ75JAjtLLnzokmLM8oKKDzg+2pdm1aChhWESB4jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618903;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=93nW0xMrHaJLt8aMpFUvR4ZPiVJmFm1dhWoCVjWtHv8=;
	b=jOsHTdpQLtrUG/TISkvsITZSFc5p5jIhN/1alzaLb1tgfB8RuR06zluI6sP0BqRRyKOz
	 dQ4qC6RvOtbC7/lmY2ZY/HzT2ZfrnKxaTO6dofIIaS/h5KZK4vaQiEnEdtMpcZ75iF8b6
	 E0RNlGrYS92xCSOJYf6ul79qU4xSSoMA236sJpaEpmfg4cwVsAr4KOJQ/3q1tKAjhEg4d
	 uSKqR5y7WJLKNE97E+gtja2cjHLARS8q5u+/pM7iR472AVYj5wU9Fpf3pkiGPHUDENVF2
	 +lRF+Lrb1kBOqvBAlyv4Oo+zdugYeoJ8smBf8FWb4IfHlCEn0gencCZgg0GEauTMLaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oIEgv73v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 2913E606A33F;
	Wed, 25 Nov 2026 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oIEgv73v
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4B88B1F000EB;
	Wed, 25 Nov 2026 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795618902;
	bh=93nW0xMrHaJLt8aMpFUvR4ZPiVJmFm1dhWoCVjWtHv8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oIEgv73vy2gPStQRtXwkcIle/V7q0FAmg/yOzuK0PYZCORJiJbTmg2LKlyjnG/TBD
	 lgUazJpbFenzyYf03/SqR7mY5xHgrKyfbThTj8oa4alzx1l8TWFTzqysdVa4E9EwSt
	 yzy/urV2BFmxHsBkdCXi7UvFMvkyF7l58uDMpEMmZL2vddy4HeCCPsXZt5QeXhXlvN
	 aJi74AkITcl65LGZYVUFE4S8ckDBbokmRyWH+1ItUThhLHJSf37BQ8t6Pd8Sx5qqcR
	 vGTomCIYLkuoizQT6AxNQ4iZnE06fB1eVgTxJG31d7lS8MI9cRptnns8XvNcDBmhS2
	 zVTMn2miizRmQ==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Vincent Mailhol <mailhol@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
In-Reply-To: <20261113-reduce-single-build-dependencies-v2-0-93ba1f6c4e46@kernel.org>
References: <20261113-reduce-single-build-dependencies-v2-0-93ba1f6c4e46@kernel.org>
Subject: Re: [PATCH v2 0/3] kbuild: reduce single-build dependencies
Message-Id: <179561888916.3651437.12461319177023857022.b4-ty@b4>
Date: Wed, 25 Nov 2026 16:01:29 +0100
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
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=PAw4tpekebtZSCkAOQM9YqvyoRpg+KeD0qebAC9iOrQ=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBrBvhMhElszUEPKUU0SZfKkAtmZ+SEqfA7atakV
 kUVHqzY2DWJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCawb4TAAKCRAHUgpwFiYS
 ae/GEACxK56c5qxAFto3FRoYuTqW34yrDOnFccoTu8AiU6ptwIoXnWND0JBOsVZtrjRuiGOr5B2
 w5UmcEjCcH2nRqRSGT6yzR+vJRNxEuIPxiRhDy+/0umQwDZv6dHfYcDKdz1DKSRCLLkHyepNq3W
 nPhz2g51GdZ4MtGJoWrWDgdNXogUWH/E19yJ7qBOOSAeOQow8LpTj+c6A8aJkeUmjtcRC2w59QF
 92OxdC54K7qE1j773V6gx2eZyHmTGsW1ECWswC8snxXMFCzi6MDJY0eyWMunYbaFvh6FzEHbarH
 TTl/7gSAEF1FhzgY+Dfe24rQb5vakUx0DSso8YS3CKgOXCu8Dikw7ryWU8WxI6lA7VYKCPbyQeM
 oskzINpvJOT1410xmIJF1krimC8QgS4f3bZLBQadG3MfP6RegKEvzYRTsXfe3TqSH3pLSgtRmZ+
 5UtSjAcKNcPzFBRHy0Xgb4XLlQVeE6lv9VjIUC2KO04IHwrno2+CQZp/zekbZqnx9cAXdnSjbbw
 I/T0tQ/kjFg8OJsAMHbR0GGihN+f14n4lHjlFXsd1nonSkckoWyfMhLPnSRNRwuU/xkyVXq2L01
 xfOE3nt9i7xeIxM3VO5Pfso7B/dRFQNxkSNRXKSDv4HWo61RCRwpOCeltqHv1UzJ3kBtmjFjEGc
 oRKIFYRJv/SHlXQ==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Fri, 13 Nov 2026 18:57:04 +0100, Vincent Mailhol wrote:
> kbuild: reduce single-build dependencies
> 
> Building a single .o file depends on the prepare target which contains a
> lot of dependencies. Some of those preparation dependencies are not
> needed for a single .o build.
> 
> This is a small annoyance because a modification of the compilation
> flags causes several prepare dependencies to rebuild. Consequently,
> single-build incurs an artificial penalty.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/3] kbuild: make rq-offsets-file an explicit preparation dependency
      https://git.kernel.org/kbuild/c/7e9b69c5
[2/3] kbuild: move preparation checks out of single-build
      https://git.kernel.org/kbuild/c/b9d3d3d8
[3/3] kbuild: move scripts/mod target out of single-build
      https://git.kernel.org/kbuild/c/1b9279a5

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


