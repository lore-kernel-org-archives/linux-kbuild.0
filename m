Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314667;
	b=c6IBmh3PM47s7RN4So6ZFAoiN2dO5JtYteI7DygVBC+5PL92YPhScQO1p36ybpHYskPA
	 wxAuv8JMs6/ULNKR7UG8XfJT5vXCDpsoUC1P2uwzznU7/XxSJerTR98mEDNZFLJpJZDoG
	 hXvNbSvU7SrOVfQqk0Gm1e8ZejRK0nmCMfRK9L1keIyWfTpluR6lNCueT5p2ywRpmEJoW
	 721Tx7RkODBYYBY0eVbBee9WLpFLLDHnZr9nitWgW5zz0FC2bknC9FYOJ7MfKTlFhW2vM
	 VyJvBE43QPj5e5SsGX09cRq7SvxhO2JAI5PkMbm0WVxL4caYPoxuBfMX884fHxrhriQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=h5Hpaazv/PJJXvnma3M/buleF7hZLhW/TVfnybhiNnk=;
	b=yFSTr2YXXxH90Y/OkPa/Ng0KZACt3aMEfBLzuk3ag9/8I+ihV1g3NqyNAGh1n+VDNcX4
	 9B1GlJ42n4xhF4HXRKQsxwo1nHWNWdl4Vh+tsAtOAhTEPuu0V1gtqYNS/750c9joIX9CX
	 wKdrnCb9bxGZb8LSrgb8/xprWK6PoJwzx2l7IcDov5d9fiAMqcgaPC4lUNVlrYt/pkHNE
	 ILPor15NwZ1T3Lxw3dDn7Ts0VohEiO4MZFDzPlDtnnrw1ujdyM/1wyeD0Ew0pnRcyL7D/
	 x9N/JJAlxfCWH1n+OXTo6KTT0jQjKPFLZS0lOlRgtfby3CDfnyTB2Ezkam7nEZjAZ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4Pk0bGY;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5C5606A31D
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 22:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D5C5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4Pk0bGY
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-535850d4e6aso47921cf.3
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 15:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793314666; x=1793919466; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h5Hpaazv/PJJXvnma3M/buleF7hZLhW/TVfnybhiNnk=;
        b=q4Pk0bGYejC80Vlg67vDiA4cVoyVezrRwL/1kfbcJktkHfwldceCME3k48jqzEdkVH
         BIZf3TJ+vT12mmlyXb5TU34cFd1GCX5uM6+LYC6SSZKz4TTNPrreQhoKNz68yjxq5KGv
         iuG8X0cBW5FiFjH4wK6SY6XQpOsGGIVJbkJiLeGRFq8ny81jQHabr0xmesjdzbUzzCDk
         nd9lQzo6sBGPzRNeuG6Ua+or8vKb5lX0QBP6GkMcBNVzfEo43rbhlpfLWr0/5AYscHm4
         9FvWolXD8PRa6YTChCqHvPFIoK8UMbJN7JdAKwi0rm/yjbctju6tyJ0GtpXLkUtB/+nI
         +agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314666; x=1793919466;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h5Hpaazv/PJJXvnma3M/buleF7hZLhW/TVfnybhiNnk=;
        b=Bu4GCf8SCyNcbp/AVTH+Nd0x9mypPZCVinG97CdUP22rkpXHbpm0a0ztF0M0EGV1K5
         PQn+EPlsRdbgfbUY8fpsebq2mR496xNE3PmVHHAgdjnJZwiHZZtfrj8PJUqy8Bg4dTmK
         BoZWYulAnj/BDFIE3HRhZ3VM2S9xGhx1ag3RAM55qUlefLHo6/A2w7Ue17Zynls3GKY8
         MvxXbIPCRKK2SVkD9F323vlHMyPbsL6S2u5mas1N+dW1o1NX2IQbI01SVF6Me6EHN9mY
         ef7fpheC7fRmizGS3QCerVb+J0gq6l5beeRs2TMTRKGIT4Mp+WUy+0WXCwYVtgc9txBJ
         /CqQ==
