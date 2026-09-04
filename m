Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F403AB27B;
	Fri,  4 Sep 2026 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788564542; cv=none; b=hJzXGnI2SPRKUG500kNgu/25dL+CfHh/bXz2lYhCY/idWPUIZZ0MiHN0sZQJbJvR8s0H8q1DQ9axUJQ+7iAcbrF1i3fgzy59EfTXayGzfj1xcUuzYfnBzYC30lxeowcghcFTrAhu+/aWwKmWdSvQWlKrqdt0O0S/GhqZL9uypXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788564542; c=relaxed/simple;
	bh=oeUg65Y9FoLICFrzMpsbm305JhosJ4mpKGvVfpa1RiI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nVHxJH2S2DnDmqDfiHxv5jAeeTt45vjWcIgQVME9v1MenllKDC94Vky3Dee4tUaNc0C/LfxRB0FUU0BjAEvIHpoNrtRfui8p63nWp71h0TgTQXooau+wj0oXCi19Jbkke/dNbK1ENkxwSj8j66O7veRQswAMbmg9watD02Q07JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gvj0Ptr5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gvj0Ptr5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47331F00A3D;
	Fri,  4 Sep 2026 23:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788564541;
	bh=jbxCs4v8T7E69mDm+g30Ri4tmPKnpgUVGtCSkumn4WA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Gvj0Ptr5am77Lt2bKVr5a3vC0f/DTBX4gF56G9RQeC3XqgkFt7BJB5rVsM1uo2+2o
	 R6Sdr6cxWsq+t6QgdOD872lEGo/Qtvr+sWjruaQK3eVYGQRH+q/1GsDtYlPkgh63TU
	 +/iPgXkjHCwgZ8K2TgzUm7tlQ9kBktmwcghLSBk8auyUShB9S5bqIfzamDwAmv8oxB
	 Lc18khNQF9iEw7hcuQ1kfzgW9uKqt6QzWpUm3w28+oM1brp+vyPPcZqqF7Tp+rJ2pF
	 V6EVlBKjKW2FiETEYsKLbDWznYA3fXCA5llVm1eyWKmE5cY2qQVKXkf/JlVeHsVcjD
	 8aoN69CMW5p7A==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
In-Reply-To: <20260904122002.27960-1-hemanth.selam@gmail.com>
References: <20260904122002.27960-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] kbuild: fix typo "funtions" in comment
Message-Id: <178856443136.3790367.15350010040268708570.b4-ty@b4>
Date: Fri, 04 Sep 2026 16:27:11 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=nathan@kernel.org;
 h=from:subject:message-id; bh=oeUg65Y9FoLICFrzMpsbm305JhosJ4mpKGvVfpa1RiI=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmzQywvG4gJlyjzh7vOE1c/Nftdlc3cScYrebTtj1Su9
 tcTOvG6o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwk7yDDP5OFjXoWprfnSSwS
 MOyuvqTTsXlxTeZh7atTd5pan2jYIcnIcNPhYELOicvMZ+I4C6JZY246f5x9491B+W831A69yVv
 rywkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Fri, 04 Sep 2026 17:50:01 +0530, Hemanth Selam wrote:
> kbuild: fix typo "funtions" in comment

I dropped the final sentence in the commit message, it was pure noise
since the title mentions it is a comment and the diff makes it clear as
well. Thanks for the patch!

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

[1/1] kbuild: fix typo "funtions" in comment
      https://git.kernel.org/kbuild/c/68b2e64129185

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


