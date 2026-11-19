Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121125;
	b=S8Ne6S7FZ3qXK65su3Tj6uBalCgMxiwAxBhs9GWRinu+H3HYedwJrnyC++ireu0qf7bn
	 txbhkR2tW8qoszy+E3peHgS4UcraF1Cr64MbuXrHW8UqNUX1OUuRSzmmVgEbS6EU9Ivj4
	 QHdnha8wgihPyPi1o6cXspVKCZZCEUEd+Ll1wUGVl009NwWlHUOOVAflynkZzFxK/iyVc
	 1HlpfKymUYfXjdtGzAjTx/Hak5cUW5Eq0gGZ9HwFFMM4UYhH2BIxo2mleyVrJ1Ma8ExbF
	 dIFyyWphjjk6TBmB5uvhvxwdZkzvCFUUh1w39asdHwmjWrgEjk5V20UNx8nI7Mv84Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121125;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qx6XItyApfpnlvsWbWoCxgS3XsH9/jafajBvwFlOY4A=;
	b=5ZtimIcSR7RlcuoLdObfK3ZTa8CvwNEFU7M1ucduv7IFLrgvpuO2HnsfyLsTwox3CwJ0
	 JqSf/3ONEP5gV+vMBSOIMVgGTJDHdomK7nBrmEOSEEh7ZwD5hVcJqXPFPXYxcdQLlTI+U
	 1QpREOkz1DxPa72k74SzHEXYi2prxA1k76jtswxc+CtLtYwJPCWg+CNdSIDVtRoNWQ6TY
	 1fv8kQvhtAnj/CLiDR3zXZwAWwZ6KvV1PQh/2tVwczpVlAEAeNvMwFzH+61OJCIauqVmn
	 +QpLoOloVlptJMf6PqcIPzDfmGt1TWYtD3QEoGTZk6FZkGGvUaSdHn1cztvBYZp4KCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b="jbFz/ION";
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A230606CC4C;
	Thu, 19 Nov 2026 20:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A230606CC4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=jbFz/ION
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 0A9B14050C;
	Thu, 19 Nov 2026 21:45:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 0273A1FB967;
	Thu, 19 Nov 2026 21:45:18 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id VVr8in8AQf-j; Thu, 19 Nov 2026 21:45:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 7E01E1FBD38;
	Thu, 19 Nov 2026 21:45:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 7E01E1FBD38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1795121117;
	bh=Qx6XItyApfpnlvsWbWoCxgS3XsH9/jafajBvwFlOY4A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=jbFz/IONqLE6c+pVoW0NJ2/v2QUzLmNL4iWbatr+qUGD1RTdyl6SLNVKohl0nPSUI
	 oZnmXtKLa9Oov8zKuQWT1ZkYF4D+MuqgPuZaTk2w2bw8chjWZ3/qwfvHaVU+VxkOsZ
	 fEwqI+52+VMu7ssYyxnhA1rrFo3JgVkxfHx80RiDByg7pRuTpKhLyms8hFViNCnoiw
	 hc46vHrnv6KYTdWpjaTuapc/nY5Wao8MUkAp6Z6z83AA9kP38RAi1hYUm1/xwevPWd
	 4b/PwViVcjWnKQmVSeqChZ+c3JNBzyoswUIxE9iogA1H05yaokaPuVG8io3dWzNy7S
	 G3FuGbuHy5VVQ==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id xOLfuKeuq_uJ; Thu, 19 Nov 2026 21:45:17 +0100 (CET)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 1567E1FB967;
	Thu, 19 Nov 2026 21:45:17 +0100 (CET)
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
Subject: [PATCH v6 3/7] scripts/sbom: skip make_prereqs lines when parsing .cmd files
Date: Thu, 19 Nov 2026 21:44:49 +0100
Message-ID: <20261119204457.9968-4-luis.augenstein@tngtech.com>
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

kbuild will record the prerequisites of a target in a new
make_prereqs_<target> field in .cmd files. Skip such lines so the
parser keeps working once the field is introduced.

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

