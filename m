Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465114;
	b=2v9Eyi1/pmCaKEn2wUHk9S4gz5J+lUoshqPBidw7mAEgtSOH39DXCFiPPga1IbCuE8NE
	 OWhKtMfvMiwNSIHBebLiWg5o0QddcEjfrOzkY1asQylGZUgYfBhQtLjuW6h4e+FqvPqcC
	 0jNMoRGDUG++5HgBYaIkNb7dct5v5WzuC9Ma1puYK12xx657SLRUSq2CViMh4Gg7OdTew
	 0/offiORsrOpNY+bMtjlmjeNkswpbEjDK2Fkb2Nb6EpMU3zQAGGM6tpv/mNJN7tGJrQ6T
	 juNIJxoSB0bapqP18n+lslUNV38NX4/pPwd2DILbUQpHcE0Ni5WSXIg8bsgAEnyyopw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465114;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tlKJBMTJRjUgeYDaaKfVZWZYu+5FqrPVv3NCFNDailQ=;
	b=t7w2xBBEQP5QqDp2KcV5AVB/YopJuTAtoG7bmCyWiAezgWcetvG9dALRN3+pETShOt8i
	 fP6CpwqOWwvN3NOTCzOIob87G7bbR+dsAIPcrHP7Bj1MZ+93E5Kfse/8Afy3sDR+YKeri
	 tmfoHqi/AJvgrH22ZJL31eBsgCzSitvXFl8jqPDikJHpGASBhwvluJG+xnoj0Rt7YeBNk
	 JckcJXrB7a0YSRWD4607I9UQRRNrKBlAHFMPXfOFdonchs03hUCqLW88J1vN23NmiAlgp
	 jikRoUsfpy5TZMa/ali/BJsF4hW5jIIAy4zrOGetGtCdImN8f2sbNrdB3ArjJV9idcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4zeTQpe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 9D292606A31E;
	Mon, 23 Nov 2026 20:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4zeTQpe
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C52071F000ED;
	Mon, 23 Nov 2026 20:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465114;
	bh=tlKJBMTJRjUgeYDaaKfVZWZYu+5FqrPVv3NCFNDailQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=l4zeTQpeon+I6AmvOlZZImSVJPKSIDAwlcyw+dFLXaqdq7w6BM9lJAd8iDJAUXdtL
	 hVixXbikBUcVGvFgPr945qGqOZbtJM65zf7uD1k1pUoTA1uHGiOdmO8MdONdn3JC1N
	 qAQLFKC+3UOfpUk0kdli6etdiCIxYG9L7oUyjcvx31WnFDoa2STfAufYp8GnSkNBN1
	 EkMkcmhImY+CbGkK/YY4pDM/lZd8Oz/RT8bRqDdcuTbagsSyuynyNINk3usfxiOaMP
	 7nvegiKUc9ys7ev0MDJJ2c/Are4+I9jZUGV5LPckllAhJ4VUjTpuifwJ1ZpraIOQDg
	 nuJIqli1gqCbQ==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org, Hamdy Abou El Anein <info@daylightlinux.ch>
Cc: arnd@arndb.de, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, hamdy.aea@protonmail.com, 
 John Moon <john@jmoon.dev>
In-Reply-To: <20261107191355.151276-1-info@daylightlinux.ch>
References: <20261107191355.151276-1-info@daylightlinux.ch>
Subject: Re: [PATCH] check-uapi: avoid truncating the failure count in the
 exit status
Message-Id: <179546493957.3651437.16009636163863667613.b4-ty@b4>
Date: Mon, 23 Nov 2026 21:15:39 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=zrNcibSCojR2ILy3xqPJs3UXg32fRfHIZpclMtRFMjw=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBrBJ7vFntWjLJ7HCbyV0JegFixUAQUmXSKBWrzB
 36aUYsHm5KJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCawSe7wAKCRAHUgpwFiYS
 aSiUEADI97WeHbK6bRH0jVeY3hbpCQLe/5cwOSsG04xywjjYEaCEPfWukf2CzzwVgj90i+uRSqF
 5xDoNxA0ad5m4cRdT/RDYW6Y7zjlvsQR24LwuIf49rEgAfTse4kztHZEiQWoQdQnEtfu0uRsicc
 njH+TQagWCGG1rz6Ofjr4G2zHADnLVWSZCXMTeZHpwXs29cBnoKt8NtIJLTIIMqwmJtlQEDNgbY
 tazOV5Ev3841zZ7d88MM3cB2+wJWVUWAm5zmU+gMvFwFq38oYDMua260cygVrHCoxlFPZ0wJZaU
 pXsUuOu0aW096DCGtTU3Mn8tKwv0jEoe8+8H1OA+5iQyvcASu6XV8zEZjPn1zCuhweSPKXANvUK
 dyyInypPE/llqNiqKQJLeRUbTGTCEuUoOXylLolKvLhDWX/8+TX0aqswsTkY/P5GISEf/IbmNGK
 ccF9WrAvL4u9Hc4scYJkzHfe7fS7GZiVOKmMgl8aOfpaLcHrb9aWN4WxXbpmvJT0QEKlpK/UPoF
 FMdnCYbyE0KcJj+plxCOjY5DV8TeYigv4wGeintgvY3YZxBcQbAAwjXj+09miHubXh/6nxY3jmq
 ovxsxBGzhlkdWm0+46TV3rrE9WRQmdLk4LN3YGAX/5Ey3jznEbLP3o/PjmbJOe7B2WkqpA9ce53
 Ywg9w3MDHLTxLQw==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Sat, 07 Nov 2026 20:13:55 +0100, Hamdy Abou El Anein wrote:
> check-uapi: avoid truncating the failure count in the exit status

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] check-uapi: avoid truncating the failure count in the exit status
      https://git.kernel.org/kbuild/c/d45fe61e

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


