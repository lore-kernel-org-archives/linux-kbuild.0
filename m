Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=24.134.29.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792946825;
	b=NkgBHT2+gtOestcYzdoeH1p6V3tYlv5gzoZ/dD+Dd8t8UbrAeqTIo9J+72qkxaeKV9PA
	 9k6ykPzlrfQ4y/CVkawy2G5gB3Q1p/Dg1WxmXFscsMb6Blsu2ao6wwxC89UkO7iE7HRZP
	 OuDZHeRbBMoXNzFo90SqJTUxkxve+Ws/e27Na/G7XXQaZcGq0q7iLHSDJA8UFirSr+lgz
	 V2VOVi8Gs83svPNm2FUSWG6Ra53EE9AixDnATQLW+XERJqDrwrLXX5anAs9XDpM+7lWIL
	 3Dwde0MKsK7dnsJBdPcDmfmlGmaJQpj/zEELet6BSpFhePOh5l3Z1acmyOkYBzIvqGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792946825;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qZJpeVsoVc1R3QnR6MUnjtBvtCvjfP4BItTHungucAk=;
	b=bTZJGUz2M8qrzlpT4OmOE1kj9SmSIK2V5i/zuRGkHBTCD8h67sRQGQT2QECGPVsZn66e
	 Y0xeY/wQDqsMt2LZtXE6svW+J6B2WXAe2t9BvgZA6MSGfN+O+xRJMEKCjypB5cXbReRwO
	 6jAR37pRSgCYp11s0U21w4eq00fBI1qmACkhV1UMHYXOGOD0eA6F1brJkkKx4sKTBYLjX
	 wPywTcbA9S7nqTmFLSuoXaBiU7bzeWe78Z6EkuHcjJfWRqE8ks9rCBnBRziHOgp3V73VN
	 LCSaqbKBnmEkczCEj73O6vex6LlQEMGBwR037vTQTmeLqkeJOxXXHh1EsurCnRwuCMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sigxcpu.org;
	spf=pass smtp.mailfrom=sigxcpu.org;
	dkim=pass header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=FWUMVz8a;
	arc=none smtp.remote-ip=24.134.29.49
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43952606A329;
	Sun, 25 Oct 2026 16:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43952606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=FWUMVz8a
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 12293FB03;
	Sun, 25 Oct 2026 17:46:57 +0100 (CET)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCs1BPmB2cjW; Sun, 25 Oct 2026 17:46:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1792946812; bh=3nDEElbWW7mRqvIraI32WiLVtOfSNyfw7kBcEtdycuI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FWUMVz8aOmHvfXmPT3Ivrj/qsWmFW8pyCDcM/ufCuZB/auCqVKDGBmf9QbdYsOtdn
	 opbKwlwZoOeMzDWFf0hRx/wnru1/6vxSh/JxvA3ztDgsZ5loBzEuzw9xiMcyt+Pzve
	 SW46TacC9Q6D3YfSzrwKnhc+ZHy1W2EoQJMI590ksfM300PDztqYMcOoIsynC9gOfH
	 Dj7XZuSps8rVzdPlLg3BSHCWg6Hgiz1uKW9VPlPeLTTeJtdAK8WPV1UAjppetBCFwz
	 kWxCtkdku5FL4H8yDyA7WyIQvxpGdPWT1M9jKOc3XM0UTzOP4yEnvvtZIWvqjk7qUE
	 UjDSECxhJqf/Q==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Sun, 25 Oct 2026 17:46:36 +0100
