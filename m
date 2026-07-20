Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6BF3932DC;
	Mon, 20 Jul 2026 19:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784574721; cv=none; b=pxdiwDGmaP0neqaCEW2mv0Tz0p/Dvj8YA6K7DERzjPMthUMR1Q6Knq2rX1NQUXdd9yaf2g4yYtfEm19ZpFpXJbrVzlp2ifDtdzoBSEA7x39oA+vyxBwpcFtCLDGOUXbs71N1Dd5n6OEaQA4IbHF/GBVyKmDSjoLXpxGrlvXW8tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784574721; c=relaxed/simple;
	bh=c1IBNOiyf4TgvYXAfwc/RyEjngYVQiw/iJ+Rmtozxn4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Na4mYITfQWYqlLfCuiXnJcPVGPXANxchJ5Is5eP25vvv/+55VwECuT/rpSyFhLbcfmb1FpdIBA57d/u5Ey9W6ExkE98K1DQ9MEWRrNqEQgSDxG3kZNdHDRWFUum58uSJ/w1PvhiOmnjT32vljqZIP5c92ox5pUh1Hs5e02G7inE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCdiKsir; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCdiKsir"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 0F5291F000E9;
	Mon, 20 Jul 2026 19:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784574716;
	bh=0T6IT7N7kj+AcQRhEgHMcO30jrWN6TWOXm9zPH808gc=;
	h=From:Subject:Date:To:Cc;
	b=FCdiKsirt2+dTa4AqLMqLbyM6JZS5rQ9nJgGCUomK/P6CKb2HoAWOQqdZnEb1UoZr
	 +0m/bVQGJ1FXCNZSEoJ3zvfx6nXVQzuNJ1g91du+9OIWforcPI1gn4wYB3JHveDS0H
	 J+/vloVwd7lBSsSWxlDUedLPCyEynlwWVUGtlYePzOFoMpnl8EgxHEeauDNiTsCaEA
	 oM7kv6/9c8sAl3YR9vmbuKvw3YJf2TrduK3KZhyqb6ZdBKiqdg70wSexBEpUGT6xUM
	 Z/cNcvQPYlDKu68LdE/qEzoDrc5a6vUjOWo4RUR2RgNy0fXOZdUByTQZ7T1bxXldvQ
	 4VEZFCovFeINA==
From: Nicolas Schier <nsc@kernel.org>
Subject: [PATCH v2 0/2] Move tool for generating initramfs cpio to scripts/
Date: Mon, 20 Jul 2026 21:10:30 +0200
Message-Id: <20260720-move-gen_init_cpio-to-scripts-v2-0-26b7e15c7133@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKZyXmoC/4XNQQ7CIBCF4as0rB0DGIy48h6maVqcthMVyECIp
 undxXoAl/9bfG8RCZkwiXOzCMZCiYKvoXeNcHPvJwS61RZa6qPU2sAzFIQJfUeecuciBcgBkmO
 KOYHFk8XRWjSqF9WIjCO9Nv/a1p4p5cDv7a6o7/qTD9L+kYsCCdIZaeyg0Jnhckf2+NgHnkS7r
 usHOKyiessAAAA=
X-Change-ID: 20260225-move-gen_init_cpio-to-scripts-9e89ef99e51a
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Askar Safin <safinaskar@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=c1IBNOiyf4TgvYXAfwc/RyEjngYVQiw/iJ+Rmtozxn4=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqXnKspGJR23qqkKmcngd6c8CeA80UF4v0zBDQr
 KgZBU+kkPyJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCal5yrAAKCRAHUgpwFiYS
 aS+4EACaEZ2qlktOSRrr79LQRudTOb6hiiekEzHYmxXVhcSp+wlhxwwgkdpfDy1gMMdWbV2Qfhr
 PTA2g2UnHcfaWhr8NyHQ+zbwTztogGcpNPvvkkg3X1oB3H0iRgaqw94mhaPoE1EZzkJITEyDRdc
 RfL5Th0sVpjAd3yKVVJ6ofmCvl3nBqr1NJ+5KqIqAwd/2Yz9icvO6O7x8AXhivoO3IsKPfcPYDU
 lxY7LAw7nsVLaGajVEl71EaGXDQgJSVEh3gcB0Qq46Ah309PAUSpqkndBug9hdOhhYKu4+thuQh
 s9/SO3IuvLDVXofJ+YjjCclygQ6gDPs/o7I5mCA7NLdvQ5uO2ywcHBpynbJbc1B/n4xFIvMExuB
 QB2xs6+06KNTvPjmn2qETUNd8flECGeW8SKN/2MLsqyazDJmiNFkH3ZfJWBuxKahDIx7giw+Dvh
 yuQckxJlWDOpql84R0tVS4PQfhckbRK+/tMB9qnri78lBFeFs5tbDTQbO18Gsgyi198oXSqPD+b
 b7qt7u0TH/20Cp3DS/SvYA8e1xwpk9a15zm98Eqd487p+yxk2GqCtE/tW4dfw7RfEfkW6v1kV/K
 LRp/KDh1dHmeGDFGV392t8CGbD+Lz1GchMXfO7sEhkp4P5NbwRUVIAGfDpRVtBWM9IqvBYM6ktc
 REg4wSB01rPQWCg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

initramfs cpio tools had been subject of several recent discussions on
linux-kbuild.  Let's get two minor steps forward by enabling a
top-level target for building gen_init_cpio w/o the need of a valid
kbuild configuration [1] and move the tools for generating the builtin
initramfs from usr/ to scripts/ [2].

Link: https://lore.kernel.org/all/20260220191150.244006-1-safinaskar@gmail.com # [1]
Link: https://lore.kernel.org/all/aSdrCFkUQup3qb-q@derry.ads.avm.de/ # [2]
---
Changes in v2:
  * Build gen_init_cpio only if CONFIG_BLK_DEV_INITRD (Thomas)
  * Keep underscore top-level target name (scripts_gen_init_cpio)
    (Thomas)
  * Link to v1: https://patch.msgid.link/20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org

---
Nicolas Schier (2):
      kbuild: Mark usr_gen_init_cpio as no-dot-config-target
      kbuild: Move gen_init_cpio and gen_initramfs.sh to scripts/

 MAINTAINERS                       | 1 +
 Makefile                          | 9 +++++----
 scripts/.gitignore                | 1 +
 scripts/Makefile                  | 3 +++
 {usr => scripts}/gen_init_cpio.c  | 0
 {usr => scripts}/gen_initramfs.sh | 2 +-
 scripts/remove-stale-files        | 2 ++
 usr/.gitignore                    | 4 +++-
 usr/Makefile                      | 4 +---
 9 files changed, 17 insertions(+), 9 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260225-move-gen_init_cpio-to-scripts-9e89ef99e51a

Best regards,
-- 
Nicolas