X-Gm-Message-State: AFq9FYJrj1Bnqg/3oTeTlX9OsN9kDLcJdEQSxHHTa1zwiOVfGTQy4a6+
	zj6nclcpxJvc1xfYO+9nokMB7Dn7dSE1Mb2HjWXR9tn/FGZV9z4cX9zq
X-Gm-Gg: AYBFou0oL3WNNkWIzZPzMYopnNFU0mP+kfQH/uGrkpvc4uPgzllhben1k/NUSGpcnxg
	mb99c6XocZVoIAR5/Kll5RZw9J9JcaTlPxJ8tGwv3uw8CNmdSfnIf8O1QJX6KikVAglu9BRi/6q
	9VsEYF9jT2ZUc8TAX1qql6v4Ej5yDWbkeYqDxQ8xqsLdt76mq5LyCP5Kxr/VkphfW3duYp/yqlh
	zHXFeWUmstDMhsLACUhjFpJ3M0j8LyxZO5mQ2NcghKO2ywkpR2VcXf0BnDnXYebjh/04PtCwJsJ
	+ayHXuJR9yuPpP4ei1/UXTXHAUyTSGgV/NJyZQGTBOfsLbv4TTFrDzNY33hhQ5BjttFW7w5dZPr
	R7EMEBHWcj4t3tF/nFtz1iQ3dr6xKvr3aJP2Dt79vOkEAxXXRmkZ0HeU8eObYzCz96yDg+OW5Vu
	rcNygr6om77aGCNmWoGUvNQfLgsc2EOfZ1xspdL5dKBy9iXMOOWqWtcZFU1jlmVGLhtI3LikJAt
	75TaLKKnlrt3oDAJ/MERBah8qx/KlSABdAQ8FHBZbKSPyezuC6ZbvluzQW5ONNhShwtbjKe80TR
	9Er2rzcz8ld9u4tqJ7q/fmg6qhSiXgheWKBtS5iIUG9H52SaWTcAsCW9SDuxFiOjqA==
X-Received: by 2002:ad4:5cc6:0:b0:91c:7b53:8007 with SMTP id 6a1803df08f44-91ca4b3a873mr10249726d6.4.1793314666398;
        Thu, 29 Oct 2026 15:57:46 -0700 (PDT)
Received: from [192.168.50.231] ([142.255.23.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca68c1578sm928146d6.40.2026.10.29.15.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:57:46 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 29 Oct 2026 18:57:37 -0400
Subject: [PATCH] drm/msm: Fix GMEM_BASE on a8xx
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-drm-msm-gmem-base-fix-v1-1-347642c5670c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAQBBFf0XzbGp3k/Ar8rC4mIdBOyUl/27ze
 E6d85AhCYy64qGES0yOPYMvC5q2uK9gmTNTcKH2LrQ8J2U15VWhPEYDL3Iz/Bhc5ZuIuqHcngl
 Z/99+eN8PXlurUmcAAAA=
X-Change-ID: 20261029-drm-msm-gmem-base-fix-e1b20418ae68
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.3

This was missed during initial bringup because GMEM_BASE is not used
anymore for textures on a8xx. However other things such as mesh shading
still use the GMEM aperture. Fix it to match the value programmed into
the registers.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5832dc25d6bf..aba2f0d6934e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -382,7 +382,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->info->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
-		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
+		if (adreno_gpu->info->family >= ADRENO_8XX)
+			*value = SZ_64M;
+		else if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
 			*value = 0;
 		else
 			*value = 0x100000;

---
base-commit: 9c31496a57579d0a46e1eabb8f53ec735b72d180
change-id: 20261029-drm-msm-gmem-base-fix-e1b20418ae68

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

