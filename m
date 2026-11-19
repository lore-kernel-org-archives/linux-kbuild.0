Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795122801;
	b=x1RF9ROOFY3sMHVdGRxyqW5YYopNMBd353R632/614cCGW058R2lbVcVEDjkkATglBSG
	 H0zYexxfPrPCJCaHKZRHNenfjy5vJtsxO5JDqYbFpguv2JR41vCt+pj6bsbeI45SfKf/o
	 SVTPyEKR9NVpvLko+IsEEq8Oj4IkOv8ZhxCpolxtrmUvYvBvDubr77ZmOR2ekGMttM8XI
	 V2YTXw+5zOIgKSTZAx6V5NGsRBt48qIaJJYUl4fRpCcdRnBAoL+ljzkY2mQEOL6ZUYFPf
	 9bfgrmE/8E5cntcvz9DCZ0zzHhyDIDMVOI+O1Tu9GzQHySvP7EASrad1JJgZivcpxZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=BTX846Q3wuEFxAhPWtSoH33mqai/DTIHJcxlpTmY6SU=;
	b=OydVhSQADiIoXEcQS1M4Dz9UMQN3Mdq0q0QMUMLrCdy/oGfXu2acpj4eVMBpO/S5U1fc
	 YmHXM1GAYFpfkGc+mTOZ7YYNRDJcbDTU/8NhRooygw389R5B4DB/k6SJy6N3qVsc+Bpo5
	 61aJQ4PjHeeUFbe1ytZD9yH/zmfjt5L30d4BWw0WyG3rRDjA/iEX05LEsxIMWsqm7Hor/
	 rq4oNLTNJ/3RiZDP40TE7u18JEJ4Le/JUdxefqLJVohqXHHiEUt3yweNd09Q6nvlK2uIL
	 YGbnH8CBTYacIrAyP+6GOReuoGxY06zRyEAoCiaHv6umvraK2vhFIf7RcCgtDHGDhbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p/Jj+BkY";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A3C606A33B
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Nov 2026 21:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A3C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p/Jj+BkY
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so165534a91.0
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Nov 2026 13:13:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795122800; cv=none;
        d=google.com; s=arc-20260327;
        b=mLdoKAV5pzNQCurkklhj2z2gAwoq/lKgls3aaGCY9MZ+nvJeJBmwOzdQuKmbaY4/1z
         iOtci1aN/jXTG8cjtXMiPWnP837xRlvoQMfb+7D0a0xxRlj7xeBDTkIERwe+ircBjK0v
         QaJfamhNsdX5MPwxeiCvoYimCHdpazahTi6b70E74ylmpXv8oKuCd49WcL3LGRJhokWg
         aYA9u1b4DTwEwLI0x0s9pGekadEJLxajE5JWaYa+HHlRZNEf0iNzZI/l3qR4A3FbsJsN
         8PTcm1Dmz+CqakdE7lDasCugbVNHH96Z4LO3vSAf8ECl9VgVlaVTQ7ItUK/HGDrkUtZk
         mlBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BTX846Q3wuEFxAhPWtSoH33mqai/DTIHJcxlpTmY6SU=;
        fh=AysKwrq9tyzODJsHI2LdkFQdk5M8cjLD5D4+ApUd5lo=;
        b=UoMXbfTEx61ep/bkg8Q8k8yo20FVYwBEQGvr/jk9UCedJSQFVwf7zy1/uoEQ0Fgtkv
         gumkQh6s+gFN2k4o7SxQpCvlfY39QQouszQDHl5XJ3GgkWjXblouQYn4jF9rab7/8lBi
         A/XN4CGwwT6TCtkKZSXosBpE+z8nx1MFM9OR3tFPHGF8wPFHOt8jYQIRz+KsV5DkIKZv
         1NhpqwxcO7Me0IkwwZWT2KkbBUMniHhMMHsNj4NUPT8T6x1vCsaWVAHB95BCR0EGBNTQ
         39Xu4HgUTu4Iwj5eaC871QUxmsKcoMxWPEH2S4N81Piqs5cjWv+cLBNc1dgxpf/rR1Qh
         Lvxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795122800; x=1795727600; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BTX846Q3wuEFxAhPWtSoH33mqai/DTIHJcxlpTmY6SU=;
        b=p/Jj+BkYBg48KOZ6BKAgx0O58bTFydkucBJIGI0jknCA8+enQ/T98WtF0ppu/niMyK
         5WmwE/GL/5/Hh5JSO2ZHTGa78CZJmVDCaFXIu+EaG4IxOk/1vLRYQF2Yui/WydqgMM93
         HQmCCNmQEw50qSCcy0LW54H+daLToPTPtdS9Ad3oQ9X6Gj5B3rVAypC7u+szE75hnusZ
         kaDgthXdxmhO86Rh54L1dldOSslYEZ2VLtcW/CnaYXRI3oLf+FBGBfl8ROZ4XjJCEQS2
         XRInC1RzIKVopNx4CkwYttlds7vQTljE6lzXahfXUWqoU7TQ9cAyDEKAa1MoPT+6YfoQ
         iq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122800; x=1795727600;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTX846Q3wuEFxAhPWtSoH33mqai/DTIHJcxlpTmY6SU=;
        b=h15m1tO/doFyRpKezKwjpKvS8XUF463ZBE/nOIr7wL3A3g0Hkb7Y3E3E0KhQskRF8i
         DgApt1qgpWqnAAdtvMOO5u1hCzEY1EZY8QPXF7x7Z/oH2WJVameho5OXKVK3oXB9XorW
         1p3Oy1h53F5OzmNPfblEOLPrXJeyAfHpLzKJfq8zj7t3uWB1GO3orLX1ACUQOH96Pc4m
         wLHX6r3YOcEsy9BzJeLu7jcLXzmCg3TLvefIOzGWZuHt4He0rA/3BGlk5zWRHoQujcp5
         uYYIcCeumM08BMQePnaudsI4j5lkPuuDAzgz/bhS7xDbt0Ww6QW9Xm+dOEHnDFj3tBGP
         AzcQ==
