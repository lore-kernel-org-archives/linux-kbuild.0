Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D93817993;
	Mon, 13 Jul 2026 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945981; cv=none; b=q59rNzs2GByPv3uKJMIX2diM6GYBAjglANyIU4rjl3eJiMywW6vhIopYLHLRt2xR/01ByChsH715IJpq1Q3wV1NrZjTAPDjmd9hM3RbWK3OlrdWk+5piJeJtr/ui2hKdynf/2tg2rJYBc51Ors2fEpd6Flksmj0mxYEdVeKhFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945981; c=relaxed/simple;
	bh=5hSN1cjPts76w/KgUXyxLAnALNQER54SE2sqZDbsyzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eo/VfxBq9EIfeWGNcTOm6o6+usGpa/oebf6vKKCgZAqlc+J7acnUPrLaoT/5tedl4bzklWH6Idsg3UNaIJAX7JPh6XeSvFwJUJPE5+A8Fw3aLSurD7yuztCXGO/WXOXLBxjytP/iDLXowjtv5me7bUX8S/2rHaKW33UFbqOom5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKGMSg3w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKGMSg3w"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 394981F000E9;
	Mon, 13 Jul 2026 12:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783945977;
	bh=wuzQmcDMpBT/NTxRwCqBAgLsavLtK2ecbCApGY2Mcf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cKGMSg3wA3YuOPep9jo8qBPsipENgHkBYBiuXusUu2GUruAxmIdaDrLEHmmJ7RipX
	 IjZIPxrnpvsatp5pS7orIZuqCU7uA+MNw7j7fi8dA7QcWBO5xp8gVARYOwz/qgragX
	 hjg6iR8uOL2ukL1SPgC8ftfZqAWodzQzqwASMs5hGIWKfGsH8n1Ew75mKW+7pK3xs7
	 w5ziILBntuGGn4CluLYA0dJfl6tVEup3cZA2O919GA+JiVrYuksuEDmHI72/Na+qff
	 yrmDigbdcbXMOtItGBtGqh2/diiOwdhDEF4+aq+a9nX7qa+6eHgLYjZupxpKoJ50E4
	 O2ffoDttnsRpg==
From: Nicolas Schier <nsc@kernel.org>
To: linux-kbuild@vger.kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: remove srctreie path from CHECK output
Date: Mon, 13 Jul 2026 14:32:21 +0200
Message-ID: <178394586682.708262.10255837835887765848.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260622132653.446868-1-ben.dooks@codethink.co.uk>
References: <20260622132653.446868-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 22 Jun 2026 14:26:53 +0100, Ben Dooks wrote:
> The build does not put the full kernel path in when
> building outputs, so do the same when the check is
> run to make the output more consistent.
> 
> turn the following:
>   CC      arch/riscv/lib/delay.o
>   CHECK   /home/ben/linux/arch/riscv/lib/delay.c
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kbuild: remove srctreie path from CHECK output
      https://git.kernel.org/kbuild/c/fba1a1ac

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas

