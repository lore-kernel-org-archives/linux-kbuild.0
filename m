Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121123;
	b=DEGbtfnN42CVQq5B01ShFeUWI7FS0DcXa+y4Ixry97RYgICGrP5IFpZ4sP6wSR6UY7x+
	 iZRuCwfUDesC7Wp1Jrk8j43fDg2DSj6iwccP+jjPOvatDBxu/pTZ4PSddC4O5o2dnMqg5
	 +mh78Yo/GqJgLIQzbwoq2hRMLCi/S3zIZQ6njX51hbPfbgJJ6SreBYoEf0NzgNFnwwMfg
	 9ze8Qm4PjgLu+OoQSNrPQ6u/b0zhWan3G7so9pRUt9PKmEcHIL7pkdiRMourXRJCdGt/L
	 WVVbJnRIjL3d1jlMSTh6EE2LydiK3rbUd9yMv0hp5ynRYPmWtJlMVo7vOvY9yWBJOYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121123;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0OtDbGBqze+bRKSv3Ej1WRuAm2A8b3ZGl/AFdu5oJdc=;
	b=YicUTYaN8fICO/V5riXoQEiAzEZ8XqVaIUY3J8tKQWhdsrOPI3jtOwresggEs7dE8fly
	 iNV4M6FrV/Uekb2UqtiJ3siF8ymXLWmXfRd9j6jH69e5ELhwrMNa0iheWET/3Ba/v1qQk
	 lFQN3Ky+akIfyR+PoUn+hs52tMAnOHv3lVzz6w+EgyU8ofqrK0GyM4HQl6K7VWz6+Y92t
	 tqqCt9kK0+EzSKpEAJhNqrQwdRt3dIiZs8aiNTiHkN3TEuZnWCDqfCl24Os1+bQTu16dw
	 9dP4j49Q22zQzbppZi7xAMYOnij+rHYZrdz0jl7ME0e2TOEP9FBUVU4XXs3iIE/FLTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=IuIcrpdj;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C16606BBA1;
	Thu, 19 Nov 2026 20:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0C16606BBA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=IuIcrpdj
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 08370404A5;
	Thu, 19 Nov 2026 21:45:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id EFCEE1FB967;
	Thu, 19 Nov 2026 21:45:14 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id F6bKvFekmpol; Thu, 19 Nov 2026 21:45:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 7341F1FBD38;
	Thu, 19 Nov 2026 21:45:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 7341F1FBD38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1795121114;
	bh=0OtDbGBqze+bRKSv3Ej1WRuAm2A8b3ZGl/AFdu5oJdc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=IuIcrpdjfGhT5d0esLRG8N3XdTH1gsul3/RbtyaOz9/ibDoAHQMP6lucwyCjkDlYv
	 FQrlMfkgePS2i9CKzdFoR/CYWH873hZVxbbhso+hYfdYDfPlmvPj8FjWC4Vt79x54u
	 s8d11t7vmmxrNoEDTuPnT3V8AbcL7PZiB0H4jtSwGwDaRMqdovl83oibI1+z1LoQbS
	 ma5bY4LRhMMWn/Hk9rccECBmFTlQb5bbrPSy1NKkhp0r6GLjYjn1lExoWPLtK8qmwm
	 GdmmbwnAx1Cx/b/2ZgFNl78CtczBa8f00PMRq9364dUD+ndDZ61bP9WHgZpDT0PBQP
	 LvdQuyyGJaDtA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id VlVKMZAeyWWz; Thu, 19 Nov 2026 21:45:14 +0100 (CET)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id ED0F61FB967;
	Thu, 19 Nov 2026 21:45:13 +0100 (CET)
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
Subject: [PATCH v6 1/7] scripts/make_fit: limit .cmd file parsing to the savedcmd_ line
Date: Thu, 19 Nov 2026 21:44:47 +0100
Message-ID: <20261119204457.9968-2-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119204457.9968-1-luis.augenstein@tngtech.com>
References: <20261119204457.9968-1-luis.augenstein@tngtech.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The command is always stored in the first line of the .cmd file. Read
only the first line, so remaining lines cannot get misparsed once
.cmd files record additional fields.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/make_fit.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 9bd35aa7211..38ef9a95dd3 100755
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

