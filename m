Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAD52E06EA;
	Tue, 24 Mar 2026 21:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774386639; cv=none; b=LVV4N09XftR7v03tsk7nPgFujmUJchkNdfo2hle5RSMkIH5dZd5huoRfkYM//ba6uz8uEve9xgy2+f3cu/fN5AfUvPdBf06ctNOm/TxivIV/qbxw0Tlp6znc66SdJPAvHORR/YCYBxo+h6dASjTM7l3JRUMqSUTq90QVDq/WuPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774386639; c=relaxed/simple;
	bh=JcoYPDPilsrNbu+FKu8d8RL4PW6vnlv7LoabgjL8Qyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QVpOKbINw71llq36bbRUByztjb51MPWAF7q/gTMeRGoFH/dbqSDmCLj1vAlJIjHCmKcTl2YONFhK+ezUQDlJDojEJ/GR/emN0HWU/1EVP3jl0bSLQKghduvr0GpOloZvbDaQYVvNrlAfU1w81rfaUc2tXaxn0cH6e0Esh6u1vHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=th0DhQ7o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="th0DhQ7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55321C2BCB1;
	Tue, 24 Mar 2026 21:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774386639;
	bh=JcoYPDPilsrNbu+FKu8d8RL4PW6vnlv7LoabgjL8Qyo=;
	h=Date:From:To:Cc:Subject:From;
	b=th0DhQ7oNB+w/zbuXyExEKY/SKrsT8iQluWgOFNLDagG2ozDZAOa+1+++EqTXzNxp
	 NEMHgGWo09TtMivgiYmXFnRwi2Wyv6hfgD70wMmJ2AmfIhnFVIgqiOpXZPpYQR6esM
	 MnbdaEXdk5tam/XIWJcaRF3V6HVTODMGMgs2ESwJG3QDJDsPtwzOB0U9WAku3sUfBc
	 2/jDAYqRwisHGFw5EQvtbLbAakgB7qyrv8B9eBFI0jUBKUGx/OgUprNQEogTIrWwxR
	 VbTwrR1IHnxpwBlr9sopA4Ir3N9w/xymk2oqKHkk+45uK4zQlzVjEFAvHBPyZX4tox
	 JGyV/NfxSPeDQ==
Date: Tue, 24 Mar 2026 14:10:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild fixes for 7.0 #3
Message-ID: <20260324211035.GA2629374@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this third round of Kbuild fixes for 7.0, mostly addressing
some issues with the awk conversion in scripts/kconfig/merge_config.sh.
If there are any problems, please let me know.

Cheers,
Nathan

The following changes since commit 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681:

  Linux 7.0-rc3 (2026-03-08 16:56:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.0-3

for you to fetch changes up to 775af5cbb22c1de2ad0f486959739c35cfc55ac8:

  scripts: kconfig: merge_config.sh: fix indentation (2026-03-11 00:38:06 -0700)

----------------------------------------------------------------
Third round of Kbuild fixes for 7.0

- Fix typo to ensure .builtin-dtbs.S is properly cleaned

- Fix '==' bashism in scripts/kconfig/merge_config.sh

- Fix awk error in scripts/kconfig/merge_config.sh when base
  configuration is empty

- Fix inconsistent indentation in scripts/kconfig/merge_config.sh

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Charles Mirabile (1):
      kbuild: Delete .builtin-dtbs.S when running make clean

Daniel Gomez (2):
      scripts: kconfig: merge_config.sh: pass output file as awk variable
      scripts: kconfig: merge_config.sh: fix indentation

Weizhao Ouyang (1):
      scripts: kconfig: merge_config.sh: fix unexpected operator warning

 Makefile                        |  2 +-
 scripts/kconfig/merge_config.sh | 24 ++++++++++--------------
 2 files changed, 11 insertions(+), 15 deletions(-)
