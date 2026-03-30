Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90D239EF1A;
	Mon, 30 Mar 2026 20:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774902457; cv=none; b=tTZW3jStUsq8h+S2FoblWV1Q6YZPN9FINlJzFYXg5guRLv+n/+0moODwFslIlS6lUxZOiiSD/NEN+CSVPSiL9rXGa0NkegVeHy/eiHOyh2fdvov5mdT0mzjWY5MIPF2Zm5NwG6bJ3gWHsn8Cm2SDHIC/51yazeQ8iGorzr7yo08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774902457; c=relaxed/simple;
	bh=qfMXZsJcENTmXscrihJrIikfCM+G12crhZ1pYrltBQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uj9v0BFcYwdJEybRYfx2lWYiC0LKS1WOlY0tMBUX/ckuOKSUvu7Uwk8Pg26UrlgcgKf0AB2TM8mb4SQceAc0tAbWGKnAp8wdHQtcd/bD6AnxsFAyKBXF3ql+UrIGO8jscS++umigoz75jJwDj7+1hm6K+LOQ5EiFe8PYISFaLdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgdBcnCg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgdBcnCg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A6AC4CEF7;
	Mon, 30 Mar 2026 20:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774902457;
	bh=qfMXZsJcENTmXscrihJrIikfCM+G12crhZ1pYrltBQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QgdBcnCgraJ1Da5lH/35eHylKUGI2v2EDMWZY1wPlJhvREI/dLGwVGH+S+MPt0msf
	 CH9rjB2CIvPnlPclj6/6xVjj/fi04tXNC3eFkIDRuRCxHjti3GAnv9Y1HsoGT6ItjL
	 afVllp3qtPQ5gv9UvpY3s6KggOwoqy/kW6LJ5T/MzIt78eceNJXNhhgl8zLvAmZRVc
	 fBw6bZbKHPXSe8MWsPgwTjUJLwFLfqE9PPxHt3CMm/N03z0i4TzMt1aMRShB+MrXPU
	 6FWxmp3dPhVk5t9olWSJb/OVCglwAM8Em1uaDnSzzvYzoa+t+RNSFkP4dQyNtFkGb1
	 Ci8IHNq2ed2EA==
From: Nicolas Schier <nsc@kernel.org>
To: Christian Heusel <christian@heusel.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: pacman-pkg: package unstripped vDSO libraries
Date: Mon, 30 Mar 2026 21:30:29 +0200
Message-ID: <177489899701.2334687.2954985636789986091.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318-kbuild-pacman-vdso-install-v1-1-48ceb31c0e80@weissschuh.net>
References: <20260318-kbuild-pacman-vdso-install-v1-1-48ceb31c0e80@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 18 Mar 2026 21:37:20 +0100, Thomas Weißschuh wrote:
> The unstripped vDSO files are useful for debugging.
> They are provided in the upstream 'linux-headers' package.
> 
> Also package them as part of 'make pacman-pkg'.
> Make them part of the '-debug' package, as they fit there best.
> This differs from the upstream package as that has no '-debug' variant.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kbuild: pacman-pkg: package unstripped vDSO libraries
      https://git.kernel.org/kbuild/c/165e86c2

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas

