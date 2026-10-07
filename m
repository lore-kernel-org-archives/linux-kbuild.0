Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72374299929;
	Wed,  7 Oct 2026 15:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386555; cv=none; b=jthYjLDIxFo781tMNSvbCUNIyo8HOfToUIIVTij/HXSSOnos9u8/l9RD/+9UOaSmv79tOhFAnK4MQFTa3y3ENXkJXWmDP/5CUBf9jsrtm9k4SDiiJ/REhUtAyt0vIKed5iN5J2TQHoXPa+gD5cRrGdCsYvuqHnonD6iUsp93GiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386555; c=relaxed/simple;
	bh=7t36pm7RqXM7Poo94lLSHiCmOYIg19D5wOusyg++1U4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h4Rt/IfxOggMM1yQLgmD/lmUevAFpbsk+GfsjrZcQn30C3Takyta6FwElzoNiVHNFlXKJwQeHpCuTamMTDOzZpWqd1K8ZOFdq3NnyZrevZckWSQ4rafjZUfei4fTP8LZlYYhawivY32gE/xb9pSuhGb3rkI/J76lVzSkOBFAJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVUSEivl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVUSEivl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46191F000FF;
	Wed,  7 Oct 2026 15:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791386552;
	bh=fneR1Gnj57AiwiQP1YXvhe46xFVHCpFrPvhYvoQ6CaA=;
	h=From:Subject:Date:To:Cc;
	b=mVUSEivlqYn1j6Gs7kdQr2X5a2TNmFMRYZcZ/8CuKwwVO36K3a6hO35uVyvcsEaUi
	 Zndt4Pbb9o7EJ+SOIQqHaS/8hdUuGHLIBtWrvy/qIALT6qekBnQrEDWXqXUHnYdHcN
	 025a/hBRSfi2/FWFRqwQHov1PeWF5dxroFsgk0yQQ+OvRvDcrcVsXIE5GgydR524FN
	 cybTikv34oT2ivxbe0CvNx+IGHenmT47hj29qQli0tsLAGZH09tpCydTVHTbR8XDXZ
	 tDFq1RtrJisZth6LPicxmnoH0MU0QQrd09fcfHGgnqtw4LAzYm83+gkJFoJ0g8s6zL
	 rCFd/OsBOuP+g==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] Initial ergonomic improvements to
 scripts/Kconfig.toolchain
Date: Wed, 07 Oct 2026 17:22:20 +0200
Message-Id: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1JmbSBJsYJXERdtnNRROwmZtAild
 3dal4/3eX8FwUIocG1WKLiQUGIFd2ogPHse0dBDGbz1nbP2YiQUylXMOySONJqa0keXxIamXNK
 CE7Jqj+dofTv0ru1AY7lgpO9xdLv/WebhhaHuddi2H5SzO7KKAAAA
X-Change-ID: 20261007-scripts-kconfig-toolchain-improvements-2e5f023ba136
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=788; i=nathan@kernel.org;
 h=from:subject:message-id; bh=7t36pm7RqXM7Poo94lLSHiCmOYIg19D5wOusyg++1U4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnHkjfraKzdOH1KMTPnukWrWE42KfIzzVt+e1vSLomyW
 cyxbr0iHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAil2oZ/mm079dK2VnpfeH1
 lrMegQ+dEzPXfdvKphTP8qSILVL+eQQjw+ID0r5rmG/wbPxz78iEul09Od1vPy5OLP+4y6An0ZV
 nNzsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Hi all,

This series includes a cleanup to scripts/Kconfig.toolchain around
dependencies (the first patch) and improves the ergonomics of using
cc-option and cc-option-str in Kconfig to disable warnings, making
Kconfig and Kbuild more unified in their behavior (the second patch).

---
Nathan Chancellor (2):
      scripts/Kconfig.toolchain: Drop compiler symbols from dependencies
      kconfig: Improve ergonomics around disabling warnings with cc-option

 scripts/Kconfig.include   |  2 +-
 scripts/Kconfig.toolchain | 22 +++++++++++-----------
 2 files changed, 12 insertions(+), 12 deletions(-)
---
base-commit: a98db7418797bc27bef53c861b97ac748f598414
change-id: 20261007-scripts-kconfig-toolchain-improvements-2e5f023ba136

Best regards,
--  
Cheers,
Nathan

