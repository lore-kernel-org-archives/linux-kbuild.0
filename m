Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851560;
	b=rVDt2svDqHPzNbVaoeKWzUv59D3INxqTZ/KfQFLD8g9Hs4x7qKbetQE4zJDK/SN7ko2y
	 x9qE3AdlZFuNQ+hPDafnyZytyYXHKbCkx5dsGPxICkSvw3e1+M24IjuDq/fUQnugi6f6j
	 PGzpZLBfyV5nWZDBc3DOnXNKJu4tRYSJevTLQc4h0PspMxJA1VKKTbLq7OGirwJQsplWI
	 SGqeZ3NviXoKVWEBkh1j82ehWXCzquQxaFJqA1aV/Y9fGAFCaXRisagKOo086dvzfpj97
	 zVPpBEvi/0T3f6x/FWXE/achaZgEd+UKfoBKpCUUT+9C8VGeT5w/MmZyWjzNhKfs6EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851560;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0OtDbGBqze+bRKSv3Ej1WRuAm2A8b3ZGl/AFdu5oJdc=;
	b=lPf/DooOdNYzP4qxhhpxf4RhCSVbzSsn6PYV8ZqnxFXT/v1hQqRREQOUPnEjtqTZ93cG
	 hXnY2QxDTsTBVJaWXIlxauT8C73AGu3QDxZsX3QOG+XIrSrgtl6TWUjyjbW6NejdjtFLI
	 w4n74IZ/68oPvAB/96Oac5yXSK9ouSaXQi6w6XfI34e1pw7X5Q2oE2t4HYmwWk71x9PfG
	 2ZffGO6wIrMWpCXuU0YOd3tKeSw4+dyH9Q5o3PrVFJbYNitI9LZzOAtYWm1VRidhs4WXU
	 nUgeOnDNOlKI2Qb0W4PfR84h9igqSJIjqYRa/Qfd8rvb2Fis63izU5CrKW8+tAn1MPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b="a58Jicy/";
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0147B606A332;
	Mon, 16 Nov 2026 17:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0147B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=a58Jicy/
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id BC2493F489;
	Mon, 16 Nov 2026 18:52:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id B13841FBB5B;
	Mon, 16 Nov 2026 18:52:33 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id OFChHDTfFOG6; Mon, 16 Nov 2026 18:52:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 2FE9E1FBB9B;
	Mon, 16 Nov 2026 18:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 2FE9E1FBB9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1794851553;
	bh=0OtDbGBqze+bRKSv3Ej1WRuAm2A8b3ZGl/AFdu5oJdc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=a58Jicy/JXjdB+QuH2cMePkRtxOdneJoX2fcxmnf/PIyHaoKOaJJheNFcmOAuP+1n
	 qm1WSRGfhikjqEVnaKkkrB91Ms9XUEhYLTEprwlutrpRnzpcI7aEATYJOTQYfMLUZH
	 1F0AcPbjY8C/+QfiZVX8ECp9iLvTvBxm9i5W9AIWcpDJSaDs7IfdTw6LmF79mmIdEC
	 k6+hWqLvHGj+5c4LnTb4XfQQn2yld0Z2GgPrZYGod/QXy0fp+sAQQSFcTrJadmjf7h
	 duAe3PEcEUlRErBGIfK2oOmT3xlKl+vJLS7ejtLMFzdTpMwozAGYtmnuhtCcz6YHED
	 GDcAjXSNEc9mg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 1G7NudPi5meu; Mon, 16 Nov 2026 18:52:33 +0100 (CET)
Received: from luis-Precision-5480.int.tngtech.com (unknown [193.30.133.7])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id A2E4E1FBB5B;
	Mon, 16 Nov 2026 18:52:32 +0100 (CET)
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
Subject: [PATCH v5 1/7] scripts/make_fit: limit .cmd file parsing to the savedcmd_ line
Date: Mon, 16 Nov 2026 18:51:48 +0100
Message-ID: <20261116175215.1337416-2-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116175215.1337416-1-luis.augenstein@tngtech.com>
References: <20261116175215.1337416-1-luis.augenstein@tngtech.com>
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

