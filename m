Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604AA3B4E98;
	Tue, 21 Jul 2026 14:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644273; cv=none; b=HEiWtgvoav/6XwI0yFy3Tb5Kcio2Zl9Z7AsJSU6cDFxbsbZjDg8n9GzNOEcY0U7GNvsDVTC5nohqLJ8x5bS72cc5iW+78jE+4seXYZi+XZsPvhYfm9Le1F+xfkp02FrxZ2VrSmL0TefpNSzJi7qvTkvb/5HGsr8aQdbrgoIvOP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644273; c=relaxed/simple;
	bh=pjGtvZqDJgQRwJWmHuyxyl7+6o8nwY9GIFn31394HM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NSY3lyt606jMgBy2EhEwReh4ttbmeAmqKP0NJJ2qXxdCXyGnG7Gc4UOniOfC3jXsFU8vZoTLtfBUav+HlGZ54k1OhC6GS1FqA3X+gEHKwmfDdz6zVhbuZRb6J91Yg9+vUM6+Jvpagq4Qk3SXNZKqKR0KwSiypqslHwgy5Kw0LuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNgRS9hZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNgRS9hZ"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 869F81F000E9;
	Tue, 21 Jul 2026 14:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784644272;
	bh=mO0Vt3bPhGVEGHIRZHRwhGECRXSL7Hu0md+6vJzaYWc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hNgRS9hZSNzl3Izuq1xBU0FGbe6kWiVRbonjNBLWZM4jn/LVyrQuFdy42ZClwTk/0
	 nf+KVHEyB1zUt9KULpEKJe4JGyywY1f5xRlbtDqgXoG2+ZxWeU3vRjYiqEx67BJa2m
	 ctyjNRI2tFcZibzib2HtGSsSYx+GuuKjNpeSOtppl2mODBFflkc7RxOs9Lg1Ufu8uC
	 51W5BgdfxXdVsX7YlfH8CAgY335wYncTiUIKtI0xie1Gsv39ImG9DOnS3GtK1ZQ31H
	 qTzeflKZiF1jS0iB7T7nZlXhjqKwt1d8A5SSKMi/agi1mpDAuHGZWvI3l3qYd5RbuV
	 njkcwutFOgpjQ==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
 Julian Braha <julianbraha@gmail.com>
Cc: arnd@arndb.de, stefan.hengelein@fau.de, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, nico@fluxnic.net, 
 officialnaumansabir@gmail.com, rdunlap@infradead.org, 
 vegard.nossum@oracle.com, kees@kernel.org, tj@kernel.org
In-Reply-To: <20260715220149.48700-1-julianbraha@gmail.com>
References: <20260715220149.48700-1-julianbraha@gmail.com>
Subject: Re: [PATCH] Documentation: warn users not to use select on choice
 options in Kconfig
Message-Id: <178463155540.1439086.8303526519325878284.b4-ty@b4>
Date: Tue, 21 Jul 2026 12:59:15 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=762; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=pjGtvZqDJgQRwJWmHuyxyl7+6o8nwY9GIFn31394HM4=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqX1EGyuBJ7S7pstmwCy2rjt81jjLU9qiGYpK2m
 d0AwGkjbEaJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCal9RBgAKCRAHUgpwFiYS
 aT2LEADLtbD91Wccch0+fByTi9ZRHxCXj0F2oo5UFc6EDf1NNbxkRHO63iId+gUWOo0j6H4+CsC
 P0gXFib37EutYftd5PmdS+UHmLFRd5zE3MnYg5yClgl6M0YLasHFd2jV8z2WRLa25Rt0K8BTccS
 mDbmoxtsq8DBo416aqx9qRhV1sCftfTOef1JyexfIeKiAaetLg5ZqhJ32OcErsuTPJEGJ2VBS/s
 j+it8jE2fEjxbaEGfOiL/z74uv1MV/GUz/iX4/gkHzpfbulFzxWXswaM3c7ynfeHP2NjruMh2/9
 a5tfj0eg4kMiHBLcfm3teNiWAU3BnDauNgvXvyBjME8b7knkZZCcm8niZYu4VARRmQ/kHkQlUEe
 BNxiYNtchvZH55B8vaWcdqFf76X+m6204BojCfJh5pxcfqY/yQN706svf1Ou0qw5+A1wwsNCLDV
 zwXyC/tiXHnmJXQlB2hOqrGo/50PXfQ4FdrBJ9vntxmIkpnO5bELGiuijcnmTyjmwrFaFetc+xl
 XLFYLfw7wZxHT3v1bdjT4DZnlAMuXHz7hghIERdnMV/7NRWCDmBUIQ/TxM/ithZOlI/+FOCFV1B
 WDsQ/aUKqJcVvQMXWieZ/wLxuBMLTUKlkELbk2xrPtXe35xXMwbU9kMaEGbQl4HIjQ6N6IaHrcI
 M8FzyZwizyXmYHQ==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Wed, 15 Jul 2026 23:01:49 +0100, Julian Braha wrote:
> Documentation: warn users not to use select on choice options in Kconfig

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] Documentation: warn users not to use select on choice options in Kconfig
      https://git.kernel.org/kbuild/c/d10cfe72

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


