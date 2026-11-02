Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651006;
	b=dL5/mohdl4BOnu3cyaDEl+EPtCbYy1BW7XgsmD9rd3scn8sdsphYz33SxJUFSlDpN8lL
	 +W+oz6VVnWF6WQwBGgzh6eSssAzajHbOloDd3tkN+yNq4clVFVthwqjagEwino3zzFxbP
	 OoukSdTiwqQ/VYjEnhafpSUqgmMqqGI+OfPamG7uTdXKSIG3TAnnNS1vK4ho25k8HCQgc
	 3GcfByP22AIl7qfOp+eMe9I7KT9NZb5Y7VSysEkE/K2bn7oSi5XUvmoEwGX/C3buxtMqX
	 TK5osnFtaFzQtT1HnT65FLRAjy/r44Ekf5nV1xKF2ZrrlNdYS/mtPDZ0j7WbjrJ3iNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651006;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NTTR8/Sm7pb9fAK4a0QT/cN125KZo+xGPT0hTqypPZI=;
	b=N8UNW75piZ3Kon53/He/1JXGVBPq1sl5UhtCmgE7C3w6MIn/uSivwEj5Pw4Cuzew9UzU
	 V7czVszfsqFbHg23/L5jDuiUXWAgk60D63oMr9tAFFDIDOQ1UuBXMJNVJb7XH1doFmf/K
	 0em/65yo+0qqZcurbuS5+MBQSlXvFwKt7nQOM92shsAQq/g1+PXhovVHnmDZfvwUNAO6D
	 GOrwaAVXQNL2lmiV77rbFftV7+Hxqy1xMrmS/jf6A9n7tMLf80pDJAJ3Ae7X6IXDH+LPK
	 BdbnuREbRr/TJ4BapEbhnNeY8FgPO4el1IHIVtdmwMcvLl9cXWPEaKRvS+CNZ3MAhSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=C4H2Yv+n;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83607606A332;
	Mon,  2 Nov 2026 20:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83607606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=C4H2Yv+n
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 8A881403A4;
	Mon,  2 Nov 2026 21:23:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 7388A1FBC65;
	Mon,  2 Nov 2026 21:23:17 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 0USiD1SE4qBm; Mon,  2 Nov 2026 21:23:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 475BD1FBC81;
	Mon,  2 Nov 2026 21:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 475BD1FBC81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1793650993;
	bh=NTTR8/Sm7pb9fAK4a0QT/cN125KZo+xGPT0hTqypPZI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=C4H2Yv+nmTiW74rYf3SLVB4yjSYDP9A1z28YIcpQXLfuYf+u1G89AAzwfWDz1QRc6
	 xy0i7DTi1IKliMPirZ00dag64xP7Ude9FbpwhsWw4wUGyl/drTkUPTB1MEZ/1sEu4j
	 0pPlX1xIWYw2EqFFc1CRdFOPXvVLuFsi56CmnX5OzctnhC2NY2cVwyzXOCHy0zVeHL
	 mnAC9+/LTFOnvKfpFficYN1nBY6RBCi9GphTeF1ew9sb/LwCG1z1LNZw1NNNABXAvC
	 COm1xmtiT83Q/9pkaEbWPUJ3hjVRFRTSCU4KKjcD/wWWJjqYiruwTfBZb0O8P4hAOL
	 5fyOMKjrjIdtQ==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id J1eKAeqHWbJW; Mon,  2 Nov 2026 21:23:13 +0100 (CET)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id BDBC91FBC65;
	Mon,  2 Nov 2026 21:23:12 +0100 (CET)
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
Subject: [PATCH v4 1/7] scripts/make_fit: limit .cmd file parsing to the savedcmd_ line
Date: Mon,  2 Nov 2026 21:22:54 +0100
Message-ID: <20261102202308.3209536-2-luis.augenstein@tngtech.com>
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

