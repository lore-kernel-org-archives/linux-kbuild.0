Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5AD4E77F7;
	Mon, 12 Oct 2026 21:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.107.87.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840840; cv=none; b=Raqm+smdRe6VWYElrgW6n818g3wTY1A86R8TGvAu9LExUhZ2qJTF2isdrcxzThE//BKDz404ysihHUJkUaoJaMSQteleFJ0L71FA9QUrk/Cndba9FZ3slzPc5z70n8mmLceaJB0WLW+0D5PWNcBQkWC0SOvcLl02m8lN0Tiojvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840840; c=relaxed/simple;
	bh=yVBxuNrL4AqXjoxigtaN//gHt5eAPtzbeLqfQwcZ62g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHD7rVN4S+/Cfc40JdcbPC51JC/UWJxp1FqBU+lLgptbJaaNtubGix7YZOn82/et26y36FgnBWttO8Ew0EIx7rw6zuqLb6EuerAa2YYxmm82dJS43xwB2rgrAgT2AfX/8KzjZ/Uicj+HvlsObl/EyymtJhOlf1yS1hTg4QGYezw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=mewumI2E; arc=none smtp.client-ip=34.107.87.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="mewumI2E"
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id D5F5E40872;
	Mon, 12 Oct 2026 23:33:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id CE8B41F8B42;
	Mon, 12 Oct 2026 23:33:57 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id U-topW0PaePf; Mon, 12 Oct 2026 23:33:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 5778B1F8B81;
	Mon, 12 Oct 2026 23:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 5778B1F8B81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1791840837;
	bh=GoN8nzsoCvIkMgIVRYDhycdpXlNMHGoZWYV6LMwIyoI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mewumI2EV3I+SJFYNFPc9yrE7ijGgOfaw5+Qvfm5m/yMbOiuNdADtpLr7R9skIvZy
	 ldrMSccqG9WE7a5lwG1lPr9xU6DdUAiH5K/V1RgnaJPJcrPCMn0GYwOlejON0MgaIo
	 eeMw5Kqt5AeSMONzyKygGfRFZ8zaQmBnDHX5FCKobx6fr9MJSJx5utFLRH8eQM7dD3
	 oQ0+U1LoIcCAe/0a2qE19V72UFFSJBAtE1H2OFbowot4JLko9f75XtkR5rBC0xpLYQ
	 S39eUDtzJsmPd2iBKAyeQQ87DzW4Yqp4udaOXpnGVAlRKiD9Pw1S6zykVM69i5qTXX
	 VycLewq5l60Cg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id lNUKmVIQpvuR; Mon, 12 Oct 2026 23:33:57 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id E504C1F8B42;
	Mon, 12 Oct 2026 23:33:56 +0200 (CEST)
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
Subject: [PATCH v3 3/7] scripts/sbom: skip make_prereqs lines when parsing .cmd files
Date: Mon, 12 Oct 2026 23:33:18 +0200
Message-ID: <20261012213337.2466524-4-luis.augenstein@tngtech.com>
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

