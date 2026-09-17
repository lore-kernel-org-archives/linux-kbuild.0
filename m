Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36A03CD8BF;
	Thu, 17 Sep 2026 23:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688909; cv=none; b=XB/3pGM1WIrOloE6zLmdhUVmYlpQUXNxrIqzhdUFbdUZPj3uGor3MznOkPs72Vgog6EH2EQ3/J3nhATpBO0nh9HEG/1of2wW0i6A6qNaJfCAUzkmyrEHH4xQgmoQGahBc/quOFZ7oIfRBMbolH4FcIpKdULiQDNSZK/YGf508E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688909; c=relaxed/simple;
	bh=QRhXDSaBqfV0oceWIDO7Is5TLCHIQ0bU9pysuDl02fM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LHfPZwPgmDKhofcZK/xwo9G0714mpXcuPDQe712jbZsthrS8an2rMT/8QAg9KWSwj9pNvME8nb+4vgsQ8phUvGCWfcGoCvGcg0NKFg3RxqZ9QGpOjSuYkkbjYMOz39FSxAa5DNZgOd3wHgOX0WFno33OXkG5gH5c9Pi4OpB27vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTw9RAZf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTw9RAZf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8301F000FF;
	Thu, 17 Sep 2026 23:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789688908;
	bh=zx67adVBf1rFq0xsxVJ0wMcoaNl0Tl+zmzbVIpQdypY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hTw9RAZflubB3YLnVKuq/zh5Yp4Sv9avT5DkZnTIR2l7263jionh6wuPu4VffGZ3Q
	 dH/H1nGAXlRrymcM4wtsTiDBiWTa9DpvkW+dSAoo76yD6LCNrs55S5zC4qm/Xx/NeS
	 Sh2g/YucNpmUJFBHcEEdbAmf+HOYNI5AH09XppEi8IfksAfk9CGX+7iyNZNYZcPCkC
	 1VSgvxfOxQD9hcYzKPvR3fOnhyFjM982BCtHQWDbczu1qOaxJmzzknWNUznWdT4BUt
	 s+chQ+ArcnVRdkMhDhI+DjKMv/BBGfLui73UWoxorxSrhFtyB1dtTuLQjq/z+ySXCx
	 GzTvZDnk6z9fQ==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, Julian Braha <julianbraha@gmail.com>
Cc: geert@linux-m68k.org, xiang@kernel.org, chao@kernel.org, 
 zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com, 
 hongbohbli@tencent.com, guochunhai@vivo.com, michael.bommarito@gmail.com, 
 kees@kernel.org, vegard.nossum@oracle.com, sam@ravnborg.org, 
 u.kleine-koenig@pengutronix.de, mmarek@suse.cz, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <20260830221129.2668354-1-julianbraha@gmail.com>
References: <20260830221129.2668354-1-julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: fix extra output from savedefconfig on
 out-of-range defaults
Message-Id: <178968877258.1576026.7591164133280208240.b4-ty@b4>
Date: Thu, 17 Sep 2026 16:46:12 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=nathan@kernel.org;
 h=from:subject:message-id; bh=QRhXDSaBqfV0oceWIDO7Is5TLCHIQ0bU9pysuDl02fM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlrapxjtOxyHJ5ZiWzkkl7+d1eXUbZkYmlb98OCVcelF
 tfP+nq5o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzkxGSG//F+9p4Z78pnJgca
 7xN0rBVZ0/c5fF7Zs3NeCzwF6vleOzAyLDtwZTn/lRu3d5y8t+7eHU2pqUv/zt0/8brOsmO5k3N
 nB3ADAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Sun, 30 Aug 2026 23:11:29 +0100, Julian Braha wrote:
> kconfig: fix extra output from savedefconfig on out-of-range defaults

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kconfig: fix extra output from savedefconfig on out-of-range defaults
      https://git.kernel.org/kbuild/c/dbe1ae2304a3b

I also reverted the workaround that necessitated this change:

  https://git.kernel.org/kbuild/c/a2a402bd5e5a4fa466d6034e70b18b6ac22f873d

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


