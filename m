Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=24.134.29.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792946824;
	b=GbE8wy1GIzbP04lyx9dXA+e3M4p0DkQbLM4tigFImm3WqrLHsK731RCSaCRX55i30e/q
	 gST9BfZMyKCgG7SPEdICAJok0Sp5q9ZXdmfCa1IgVBvn56uWp3EBxpXYBk+C4WskLnUOG
	 EIwh7qSLqkvqCPteX2kLo32ofduxH57+Bol8W7DMGWQkQPhg+7JMgIGgum2Exf3mkVxi2
	 cqNdjQj5cZIRZxS6xZZoS/PtVzf9kjRfoOZe+49QnKZqpD0ohtP6tqbAw02eXAsJhzsIq
	 75ujv55lgDPKboNwJ69eS25xs0kujv+4vpZvQVaf7bxwkqYhEIkqkqtdD15mufcKW8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792946824;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Cwr+o06uVLQrU5K5AOquoZRWxYkGyF++r49uKrxAF44=;
	b=DjracjNwaKnRB4z07wQlHGuvNcjto0wUqS7vM/RsbQRe/1M27/MkFs7Kha0nxvA9wyYR
	 K86UAHIJ9JrJqsfCZobNNB3yFeo+r6JwGpbn0B1T5sJnTokl1YBISYdNuRI25KgM89Sl5
	 GzgZuhTDR9czG5gIgcRFGWdFxbDMWeZfEkrPJRZa4+aPhPamuADSqZu2BGYwGUTJcH3QS
	 wsZ9NDG92pvRy4MRKFvErrqKUNjrkvPX0FHwGr+znKakbCVpB1vIjB8DNcmHq8NpM+6hS
	 BBCqWlze9/sXdi/sKhc5+bJ33Wf9Isky6AsQ5/s1P2NFlxkawsjfFYhj3Ly+f09YY9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sigxcpu.org;
	spf=pass smtp.mailfrom=sigxcpu.org;
	dkim=pass header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=f7ATtU3k;
	arc=none smtp.remote-ip=24.134.29.49
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272CC606A322;
	Sun, 25 Oct 2026 16:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 272CC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=f7ATtU3k
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id DB674FB02;
	Sun, 25 Oct 2026 17:46:54 +0100 (CET)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id do32rT8sw1Dy; Sun, 25 Oct 2026 17:46:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1792946812; bh=DuJRBwLNzzlV+FQsAfJ66t49B9wxZtxMoiQnSV35KIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f7ATtU3kUUnV0P5kORa9OwECjM5vQ+RMkJzKMxZ7X5sml775II8Wb/al48kuoavZz
	 3CEUN7WvGqOWvaWEWURcCc9JbKv1RIOXz6ssLBF4AQmw+9hg5z8wbZ0JkiMYz9pig/
	 NQ33ugJgX6dJ0UtLnNSNyrI20nvccIGZ2AHAK/92GuLmxFj0HReDWN4M6NyLsL7NLv
	 WM0WPyXaiW62GN8shJRRRJjtHCV8OE6Ss//55UVUTdp/+veaDh4WixJyIawCnHK6fO
	 8/Uo3ZJxbSq8I2i8Ip9fXhVqgy+05UkDDCES1t3aJURNNOQeguSqQcnndVgfQvaz0q
	 P+YP6hg3jKTAQ==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Sun, 25 Oct 2026 17:46:35 +0100
Subject: [PATCH v2 1/2] kbuild: builddeb: Use ${KERNELRELEASE} consistently
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261025-deb-pkg-v2-1-8c33a4ac18ad@sigxcpu.org>
References: <20261025-deb-pkg-v2-0-8c33a4ac18ad@sigxcpu.org>
In-Reply-To: <20261025-deb-pkg-v2-0-8c33a4ac18ad@sigxcpu.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=862; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=DuJRBwLNzzlV+FQsAfJ66t49B9wxZtxMoiQnSV35KIg=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQnEzako1aFFyRCtDTTRmeWNuOXhOMkd5c2I1eWxFCmQrc2dCbWlnODhWdzVZOEts
 ZGFKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYXQ0eWVRQUt
 DUkFsdjRaU1N2ekI0NHVlRC93SUM5L2FNbFJnM25BelAwd2hsbEQ4ejQ0QVlmWXNRRUlrWjgzRA
 oxZ29iV3VCMjV3c0ZYRHhOSTNHYkxzMk1MQ0JzS3JHRklQNWdJN3ZWbzZTWmdSOXliS25ZdnNuV
 1J0a3pnNkJ6Ck5kTlYxVjFFclZVYlBzbzhLTVNjNkRwYzhtU3JqdW51dFZmNDdKVlJZcUJPTE1I
 bFdvTG52V2ZRVDVLaUlWNzUKWEFmWDhTWHVyMzNGZnBMOTQ5WjNBMFdJK1BHU1kyUEJnTDZxaDg
 ydVV0UUJRNXBraWYzdTVRNnZtckZ2Vml0aApRdjVWTWxtL1Z5KzJHek5qaUdwdm9Fd0lRMStqNT
 ZvSlRPYktUTEhUVmNEN1dSNUVVaTVESys2N2ZHci9OSlpCCjRyWTI4RTZFd0RyQlA0SlV5UzVyO
 WhnYUdzK1AyRjJ2V1JaaUM4Z25kMjVrVFIvRXo2a3VrVmdmeGhTYlp2UHgKZFNDQVdPRDRKR3Ar
 OENJd2NNcmY2SDI2Wm5XejA0V3hBYkxKWEplTTV4NW80TTV6VDVYYWNFcG5CR1BZeG5JMgp4RnQ
 2c2tYMHhOUU9jNlB6Mk9mK0VMTkZ5cytkQTVjYk9EaHA2bEhYTUFPcUtWTkFVa2JmVEtrcUtwOG
 5TVzk1Cmdja0VoRWhxR1Bjb0J1eXNWaTVoaEtyckdqTzI5MVBYUmdtckFxcGxmV3MrVHlPL1JFb
 UFnNHJnZHZaelNWV1UKdzIvb3JLc09GYU1lYXRhUWwydm9YeU5jL0kzSU16Z2ZIeDNJUWxlcTZH
 OWt3b3dONTZHS1VYY2dSay91VXFrRApHaEo0KzFBbWg5Y2cwcThTRzlMUW9YVVczTUppY1BXbDZ
 LUDNFVGU1QTRWUU5NVW5MOUkyTGU3bzFxZWpLKzRYCjJQY0o1dz09Cj05NmlWCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=agx@sigxcpu.org; a=openpgp;
 fpr=0DB3932762F78E592F6522AFBB5A2C77584122D3

Only use $version when it affects the package name, other places
should use ${KERNELRELEASE}.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 scripts/package/builddeb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index ba1defc616524..5fdc9ea0dcca4 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -147,8 +147,8 @@ install_kernel_headers () {
 		"${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
 	fi
 
-	mkdir -p $pdir/lib/modules/$version/
-	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
+	mkdir -p $pdir/lib/modules/${KERNELRELEASE}/
+	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/${KERNELRELEASE}/build
 }
 
 install_libc_headers () {

-- 
2.53.0

