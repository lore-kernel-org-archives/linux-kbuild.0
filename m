Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314959;
	b=0qqHc7DoXDqmbRkbzgOvQi9Dm0evBxRN9VuH1ixWAUpXjMxk0UY8XzdrsiQ9ol3+OtHA
	 VM39wiC7gNDjUYg+rfnE4wMbzLf51yrCDKtsJMsYSicIiqnNeTGwVZvPrtOdLSOUTT4AW
	 2aXZnYbsF2udzEZHGv444LSP+Xmc4AR+5azT9ddGvK0YBjoiCpCIuScJRcwhPbajC6Kpw
	 GrtiMOtB+5bZzw6QD4UFbi2H5JdL6fVNfew1G+oNsPP/6UBukuZdGWVX8lLFoaIvbtQ41
	 wPU2r9PfOltwHiB35MbqggcqsUXonq4WkfsRLSB6z55NRNZ8qQbgGPJiSiJswZ4YdMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pdQPJwzRJN+nwSRrKcHiePRwRlhix19hahTM/4bzC3U=;
	b=Z+JQJHZdNs6YBxmRwdvAYyEinIpyji3YuiVFzOB6wMC60EaSDxETW44UpkVyiXWMbKD5
	 Vv0VV3m5+wo8OzwY4ZHrDGl+f/Cujnw9HsWKWT4g+M6sjI0h/bmmZtqZdVeOnyPXeBjQd
	 rbqykNbp9lqHY2UXeDdfm+ldW925kwanGvp6zIZ5SaCKpEg+TrE6pwA7KeKHlv5tZU2Kw
	 Y18EQ+MbgBqYeVhZGhCTkpH+MqL7xJqRX811tSHrIbDgRVB6iwt71sqlChdh6Xus2L5sh
	 0ReaJsAubMGiPnzga+1PNWii+zjMWTJqafdS04I3/Dy3neFNGgSI8O2u6shxTJWKBmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAzLNtKm;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5F606A31A
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 23:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE5F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NAzLNtKm
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f1f8f59a1so1146385a.3
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 16:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793314958; x=1793919758; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pdQPJwzRJN+nwSRrKcHiePRwRlhix19hahTM/4bzC3U=;
        b=NAzLNtKmCsF0IKPMBCGp4+IcOcKUbrxqzpMPhSHot9YZrrD7fDW6aqmudJfyu7IG8R
         qQX63gDLg/ORm7+PWOUwW4IwEAHpUFmtBk91+smAEsZ0qYgNPdXt5gYR29qeJjQUmN0/
         +jVX4RcZNIdKE1QYKjcSsgZCK2/TeGyu5zP0WT3EmwxLdvzsFUEnMhxJbOS/75BZq6X2
         rwUbWV64rufl8eJJDGOx0kYyikuipmgTHXz6HDjVcG7lQKbZzlpM9+zNivbIxJJ8+rdB
         K/6dJSbREdsozfMcdC4ADmD/sIPtrnoF4Yd3cZFXOnRrzwGiNEUMkKc8D+gj4FV5jkPK
         jsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314958; x=1793919758;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pdQPJwzRJN+nwSRrKcHiePRwRlhix19hahTM/4bzC3U=;
        b=FBjwRXk0Qk8DRUHVX8yxb2buPKUJPjwJfA2rBTiYI/cUkNZZS4TEjfQU3jLa40zv2g
         gsmDuQMzz6Luhj1q0d5AxlAaeALxtG//VEi/kIzTpFWSA5zijjsdaXmBaf/W/qKiR/WZ
         D3TwT73jYg5F5bh63TzNiz8IHWVdON+Tpiwgr6DRwTdZkD7/EvDKjW3QRRAtMGJtZbk0
         LLNsos/EimBdfpo5X/E1iwgLZ4Rf982XFAfPy4eFYWxlDC0qQBeTnuHMIePhOd08Y2ag
         A2D8d+DrJ0qSP3AZMSFsmm4VkYujZgmFd2tfURY6cQimLc8cRkqpChswKYPke71bwwhG
         kukg==
X-Gm-Message-State: AFq9FYIuf3yMlKSwMQ2uz8HihOMzicW0mMvW7/t1JRBz31lYE2W6pAXt
	uoOjIq4vvlJiJ5E44vOFlI/ak7nkzySIktelYZK6J8YMSuUsVTEuCetR
X-Gm-Gg: AYBFou3v3gxoTkkZblcCeNHAQWeT6s+hhCIQ+NWj6Fp5OiD9TPvow1QRlXI//s55/i1
	Op7peMfaTBCW0ngPObWWbBYBim0Lr1amQs4ckZ+UHDsoEUFEhnBbLY1UKqzWDrHgfItKg8aKypV
	yZk3Md8UtHMOZ9Fhc9iB6TcVnNiXVYtBGV+ynmVgkU5L1L1RH6WpPN7BuqzttwU4/0XY08cb4R9
	bb55YrUeqZ27O4onZkXQOxirb5ftLfPXsvcSWlmpfv1ZTxZ2Z7fPtJigubnHdeW3f1u103LQ8rQ
	cd7CZsom9PaunvBlUDy2TWIvDWkEJrIHiHwwRxxZ4sYQQBU4bFItrjX8chwAkrYSN2GEwNgmPEv
	WrqA3V2ygT9ZmykWso8Z1GC6l997fQUFyVhAHzvYUeGSyNk6PHQpuKvmJbp8kQooqPZKzLbCJUF
	mwJgAFdH5H3LRS5g+o1/3FiS4JQQwUMPythTcgXi3bejV6fdrQK91nybPUBsVt5ZXk/p54R5Gbk
	NbJLEguJXMKZtOeRpkPuGlJrg0dOc2ZlVmORKjg+sc0+v/YB5W0JgYbTaBicS73SH7mjXovRLqY
	7r8LgYLjD0mZAM1b4OKOeCvL9TvPChWLHAHku0THXMX5HDhqC+rt65Ub4M4iRPeUfg==
X-Received: by 2002:a05:620a:870e:10b0:940:f21a:eb64 with SMTP id af79cd13be357-944216f3e4amr127183785a.5.1793314957732;
        Thu, 29 Oct 2026 16:02:37 -0700 (PDT)
Received: from [192.168.50.231] ([142.255.23.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94424133d61sm2791485a.3.2026.10.29.16.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:02:37 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 29 Oct 2026 19:02:30 -0400
Subject: [PATCH v2] drm/msm: Fix GMEM_BASE on a8xx
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
Message-Id: <20261029-drm-msm-gmem-base-fix-v2-1-26b338471b46@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zi21oKuvIdhUcpYJnGAtIZoC
 He3cgGX7yX//RUyJaYM12qFRAtnnsYC5lBBGPwYCbkvDEYZp5W5YJ8EJQtGIcHOZ8IHv5F0Z5T
 VjSfXQNnOiYreu/e28MD5NaXPfrPon/1XXDRqPNnaWRPOrlbhFsXz8xgmgXbbti/Yy28iugAAA
 A==
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
Changes in v2:
- Fix enum name
- Link to v1: https://lore.kernel.org/r/20261029-drm-msm-gmem-base-fix-v1-1-347642c5670c@gmail.com
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5832dc25d6bf..5b05386ecffe 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -382,7 +382,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->info->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
-		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
+		if (adreno_gpu->info->family >= ADRENO_8XX_GEN1)
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

