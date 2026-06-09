Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEEF3EFFCB
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2026 00:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781049622; cv=none; b=Oh8MszRaJQM6Tt1md+Za3ueYm+8Vm9gzYw1d2o1eC/ni+ubAfShwGxJ0sHHuWrndPFcRWtderANuVxhCzNew5t4kbAishlHZWwb8N3ltXbFrY3HehYMv0GcB+d4cQHadc1w4j+sE01wwHcB0j1pugCUysm9zVqmV9NflFRxR4zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781049622; c=relaxed/simple;
	bh=3OuaVWqvDTuoTxNiu/TJJqFxiu56SALBwO8zMLw93cw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GZeqCT5oISQVPqchzOYeNYKO0iDODN6ofelqkL7yHccDglGNYqZeu9s3wGub4c0qL0JR2w0fzA4ro00zqY045JPRGrzaCluDiuZETrIGZRTo8je3o6pO28LxSPDBNQYnjdHPGalze06R7w+kCFRY2XeIRZkaS1p2FKvT1ncX3kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBvpqjHy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBvpqjHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB4B1F00893;
	Wed, 10 Jun 2026 00:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781049621;
	bh=+pgNfOB/9kBrUtTzxjd/woMbLafIV7OV7He9A6BMiIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NBvpqjHyg4UyGOdswiOnKANW8bYwZrvuKiw2VVEi0xhSTPBhp53IbTucXTfb4pM5/
	 67+Cif8GA4YT+vGFfp6ry2liVr0ChZmW2rPWVL5Kpe/oqq81dLNdqwqzDqCK+dzlVc
	 J2LLf3W10kAJpxt7UC5QaSqPP9Hdw5/qENWg+Dx7usxR0DWI3D5pRUr74fK1nzys4A
	 lE4o3Ex/GGQLF4DEAhBv18epcKD+g2Rw2rB6WaiRh3Xpq6bnxwU1ZS0Wh1XQ4kiv5a
	 cC0UqSU7ZtDYvh5RTzHlA5wCL/bCR9rIw9SqbPwqjGXGId6EqbOTuM0R1QuJYJzw/R
	 UouGu/Jx5n8rQ==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kbuild@vger.kernel.org, 
 Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>
In-Reply-To: <20260609021712.7965-1-enelsonmoore@gmail.com>
References: <20260609021712.7965-1-enelsonmoore@gmail.com>
Subject: Re: [PATCH] kconfig: tests: fix typo in comment
Message-Id: <178104955090.2707941.4622593337371329959.b4-ty@b4>
Date: Tue, 09 Jun 2026 16:59:10 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=692; i=nathan@kernel.org;
 h=from:subject:message-id; bh=3OuaVWqvDTuoTxNiu/TJJqFxiu56SALBwO8zMLw93cw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkaK0WyA1+/O+3B7ReQpy7b8elo4ia2I3suHZi9qHdR8
 oQvyqEtHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiAqsZGR7KavUnno4u0jrT
 2HZy+YZfDW9nNE2NzVUWevf7S9yxI9cZ/orrr7FbynBDpzJQquCc8MLfL0NqT2eJ/KldcufKtIf
 XwxkB
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Mon, 08 Jun 2026 19:17:10 -0700, Ethan Nelson-Moore wrote:
> kconfig: tests: fix typo in comment

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] kconfig: tests: fix typo in comment
      https://git.kernel.org/kbuild/c/1a1e62a5a4849

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


