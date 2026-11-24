Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795492325;
	b=CDlveRsdqwTmpvGIS1qjDp4rwKFT/A2tmBfhg8ESJFj1WqJworDpMU7bO+u+lhzRcqSj
	 TZMKLZbLUjyvwIZAjtdyxK+rb3t/UDsdxCho/qCYAgBxwFKUDmdzwdi0d3QZmuIbtxNM/
	 AQxstpSTJIWDCM+DJ/ugpEOd/3rDZbg7NtR4NUu5m8Kh/ENc08w+d0MeVeIBQQAziY1t6
	 atSjSqoXym8dV/Pj7u/o0/2XZnEijmmgnsF4n0dvRbes31ydZljKdF/Atozc2tKE1y7eM
	 LBmmYT0Dbx6yU41UhBC+iCSBScuqZfE5lB9VJcir38mB18E6ZRbIJdjuHmt1JbIf39g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492325;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=dVTTwcxrQYWvElFyszvM+njF/feo36s4+w2eTaUEvS4=;
	b=0JCl2Zc9+YPDYSixzV1mqhZOAE9MzPH43Z8m4UNVj6S2d672K/sog0j6ofWx7prcPapX
	 2fXSVPOu9Ne/Sb45wJrpX5m2tHUO8/XfTlNB0aoxW6d1CpmrIut9DDkjC6bxqTuncJhlk
	 zdGm7xqCc5W1Qjb0GBpO34CSiOXp8UP7egS9S80nVD90bwE62Yt94e/yWyyO63VolTupT
	 7TrJolMq6PPrkhSEMxhxZTmp/4ezVdnWmd9qBVV7U4ry6I3GscWxxs7YNYDzRn0ljugwM
	 Ag/lTDWDmY3K/19Ex8MbCeBx8FHDhSreHAYvohF4UCEZu3bUfl95CvOIqEzBOIm5//w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHMjUDDG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D53606A31E;
	Tue, 24 Nov 2026 03:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHMjUDDG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB0D1F000C4;
	Tue, 24 Nov 2026 03:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795492324;
	bh=dVTTwcxrQYWvElFyszvM+njF/feo36s4+w2eTaUEvS4=;
	h=Date:From:To:Cc:Subject;
	b=KHMjUDDG4k9ZvK4e9ptz0ftJ3vgIDMLuKFpnwr1K9TUyCBX1PC7okE9iQxYljHdIB
	 hvA2CX8c0AoU+iNngmei0W4/IP0IqAGQt25PucgGTjTkFngy07KPcoHpArhnKLdytv
	 ujRzx35AEuvN5SToNEQ2yusX3hN2e9rkeOrnI0Yv9sLR+Q0M6lYB2q5f1/WxtwSstG
	 ifuz1oLomqYtv5EOhNlZUE8eA5D7WCNQJhZb2KJaJWhzszAvd947l7cXPrJvODXPFY
	 IA+2urEn26GzXEeRKU8Z7bQxtG88mpfNdvJ8o6+zhwlLnUpLWIi1NVyFHd83WO/5XL
	 CDY4Ka/6XfMWA==
Date: Mon, 23 Nov 2026 20:52:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild fixes for 7.4 #2
Message-ID: <20261124035200.GA1950519@ax162>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these two small fixes for 7.4. If there are any problems,
please let me know.

Cheers,
Nathan

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.4-2

for you to fetch changes up to 3df238d7a9f5ac7d78115958fd7a36139f61ca34:

  kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi) (2026-11-11 00:17:27 -0600)

----------------------------------------------------------------
Second round of Kbuild fixes for 7.4

- Move GCC 17's implementation of -Wconstant-logical-operand to W=2
  to fix builds with -Werror

- Disable LLVM's flow-based profile inference algorithm (Profi) for
  AutoFDO, which can degrade runtime performance and cause pathological
  compilation time issues

----------------------------------------------------------------
Douglas Anderson (1):
      kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)

Vineet Gupta (1):
      kbuild: move gcc's -Wconstant-logical-operand to W=2

 scripts/Kconfig.toolchain | 3 +++
 scripts/Makefile.autofdo  | 3 +++
 scripts/Makefile.warn     | 1 +
 3 files changed, 7 insertions(+)