Subject: [PATCH v2 2/2] kbuild: deb-pkg: allow to set package name version
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
Message-Id: <20261025-deb-pkg-v2-2-8c33a4ac18ad@sigxcpu.org>
References: <20261025-deb-pkg-v2-0-8c33a4ac18ad@sigxcpu.org>
In-Reply-To: <20261025-deb-pkg-v2-0-8c33a4ac18ad@sigxcpu.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=3nDEElbWW7mRqvIraI32WiLVtOfSNyfw7kBcEtdycuI=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQnEzako2UUlpcmhjeExnVU0yWHhnN2hoZFU0eHI5CkxlZU1SOEtkaUw2NzhTZTJQ
 WitKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYXQ0eWVnQUt
 DUkFsdjRaU1N2ekI0dzdqRUFDL2t1OUJVQ2kzRzVOU01hM2piZzV1aEFaZXJZajJ2UnZZZ0poRQ
 o1aUI5WTdlZzdrekVqSk8yc3FwdUVxYTFGVnl1TUZxdlkzQ1h5dzZmNkl6ZzVkWjgweHlkN1Q2N
 XlQc1A5c2VWCll6SEU2SUtvWVNzMENaZE1nR2Z3TG92c3orT28xYjFGempWd054cWtNQnRDZ2NR
 WStPTlhmZXdzY24yblJSWHAKZit6OTFJZFc1L0xnc3ZWK1VHZ3RQNkFVQ0NvSFpsTWlIbmg3OGR
 xdWRiaVJad2JsZ0hQZWtMUWtnZGtvck1lUAphZVd3MzB4dnFkeU5QR1ZtMWRPUUJ5d3VkTjFjVE
 FIR2VQZnFERXlINk9oVm5EcUZOcC9VdDlQSjlWTDhyVEUwCkhkb0Nwa0VidnZINklMSDRVQ2lPZ
 jR5TEc3ZTBQa2VMNWFrMWE4N3RSZTFITGFhSjh1STdiNUpDVkhHWmVINC8KUFBaTDR5WkdhT29V
 cGFLNVlKd1h0ZnlGVExyTWwrNys4WStWTnlzQzdFNnpxNllYZDF5VWdzNXhrSU90OTFVUgpGRHg
 yY0R6UnoxSjdXbHNET201ZXA2citqbXZYUFBwMmhlK3lDS0YrSWtYYkU1VE1JU3Uya1BJb29oeU
 d5a2taCndidDNJbHZaR3Y3bXpUVGgyVFpDMHI1bzZiSWF5UTcrS2t5WEE0RGE1SGYyTlZOcmp0d
 TV4ZEZ6NDZLekFXZ2QKWHY0Qkc4MElsZmpnMnRhMUNKSVB5dUtpRlduOHNqaXhkV3hzUmhjeHpp
 UXFIVkxVQWE2YTJaUllCVGJqbkFvRwp3V2lLKzhRVkFFVXEzNjN1QmRSajYwTThZd0haazVncm1
 GSTlsTC9TMDM3MHAwVTAxWFVJS3VXNmJTbXJBRFFkCjBnK2orZz09Cj1Ba3dtCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=agx@sigxcpu.org; a=openpgp;
 fpr=0DB3932762F78E592F6522AFBB5A2C77584122D3

Instead of hardcoding ${KERNELRELEASE} in the package name allow
the user to override this.

This can be useful if one doesn't want to accumulate different packages
for every commit or micro version bump by setting
KDEB_PKGNAMEVERSION=7.3 or even KDEB_PKGNAMEVERSION=stable.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 scripts/package/mkdebian | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index d4b007b38a475..44ca9991fd6f4 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -172,6 +172,12 @@ else
 	packagename=linux-image
 fi
 
+if [ "${KDEB_PKGNAMEVERSION:+set}" ]; then
+	packagenameversion=$KDEB_PKGNAMEVERSION
+else
+	packagenameversion=$KERNELRELEASE
+fi
+
 debarch=
 set_debarch
 
@@ -215,7 +221,7 @@ Build-Depends-Arch: bc, bison, flex,
  python3:native, rsync
 Homepage: https://www.kernel.org/
 
-Package: $packagename-${KERNELRELEASE}
+Package: $packagename-${packagenameversion}
 Architecture: $debarch
 Description: Linux kernel, version ${KERNELRELEASE}
  This package contains the Linux kernel, modules and corresponding other
@@ -238,7 +244,7 @@ EOF
 if is_enabled CONFIG_MODULES; then
 cat <<EOF >> debian/control
 
-Package: linux-headers-${KERNELRELEASE}
+Package: linux-headers-${packagenameversion}
 Architecture: $debarch
 Build-Profiles: <!pkg.${sourcename}.nokernelheaders>
 Description: Linux kernel headers for ${KERNELRELEASE} on $debarch
@@ -252,7 +258,7 @@ fi
 if is_enabled CONFIG_DEBUG_INFO; then
 cat <<EOF >> debian/control
 
-Package: linux-image-${KERNELRELEASE}-dbg
+Package: linux-image-${packagenameversion}-dbg
 Section: debug
 Architecture: $debarch
 Build-Profiles: <!pkg.${sourcename}.nokerneldbg>

-- 
2.53.0

