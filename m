Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099046;
	b=TU2zCScmaK9zT+smQP6Ergx2BuaGwv6gtg2zHK+b8CPgZh4mXuvvV9XctqxITk6y2OcE
	 fk/Kze+0UF14/8yYosUKESvZ3cFO6hAamM4zBtVgOAJsBpE4WuEbU7EiuNkT0KL1pbVND
	 d+uiRsCA0IWhl8y8xPfzdZG/Mmop4neCcGe5YQHT3akhXy+8RW5/L6plKANTnqPN7ADf1
	 EEmErtD5PFy7hceYzoMqRJdfp+tEDxHHPol1l0wPKB9dh1EJOohGOitDyyNK/mne75ERU
	 ntNWK9jhaJEnPed4LsWfhkRiUFJLTpRRjSMPUWyvQdKM852blWtApyj94HclghTXQng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099046;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PsufnooHPiIC/Ruws/xkognF39L7enlu3FD8BHA8vzo=;
	b=vZCyuOfRaK4w5T/gUCxuNZWUi4OaAATg6K+7ShQhOdS/YuIf7Yd5O2jzE7oik1Q44dmc
	 mC0SCjJYKcY+ywGbgelt/eMk4fZx2i/6/5kCpAz0xLzQ9N5v3G8ssD3I/JpyNidolhA5F
	 ZyDLClGmiBFPh3KGG6W8wODjD57Iaj7CNQ2tG/fhAamqdeWTPkkh9jn1SpvOGmaJ8x3WA
	 6XOA79Hq9rp1baeiJSkYOOrJd9uyf8nutsnCzDTgncSpOremWpThsE770b/waf9JNnkc1
	 n4pACd80+QTVh0Pw37LI5jvVJmxr/KYI/4pIWsIfi0c79E7mXnl1uKAQoMnXouBpyJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LB6XYeRr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id F082D606A324;
	Thu, 19 Nov 2026 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LB6XYeRr
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 234E71F000C4;
	Thu, 19 Nov 2026 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795099045;
	bh=PsufnooHPiIC/Ruws/xkognF39L7enlu3FD8BHA8vzo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LB6XYeRrp/LJnRWTpGTTTVcuXpMK6BDVpHiPeNiME9o/du+3QAdIW0VlOnoZGQQJc
	 P9uOxIVUAkkI2mfoxFjsMkfL/BlYIT816koQgwnRLdgHJJnIGoLB4lohN96imlf1vC
	 qWb2iSfxLHfLn7lsaJ72nc4wWOXKKBi+XL/8JVqcTGTc8MNn+O83BxhDJfrRRHiUkv
	 jk27uQyXLODEdarN45AYYawEBryse8XkkFiyw7m23SqjT8WoIy8sPOkmolIUpoNw8J
	 +5V4+JxFbC36z036I3Ip3AHB8hK1sep0/piKuK/zfBNwHdKSa5NKA85gcA1Y5ca1jF
	 xCZtn/n7iXwvQ==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org, Julian Braha <julianbraha@gmail.com>
Cc: andi@firstfloor.org, ljs@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261112164826.110736-1-julianbraha@gmail.com>
References: <20261112164826.110736-1-julianbraha@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: cleanup Kconfig entry
Message-Id: <179509807402.3081090.2796634294221735987.b4-ty@b4>
Date: Thu, 19 Nov 2026 15:21:14 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=686; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=C7DEdzA5S00OjWyV/HPfedRbStx4iCyU6wttFxzpR64=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBq/wXiO/R4GATRdvumkeFc0TW3PAQ2oHyin78c/
 4MWoyUMMXKJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCav8F4gAKCRAHUgpwFiYS
 aVNiD/4sTudD0HGdLc5HyQ1hd8ZtsJzZK3Mb1P6K6RkKPvOaAC+xfsRybH3464uNgIb7+GbBQsV
 yfnuXK9iH1f3HoYa8AopaV1NwemT1y3txbCyB7R9UKZTl1IjQ3UJjacnph1cRRI6ZtvNN09J+NM
 /3B2i2fmXq3vMTenHcWp/UiYNUa9Z8+ShqP5qG8UlUkxZLaZHk7ih8CTwe5bHr4bM7B3B1kFPyw
 fvdIpxlWCht9k45eg6DAoXLoVMhzNtycF9okN/JdPITmsQoK/4sMP/WRPd3Ry3mW2NctZIBU6eH
 SiUYOkeD+u+7+LWD8i5KHDqyryaQq8kFbsoNXfgmxx5JE00xYn2sKLUnNCIVj0n5Za6Jpe05Qoe
 lgpmYq1im+kvOisO4aMuzwauWh4WazweqOPyMQBFE6rC44rQ1nTTc3JS0OrON2jgy6KFIFk/WGO
 6oesKRfD3WAlH2oJbFwm1EIYB+CspRh9kuYY9zVdCp52mrCqKI1lnIiP6A0sK47dCkPVMllXImx
 g/xAfieaukm2xG5ZgRSbAVvklXL6UgpPZUoGyIDFH50u+MBPGKddpnIOqsdo2cFInscDFhPoIYt
 HZ5kze84w2xAnWB6CDozFAcbZooyPaxyXDcp5GNXzlpxpVIDdZ0Iw6F2ixoVk9wHHaOsq9aTHBH
 UI5CBXshVSoxdjA==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Thu, 12 Nov 2026 16:48:26 +0000, Julian Braha wrote:
> MAINTAINERS: cleanup Kconfig entry

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] MAINTAINERS: cleanup Kconfig entry
      https://git.kernel.org/kbuild/c/d091b9be5239

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


