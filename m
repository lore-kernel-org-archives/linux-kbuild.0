Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=24.134.29.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437412;
	b=C4qVU20T0sOvW3L2aAgPpQU+Y7fIBlJ4+AGo+SQaUgWZjD0GjhVEt8BAS8e/hkdSg4GT
	 jv4rpukPqPWk87lEQ3aprt8thGXKoWA4LIrB0GNGgWACzvVS9QYGk2QyT8trIojHLKALG
	 BlRGMMLtJUl4eXyuocV0CBdItwIHYj5av5/ecX5jSYz5cW1zK1H5XYLstSFbiNBDwdGV/
	 bkT4WqS0E2ybCUxFAnhcibBURNz0rRl6ab9HzqJ/jA0NfJtN97Nv0CGRACgfM6HUnFp5E
	 +Itn5ftbb/n/vHbQYN7XSs7RKNUa25EIOck/Qg8CoIcMlWPDVux7QWlgEeFnoZ/n4Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437412;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vsNDKPsv2Nc56gelrCKVe1H1Ze5X6Wh61dSY9Ujbhgo=;
	b=Lr+/b1LgWQMNbTrO+obLEsGiFeYedVdhIqHSjtle7TBQmPDdKCIT3XKUGLQVSv13xEPd
	 i8e0NgGXMN7TaAmlEPsWZeEGt5ohMhTN8s+E+R7Xw5KcU5H6gEW9859eGgyxqPGthl0sS
	 S49w4eOTQTtuTvbsxk3Zq0kzHJDSivDa7IYKt8XgGrIcBhqkGfKrW77D4RzkVWl8rr/3i
	 dVNeji+gyRCvik0yjxh7zVuP05SFHT7TFDtIGSe49AG7+dZcaBXLRY0jboYev0QTJWPXP
	 J5LUvCle8/LkM5f8ShKMiOFmM9eyVz91WT5rQBDi16/R7ZcFFuCSuLYod3GmfGUh7VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sigxcpu.org;
	spf=pass smtp.mailfrom=sigxcpu.org;
	dkim=pass header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=MBIvZc3i;
	arc=none smtp.remote-ip=24.134.29.49
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4174D606A31B;
	Mon, 19 Oct 2026 19:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4174D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=MBIvZc3i
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id D1007FB03;
	Mon, 19 Oct 2026 21:16:40 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWQfq1ABOZcv; Mon, 19 Oct 2026 21:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1792437398; bh=i7pfi2dvH2g8e49rm8K0l11bs7VB2420fSge4yMDfjM=;
	h=From:Date:Subject:To:Cc:From;
	b=MBIvZc3iHVXkQ9obvTYoxyOIp77re1dOnkckE0QqvUkPT/fsjzlkKjRO/FrlHYt7V
	 a5i+t2pm9GLI1Ed9XK73EuqKJ3ez/DWQa/RsXx7gkZJ0ZdwWvREJu7tnopsiqmpws5
	 IP2lJI0fTGDDkVlYxkJqfQ9jsLewyktCHv7Q0DGO4cBllfKBGohFF9QxvmrWbYiAnu
	 wSzjNxkLCqLJBARuDOVDCqwx4zgqQmjLBheq/01SdE4N+0dlhzBlEtmCKnHVgbTR7A
	 dGm8xRMVLujB6l1lFksXfvFwnSNOx2ieePZyl+DpBgJ5adEvwx5S3Q16TthUIv/AKR
	 ky4+MPLVxptbA==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Mon, 19 Oct 2026 21:16:14 +0200
Subject: [PATCH] kbuild: deb-pkg: allow to set package name version
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
Message-Id: <20261019-deb-pkg-v1-1-7f8e60bbede5@sigxcpu.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBjF8VfRd21lUxteRS6wg49CG1Ly7obLX
 /3PucjDMTwV0UUOB3te5gAZR9QO9dxDsA0mlSgtE5kLi0asUy9qjU5lqdGZAYV6dej4/J7K6rf
 fmxHt9s7pvh/Qj6n1awAAAA==
X-Change-ID: 20261019-deb-pkg-a6ef2837687e
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=i7pfi2dvH2g8e49rm8K0l11bs7VB2420fSge4yMDfjM=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQnExbXlWQnZLOEcwMWdTbXA5azV4bkk1TGFYOXBICnN0V1g0ZXpCVGdHa2lzUnlh
 d0tKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYXRac2xRQUt
 DUkFsdjRaU1N2ekI0eTZ5RC85UmJWL3RXV0hPUHVkSlRDQVJUaHh2WmdOZW1RTjNvTmREOXlOcg
 pjYlNob0xwUWZTQUYzQkFuWnlTaSsvUWxNSVhNUVBOOCt4dEtIaGE2WEF1cjRkblQ0Y0o0dkU1M
 3dDdGFNaW4vCnRmVHFTV3lOZXpJN25nUGgreUMvWGVPVkFPTW9EUFhuM3loT01zc3NQTmx2ZXd5
 V1NyYUZtN0MvOTMxSUtOc3AKN0V6dkUwTTFZWllrOW1FQkVORUJnSXVuVGhmdzF6bXFPOGJ3SGZ
 OM05PUmlaMC8zeFNIWFE1Q2JSeURxdkozTQpwZ1FsMGVKRzFSS05BNXVOWXdXL2t5THVzdGliTm
 JTeVdRTTlaTFlqMko4NXRna1loNTBYMCsxem9nZC8rTnlrCkhOdE5FZTBJcWxoQWxyQjNVeGVCT
 TVxSFV4cSttNjN1OUhMemdZOUdnRUFIYk9Wd1hIRGNHYTltaXRVaFhCM0MKY1ovREdsVmVvMFNU
 MURXKzlVZUhDanJOWE50UktkTjNsMW40S3VsZjNuZnNxcVdiL0g1NVpZUTFZaXNMMFYzOApQNUt
 WLzdMNTNOSm05dlk1cVdyckU2ZndpcERDM3ZiWUd6dnBMK3kwa1IwazFuV1dEN0ZpM3c3eVVzLy
 swTm13CjNIeVhZSkRUeitFTFZZaDVVUnZLOWxNKy9uMld1RWNtS1RwMHNuMUZwMGtURkRpekxLZ
 kdCbCszdDVNeG1JbTcKQ01CODZGMTBoSGZrS3dvUXZNaVdVMWk4NElzR3d5OEphMEZVeUpLaW5k
 Y2l2WHB6K2JlTFFJV3Fkb3VTL1VkOApsWlIwVWlCYW51K3lhVGpDc05aN0RyK2t1UUxYV2pqZFU
 3a1krcXhzeTdmK0IrTE44TVZCbWY3VGYwd2p6UnFPCmNQTE1RZz09Cj1oM2wvCi0tLS0tRU5EIF
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

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261019-deb-pkg-a6ef2837687e

Best regards,
--  
Guido Günther <agx@sigxcpu.org>

