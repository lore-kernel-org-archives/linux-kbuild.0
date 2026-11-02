Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651004;
	b=H51Mpoa0GelasODDRRSmZ6IGTY0hsC12Ta/lQcrYcANnYbEz0ssZIZP699lENw+iIh9/
	 Bmwi04mVV1qL+ddnwb98CMSpDW41e38vkGXkop1LLSMo0sxGAyWu2MMQz1PuOTqeDtKDW
	 5yWGcLK1g4wj70winuPJslivhvv0vB3hs3d2TK+7dhg4U2Wk/pz1LoprdcCXTnYOARCRc
	 ux7dSvlpJKwO2xq3wgWFMWVZ97G5fK2RWwrllk78vljhmnK252Xs+3WPKQ8PfwNPLOAQR
	 UIh1EE1ObFQkIdlgyT+woogVvnDsTsZqXusEsGM2quio2POrZjgpxHwM47vHCuzEWhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651004;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GoN8nzsoCvIkMgIVRYDhycdpXlNMHGoZWYV6LMwIyoI=;
	b=Q6sHbs0moZWoR2T9BJZQVy7Hywzq4A3ZLoFpuCH1MZjDStaf+zJ2t0Isv1P2CmnvqFwR
	 M4rAgDFfTmG4Q1Vfrv1ytfmRcg9z4dIp3qqe6+3F3flnWKYzmfCihZ3g8MLzUid6aT1I0
	 3ESn4X9E06nULzpgLjIjwKw79nf0fL6J3hGj9colwvHkWnYNp8epUxveD1nrXZ3RJqoSn
	 hgVbE/Zc7BQr69oxfuxh2eDS+Gy34MlEOKIUNQmsPhRBCuUW/dapiN0xOdnLyI+6WXUzD
	 oVnsfzgXoFwRuovoitdho4F6TD8+ndfTdNWkYbh6VRuwascRd6zRgROfrsnuN210cOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=Epc2spd8;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405FC606A32D;
	Mon,  2 Nov 2026 20:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 405FC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=Epc2spd8
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 756533FCDE;
	Mon,  2 Nov 2026 21:23:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 5120B1FBCE8;
	Mon,  2 Nov 2026 21:23:17 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 2j4VamOJ0TN4; Mon,  2 Nov 2026 21:23:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 836621FBCEC;
	Mon,  2 Nov 2026 21:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 836621FBCEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1793650995;
	bh=GoN8nzsoCvIkMgIVRYDhycdpXlNMHGoZWYV6LMwIyoI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Epc2spd8Eq8xzeEFQbdsbSGwMgSjdFK7yqtyzD88TeRKgQMD6lcDOjWYOQxwg3zlP
	 EwYvRnZEeooZwpcxx0TeXAxGLnY1Gpvr6Jvy1uGX/nr5pnP8gDomi1s2Cq9yCIkPzP
	 nWJNdfBbmDnZv24ziovf2HwYljh6HFlhCs/1+2tkvI41g3FTjFlJdabG9f5peKyvXW
	 oY76STxWeO+YE7gtYK3qOwJFPvixYr9pCv3PNMV3NJ0/bKQUur0h3mKcmWrAAi9T7s
	 FbhZ267UnqY70URIPHjUFFiKwH7uPSbgMJkimZSR2MM15HT8y9/bnGEIpwNOdn67Gs
	 qS52yafDqFEyw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id f0KDJgR0-5SX; Mon,  2 Nov 2026 21:23:15 +0100 (CET)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 158551FBCE8;
	Mon,  2 Nov 2026 21:23:15 +0100 (CET)
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
Subject: [PATCH v4 3/7] scripts/sbom: skip make_prereqs lines when parsing .cmd files
Date: Mon,  2 Nov 2026 21:22:56 +0100
Message-ID: <20261102202308.3209536-4-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102202308.3209536-1-luis.augenstein@tngtech.com>
References: <20261102202308.3209536-1-luis.augenstein@tngtech.com>
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

kbuild will record the prerequisites of a target in a new
make_prereqs_<target> field in .cmd files. Skip such lines so the
parser keeps working once the field is introduced.

Assisted-by: LLM
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/sbom/cmd_graph/cmd_file.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/sbom/sbom/cmd_graph/cmd_file.py b/scripts/sbom/sbom/=
cmd_graph/cmd_file.py
index dcd63e284a3..08819b4d117 100644
--- a/scripts/sbom/sbom/cmd_graph/cmd_file.py
+++ b/scripts/sbom/sbom/cmd_graph/cmd_file.py
@@ -50,6 +50,10 @@ class CmdFile:
         with open(cmd_file_path, "rt", encoding=3D"utf-8") as f:
             lines =3D [line.strip() for line in f.readlines() if line.st=
rip() !=3D "" and not line.startswith("#")]
=20
+        # make_prereqs_* is recorded for future use. Ignore it for now t=
o
+        # preserve the existing parser behavior.
+        lines =3D [line for line in lines if not line.startswith("make_p=
rereqs_")]
+
         # savedcmd
         match =3D SAVEDCMD_PATTERN.match(lines[0] if lines else "")
         if match is None:
--=20
2.43.0

