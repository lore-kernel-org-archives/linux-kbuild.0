Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851562;
	b=huvHmcCu0KgRI3ZkRDbX6KrMXPUC2HvNMaiviyPJDVKdPBoFxHQhABEMq18v85C9B/o6
	 /Zu6tvlMsd5U01Xmc3+0fG7ZFQByNf02l483GYUF7satoyEO/fW3/cS0gWcXZk1c2eQz+
	 qHSvfukUmkYwqMz3eyQT0ULRje4QfQhkrWG2gm0Me2sc7DbBw59sgqtQ3RKF0ZtoeRm85
	 FzxDC6loirz7H5PnKMKw6vPhYgvTCC+RSxHZybN310jpuhkUmHJz2toPaTK/9y5IIcAws
	 rbUrCZOOQu76cJXG6mMeYIRogAE9asuimLNYUyyfNiCJ7Geg4jgU3FGnktRcif2emGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851562;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qx6XItyApfpnlvsWbWoCxgS3XsH9/jafajBvwFlOY4A=;
	b=z636RGXEz7RbS/pYggvKikE2aZ9Gkq48ZJ58ri6uPVeaCOvH7bsKztYjMzE5WeAz8Gzx
	 uOb7pQd7Wa/EaEEnJv3oNUZAWV9dQta1fhZLZ6ehLaLB3iG6090S2obgcsdUe/neVWbYS
	 b/wumELxNpQATwSYoBep6pgNPhdKSt87PwSixpFJg9O67ZLivwS0++a73I74byq5oq6Dl
	 I+3aEINvefOjt/9scWlPDX0l5YZZ1Sld3JRHfRtAU4Zt/ZmZBJGyljX8z19/GRZ0VOknO
	 /nSd8Qoh+EGYcE23grDgVAcrvqfh89iLwFTRIQ0GRnzt85ARB7ubfOU4McWv+brrMeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=ZWwdz0jD;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462ED606A336;
	Mon, 16 Nov 2026 17:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 462ED606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=ZWwdz0jD
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id EB6453FC59;
	Mon, 16 Nov 2026 18:52:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id DDC121FBB5B;
	Mon, 16 Nov 2026 18:52:36 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id k9BvpGrwflpr; Mon, 16 Nov 2026 18:52:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 48A011FBB9B;
	Mon, 16 Nov 2026 18:52:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 48A011FBB9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1794851556;
	bh=Qx6XItyApfpnlvsWbWoCxgS3XsH9/jafajBvwFlOY4A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ZWwdz0jDdcPkEJvVtV5m+A6mblEQi3aM/lBZ2wOpfF1Y02t7N/ZNt7seafPdWM3bS
	 koGNB4OkfLP2//ictRFW5d9b8qgjrYgA3CktnvjFMabUx5qiRlX7bwmF1H2+PdwE1c
	 nxCyb1PfNPvJw6jHuPKG/dZGqIZIS5HCGLjLgKBEzYTgz0yuf1pIhLLAkibSzz317s
	 biq+imiOIuIIDZZ8smqYhKY9dGL0yajGYY3syiRKhLUI4Tbvsvh1NctfYMsaF/4LaY
	 XbCqHiF5Hm+IOPzuihGL/hCShCUz+l3IxOSgUhQWjM0YeiPwWHSoLsJtvItqlcW3Jk
	 7uydU8uiqY/Hw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ZMXRpplD1gj0; Mon, 16 Nov 2026 18:52:36 +0100 (CET)
Received: from luis-Precision-5480.int.tngtech.com (unknown [193.30.133.7])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id AD8171FBB5B;
	Mon, 16 Nov 2026 18:52:35 +0100 (CET)
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
Subject: [PATCH v5 3/7] scripts/sbom: skip make_prereqs lines when parsing .cmd files
Date: Mon, 16 Nov 2026 18:51:50 +0100
Message-ID: <20261116175215.1337416-4-luis.augenstein@tngtech.com>
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