X-Gm-Message-State: APuU4Z/WzoJL4yQtm6kJZeURoqrOU02WLZ0vgWop+IgQpvfWcu77j2EL
	qM7ovWBZuptJOYuBev1oDbFjUbhItl7j7dKAw+wEl+iYjMs4iqRtR8UWYSMPfyGdtxWp5oX1DpR
	8kxJ2e5BdAbfAhv8mRMDSY4YhjkHzladYOPF6
X-Gm-Gg: AZFdTZdNUS8LuUp0ipDbtgT4FBqd01kY+ibBQ9RXrWWtPV4imXVYXQru+MVvBRGMxMO
	i8bi3r8TERprB7T3W4kBrvly7x2O+sR+x4D/Ef2k+0rPHxgb928lo2Bcta2wBVjhN2ImH0jYUzH
	Kd+LE9ck0NlJoiXqU+XJFejaEJit6hWqak3GfGYQ4VJXx4gPnKBOv8w8QxPnEQgg+EpZFJEujal
	YKDkZjrKM0ib3I3o6Lj04Uy6wZe5POzEzvRc6eYffTElgClXL7EseDX6l3PtwbRW+3RRnznxEN3
	iLr3eGueVZarAb/6uz3hZeGH5xwIhoRaeDfsvnzudbli9e7ac8DOiiidWKisQ3CsRkaffEIBztt
	rUkEpF4/BJEDiyQSfyEfXecJpfnd7M+4o1a20gKf/hz6a9WP/MB05aGiYUIu9zMrH4ThxDmo=
X-Received: by 2002:a17:90b:4b:b0:3ac:d39d:ee4f with SMTP id
 98e67ed59e1d1-3b41caecd51mr465735a91.44.1795122800544; Thu, 19 Nov 2026
 13:13:20 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Giuseppe Piscitelli <ooonea@gmail.com>
Date: Thu, 19 Nov 2026 22:13:09 +0100
X-Gm-Features: AclHuK9Za6AW_ZdNiCYSd_5IGjfAUyU936FbvIwURcKb6GLxlJ01ixGesI_Z1x0
Message-ID: <CACmoRBa4ZR_nuHPEiRNhfziAY1dVx7kmP7rQBkjV54N4pz+Enw@mail.gmail.com>
Subject: [PATCH] kbuild: honor DEPMOD=true before checking System.map
To: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: ooonea <35407790+ooonea@users.noreply.github.com>

The RPM packaging already uses DEPMOD=true to skip generating module
indexes during modules_install. If the build tree lacks System.map,
the wrapper warns before reaching the no-op.

Return early for the existing DEPMOD=true convention. Verify that the
ordinary call still receives the same arguments and still warns for a
missing System.map.

OpenAI Codex (GPT-6) assisted with the patch and validation.
Signed-off-by: ooonea <35407790+ooonea@users.noreply.github.com>
---
--- a/scripts/depmod.sh
+++ b/scripts/depmod.sh
@@ -11,6 +11,10 @@
 KERNELRELEASE=$1

 : ${DEPMOD:=depmod}
+
+if test "$DEPMOD" = true; then
+       exit 0
+fi

 if ! test -r "${objtree}/System.map" ; then
        echo "Warning: modules_install: missing 'System.map' file.
Skipping depmod." >&2
