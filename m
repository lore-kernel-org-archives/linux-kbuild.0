Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8509A264614;
	Sat,  1 Aug 2026 02:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785552363; cv=none; b=DMRUkugoqbwKNvXUnadJPV7U653xUwpGGMhgEBjPGKh3c1LvuZnuy02Viy2EiibPCf2QAHVc8XC7L93QgOnZG/9cmPkgR2E7MwLUIgXzXaeQMzpTkDKOfIrmz9+/NPfwYrtwvaHJKl7JObpERvxDCLGvost4dnhgZAnmGQoCaCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785552363; c=relaxed/simple;
	bh=AKNVupBIliX71nVKXpQfG/jXNwHlQYpopEZsfwsDSws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ia6FDZ8+GwoPlvWXfHxC0SWdJ2723HbAsfHhVXkPpVnDyRr1Fy1NnZ1m05DDLC4p8m02mGvrElT5ScRs9L+om02y2Zb8WHMnUCloZrQNafsKrMqh0bGe90NNwfgZ+rtOY1KO/TGEI7O81AJT14OarC/XDgLL2EfDYeNIN2S39pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJ/9h2MV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJ/9h2MV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D241F00AC4;
	Sat,  1 Aug 2026 02:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785552362;
	bh=8/w544Fh9LS5ZAwTWvhItfs7vu9NmU1vhXuIlwGWR0M=;
	h=Date:From:To:Cc:Subject;
	b=hJ/9h2MV17AHOibq7nYDZx8zQZv2Sk6lVRBd9WwVIO+ILnlBKRIyAeyFEqCQjaj1n
	 FrNwGisBxMUT9Kq/8nEMASC1hUQ8OEadUAkj8vMpzdQ46XYVrgAyaZsHx0o4vo45Np
	 X0ePiv8S0wSNxkzBO1rfA8MO9twD8YDmOBC6y8fLmIxwTH4LhR52SmDr4P1+hY958p
	 D5UnDOElBMyS1ONbggbQh9rHpneZ9A3Gz53DIfYS4ZF+WSo6mIrqFiVt/vjYbwdz2x
	 Yrc4drwn7wTnS1yDOZzh7MfjOYruYcdSW+wJyMGBvCN6urSrjbO517VF2iwJkBVJ8F
	 mtdporqm/H7oA==
Date: Fri, 31 Jul 2026 19:45:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild fixes for 7.2 #1
Message-ID: <20260801024558.GA3862889@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please consider pulling these two Kbuild fixes for 7.2. It has been
rather quiet on the Kbuild front for fixes this cycle, hence the first
fixes pull at -rc6, but the first one was a bad regression from 7.1 and
the second is localized to the .rpm package building infrastructure, so
I think they are worth taking now.

If there are any issues or concerns, please let me know.

Cheers,
Nathan

The following changes since commit 1590cf0329716306e948a8fc29f1d3ee87d3989f:

  Linux 7.2-rc4 (2026-07-19 13:54:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.2-1

for you to fetch changes up to e5a259d98823a93459643b239b71fed7589ab669:

  kbuild: rpm-pkg: Preserve BTF sections in kernel modules during debuginfo stripping (2026-07-29 16:21:42 -0700)

----------------------------------------------------------------
First round of Kbuild fixes for 7.2

- Fix regression with MO= when building out of tree kernel modules due
  to incorrectly overwriting build tree's Makefile

- Avoid stripping .BTF sections from modules when building debug .rpm
  packages

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Nicolas Schier (1):
      kbuild: Stop modifying $(objtree)/Makefile when building oot-kmods oos

Yafang Shao (1):
      kbuild: rpm-pkg: Preserve BTF sections in kernel modules during debuginfo stripping

 Makefile                    |  8 +++-----
 scripts/package/kernel.spec | 11 +++++++++++
 2 files changed, 14 insertions(+), 5 deletions(-)
