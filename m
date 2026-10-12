Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16874F5DE2;
	Mon, 12 Oct 2026 21:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.107.87.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840836; cv=none; b=iRKh/uCv2B6fdiOi6oQLcAnE7SQfNsZrFbAujx8rwjj+keGSZ2x2J88kb5uKRTFc9Tui7H6IbNXZjaXm6x6wqNzM6rVQgPZTYUG8N6jmoEdGmgxkQUs9niMtmee/DiAHag6NoAtS7nk8UwDAqgUNAwUQ//Sq1ws8IaO4FqpIBQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840836; c=relaxed/simple;
	bh=Pd4ztwx2VP+7hDSN50swi9KZhBBWV2oP8WtHXynuN+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IeSEySjI/Ekxf0ZSLaHncaNFIWNHj/t2+8gzKxb4SFBM8eJd21Cx4s7aewqf1yvvxm+4yxTjz9pQdBRkLRbAL3/LcmY2iO1esksMLtSFCSA7OdLVfrVI/H+Iiq0cV6R5vrlmtzLgSSutvA1Radoh6yiNy3YR7ZPOs3lb5peK7hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=b9AsS6YH; arc=none smtp.client-ip=34.107.87.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="b9AsS6YH"
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 3D78640872;
	Mon, 12 Oct 2026 23:33:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 367EC1F8B42;
	Mon, 12 Oct 2026 23:33:54 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id mh7Athzz3Gti; Mon, 12 Oct 2026 23:33:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id B1C7F1F8B81;
	Mon, 12 Oct 2026 23:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz B1C7F1F8B81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1791840833;
	bh=qgwUvIu8vTK1KFzREzKnxOJMMW5pemhpH6f2FgKjSE0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=b9AsS6YHkatJGUX0Ip4QOJP7cYr8MgDnWZJL+tiYEHqSG//85BNgHTyr0cYdgVkmo
	 ib/wcc/Lel3kRLBoay3X+qMGrYHzzTnYyl9yDjk9W5G6RU5k+xnJmSKLxDccELGz1B
	 x5qoqeQeE/1eEks4r3Oh7zEm+0Hx3lXtNsE1P60PcgjThJJsabj38qjCE+aAQDfef9
	 tlAk+AI0P/fTQIw0GfOpAx1yBRdaUqegb8tCr1ZkDl6XOMfvZsrDWduzHOtl9gZG9i
	 q9/RzLdR5vHPrKU0Edfl5pi2wA3IVUVKKX/D3v/b0wX+1Siy0C3dpufpfdSvjk5gg1
	 IfjTGo06hQH4A==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id WV_sQLWE2IBw; Mon, 12 Oct 2026 23:33:53 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 51C441F8B42;
	Mon, 12 Oct 2026 23:33:53 +0200 (CEST)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v3 1/7] scripts/make_fit: limit .cmd file parsing to the savedcmd_ line
Date: Mon, 12 Oct 2026 23:33:16 +0200
Message-ID: <20261012213337.2466524-2-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012213337.2466524-1-luis.augenstein@tngtech.com>
References: <20261012213337.2466524-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The command is always stored in the first line of the .cmd file. Read
only the first line, so remaining lines cannot get misparsed once
.cmd files record additional fields.

Assisted-by: LLM
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/make_fit.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 15ba26974fd..346e8a7ec12 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -288,7 +288,7 @@ def process_dtb(fname, args):
         path, basename =3D os.path.split(fname)
         cmd_fname =3D os.path.join(path, f'.{basename}.cmd')
         with open(cmd_fname, 'r', encoding=3D'ascii') as inf:
-            cmd =3D inf.read()
+            cmd =3D inf.readline()
=20
         if 'scripts/dtc/fdtoverlay' in cmd:
             # This depends on the structure of the composite DTB command
--=20
2.43.0

