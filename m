Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0144418F5;
	Tue, 31 Mar 2026 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979428; cv=none; b=Rs1Ae4cS1pajJbxgSw/hN3bcVLZb25ADb40c8TR2SwCoovdyBSZAt8EBpfrW6u5E9mQTWdD/X2crXEGx7/iZ5OuZhrzTEjBkLwJnh1WQO4MqrSGTGDfLnucmkqlUEY927vvC5xnKClGROwEXmfS3z5I15+Y21TxmRGVLNUWAFKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979428; c=relaxed/simple;
	bh=wiHe33aixNa1pYHmYxJiH/+jteLp6m9W/iUE2defy1o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WRLWChDZ1PZM8t0N73rHh/vfdkX1cBKucDS1NzAKBFwLTO7AHGP0/9yXIIGHMfPhvppz1Y5q2uH30Dnsl2ULbxNTEOQefWbDiJeL5x56t1s3g2wCXy4Un8dahR9PtIcTi8OXeLac7WWcO/+pkzYM7ZvHvoYnAWJxHISF4J+b2MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Q5KXxuHt; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Q5KXxuHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774979424;
	bh=wiHe33aixNa1pYHmYxJiH/+jteLp6m9W/iUE2defy1o=;
	h=From:Subject:Date:To:Cc:From;
	b=Q5KXxuHtnaIglZAZctMJMfjDoeEizfs50H6/dJ0VmhbJ7YiInRC8CstABmhjW5e/k
	 TbWYOiocFH5F3YW9BDgk9PGx3O1sPnGdBCwCUGo4Mk4vLNd9HS+631Y/bVZBp5lpY1
	 ti0+E0zHTbxYt6k/aZyKl/M2O/XIi8Bc9ZmIfqvM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/4] kbuild: vdso_install: drop build ID architecture
 allow-list
Date: Tue, 31 Mar 2026 19:50:18 +0200
Message-Id: <20260331-kbuild-vdso-install-v2-0-606d0dc6beca@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0K6dkxbQYor72FYVBjsRNKaDlQN4
 e5W4tLle8l/fxGMkZDFqVhExERMwWfQu0J0zvobAvWZhZb6KA/KwP0609hD6jkAeZ7sOEJZ2qo
 yqsahHkRePiIO9NqqlzazI55CfG8nSX3tr6fl315SIAE1GiubWhrTnJ9IzNy52e09TqJd1/UD3
 4vktbsAAAA=
X-Change-ID: 20260318-kbuild-vdso-install-44a55817ef7f
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774979424; l=912;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=wiHe33aixNa1pYHmYxJiH/+jteLp6m9W/iUE2defy1o=;
 b=zjuXNNIVInmX/q9cT2n+0MH49NnDt5OFdgvpdRl4wPKGa5MDi6AvYt9esxnbo2LdifB5fXrgQ
 J2rHUVVW/7cA3VkO7AAOhYUEKeQjHK3hgJyeTRQZ7arD/wOmV4X0dxQ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This list is incomplete. Instead of maintaining it manually,
detect a vDSO with build ID automatically and handle it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Pick up review tags.
- Fix typos in commit messages.
- Link to v1: https://patch.msgid.link/20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net

---
Thomas Weißschuh (4):
      kbuild: vdso_install: split out the readelf invocation
      kbuild: vdso_install: hide readelf warnings
      kbuild: vdso_install: gracefully handle images without build ID
      kbuild: vdso_install: drop build ID architecture allow-list

 scripts/Makefile.vdsoinst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 5acf9666477e24e026c54ded89e69cff6596ced8
change-id: 20260318-kbuild-vdso-install-44a55817ef7f

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

