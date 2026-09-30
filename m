Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E7D359A99;
	Wed, 30 Sep 2026 13:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776069; cv=none; b=mvgVRP9J5c1jHumpsaDV6bFaZkMQ83Z9D86pHg464vehNlXu2XuYE/B8yLoao4gWkiHrLICqNkc9oF1T7IcK+RIr9qDvcxtpaFflSFTgGS0ULVJVD1ompaTQO70i1P8e3ii4alr21aIo6FqAsx6QKTNW/55YqAz1jdQ8r+ysZZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776069; c=relaxed/simple;
	bh=n0nEMeYKVrcE2i6+4r4IreeKjpJU8yv2n1KRXXdGoDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HufTUVh0XGMKsN14Nqnxu6li9Lwc+MN6Ms+eFOnfPvEAwwqvtSgZaQLvK5gTV/sRvGM39FW/RdbJi5eV4sg3BiK2GoTVYsklEy9MOb4fnCRg4kZ/r1BTBcx4Dc4od7g1aTS2zvjOsWMqPiHuPGYtfPz2+Z3N5zKKldkMXi3WawM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=be123N7N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="be123N7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354531F000FF;
	Wed, 30 Sep 2026 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790776056;
	bh=TYHlSLTJVMuZJrxvh+FgkC5wdKAznJRpdL2cRwdR6yA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=be123N7Nu0k1JI/SV5vizcR8KORS9XsRUGu4+G6jo1UUeiKzD6XoF9XyPn1t2K47q
	 kQ9gWxQFueLafFCW25AxeCmrv2umwWaVVY58uGE220ifnmIkErvEIokdub0oRt6aYJ
	 MDSR0gVijlRtVxpiex/tASoE+HEgsvGGipNZFXxkI5Jzfw/1GUjcnXuwJ5BYkAIE1V
	 lltrm7Kh+l6rLsW4/AL6MOqpbneCLl5Q4G5Hb9//eskr4TmCjmg99IK2l3VnkK2ApO
	 D2GriyutW82nBjrWxJg9xSHF9RrnUTCK1DfdKUBQXHqPwfbjIFngriude6ICWuc/l7
	 oCvNWzPQsfRGQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Ulf Magnusson <ulfalizer@gmail.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Nicolas Schier <n.schier@fritz.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260929-kconfig-tests-minor-updates-v2-0-c5902bee1d0c@fritz.com>
References: <20260929-kconfig-tests-minor-updates-v2-0-c5902bee1d0c@fritz.com>
Subject: Re: [PATCH v2 0/4] kconfig: tests: Minor fixes and cleanups for
 warn_changed_input
Message-Id: <179077605031.3186717.1159442921729980093.b4-ty@b4>
Date: Wed, 30 Sep 2026 15:47:30 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1556; i=nathan@kernel.org;
 h=from:subject:message-id; bh=n0nEMeYKVrcE2i6+4r4IreeKjpJU8yv2n1KRXXdGoDk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFl7hb7Mlyv0XXHtmV/mCeX2R//nbftv5LRjbXWOqOml9
 /OSTmU96ShlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATqRBiZPgb1O9WyHPkTmCt
 cAnnXkZzgUKtGwFmD5geZHqfib8/u57hv7f6Mp6ZDNGfXz3neLRNMWrniiOh83umfwlzn3n3udC
 FqSwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Tue, 29 Sep 2026 09:59:43 +0200, Nicolas Schier wrote:
> kconfig: tests: Minor fixes and cleanups for warn_changed_input
> 
> This patch-set contains two minor fixes and some related cleanup for the
> warn_changed_input test:
> 
>   * The kconfig test 'warn_changed_input' fails if the environment
>     variable KCONFIG_WARN_CHANGED_INPUT is set non-empty.  The first
>     patch resets all environment variables with names starting with
>     KCONFIG_ by default for all tests to make the kconfig tests more
>     stable.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/4] kconfig: tests: Reset all KCONFIG_* env variables by default
      https://git.kernel.org/kbuild/c/8688f0b29d021
[2/4] kconfig: tests: Provide defconfig outfile for savedefconfig
      https://git.kernel.org/kbuild/c/09bd92ba15bd0
[3/4] kconfig: tests: warn_changed_input: Simplify by reusing the extra env
      https://git.kernel.org/kbuild/c/ecc9c2b15a04b
[4/4] kconfig: tests: {old,save}defconfig: Forward dynamic keyword arguments
      https://git.kernel.org/kbuild/c/34f3b447600bc

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


