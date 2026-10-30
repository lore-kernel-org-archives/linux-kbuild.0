Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364618;
	b=cAjV47l7rH3WAxLq7Vwqn9fOGqmcRJabWFijHSz+aU1FfqtmNso92LXhD8Wm96zZ3wPL
	 s71np8KgLAK+CnOaqZevS3+N/SlEmn+ZlE8BJY4V44B7jkR+8ZUf8vxU7lCggwMJkNiY8
	 jw9ydCe0jonG2fnV5EPGeg0N3SCfGjI0J0T+FS3J0AGXhOip6Ka+7txaPpHAgpeHLzpyF
	 1VOlbXznkVUse+zBxdqEyvRKTfy6lxs1hLxJ2Ne7U0gawAfs2Yzm5vHiQiqDZgFqJ0q/2
	 meBKhyHSPvr8+xeQTtbxaqyKkNkSapPerFGDcXYRTk+ZuLXT+m2sANNzxaHFr3+KlNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+36S2XfMH3Fmmp6nC8LledtkU6qCJGGKMmxe5Dy6N18=;
	b=kuWvDjv/IPr0wHdNbIlmF/va5FkKN8kXndQx9LHIt2r9xg36tYtJTTLUVQXUAkhxiozi
	 TFO9H2dIjWh2Gz6r8IVeHyad+RbHWXaBopt4GAGfGnqLsaH3XAOlN+N0Fpc5xq7FyIxG+
	 wM0JzvoSYPl5kqU22b4FzPThFSJYi3F6FjRkUSG9Ae2l/v13y1Lhixb3b3p03pwOpQ9vR
	 WWlg2+T+kO3wwl0OFeMmQB9onBwzDkC0rUKxdTHykE5msymLm1qPTfqjhQi/x7N0WSCRs
	 O4ySnUn7/hIsp4kgvtgwi0CjkT6gV9Eke6IIEsOk7vVQCtMseJYlNwcwIuSD5wZ5BDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ScWgBRoi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fr8tmmEy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD302606A325
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 12:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD302606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ScWgBRoi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fr8tmmEy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG5qp2169739
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 12:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+36S2XfMH3Fmmp6nC8LledtkU6qCJGGKMmxe5Dy6N18=; b=ScWgBRoisjo6bcu7
	P5SRMb1wyAhYpNggksh+eq+iYxsVYjGMrxjc3KYI8rijyR7secQ3ot2dfUlEYSql
	KttF74uobKkwHgM4p+tfKTwDGuCDB6zCNz2mvALPEs3FD2PsooWXRw4Qk7TyqkS5
	P1cykXo7eDnV/etd686Y2aUv2/G4rFxhsx4kgzB5ofN5UF2SAtJYbg6jSFMrcUCQ
	o0UPXiCg6mZlFFEgGhVDKcYaxIGDKSAGJpO1kAsFEKgiSO2LP6oVruFdok3N5+oC
	LuCL8ekSVMdsoAGF3smEpInCy8xopFJVp+CDUP8M7HXMSupbTvuAYRtpZq3r/Bsk
	ldT4Pg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pb2ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 12:50:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac5877bso5093985a.1
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 05:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364616; x=1793969416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+36S2XfMH3Fmmp6nC8LledtkU6qCJGGKMmxe5Dy6N18=;
        b=Fr8tmmEyUbTYsgDcoqM8Co4LLyDE3W0g/CEm2o3CElDpiy08PqkZoU4enMqNVaVYIf
         dmohnJNxXdrofJNRbwihwtuq3wgVorSx+1k5f+VdnwZBcPGgZaNsMal9dAU4B/eXMrPm
         UaS721UuBOEefzrt+1GpmsYPQ6T+0GW5aFqBk+GAula3HB3BitfqDKTdj9TL6E70yfRH
         qW/9ku3lly2ReVVYZe1TfiG/5PzZBnXY0R4nepFAZi/+DW3aOVU10Anh7PVEg8DKTlNs
         G6Cbb0fRY7Z6xd+0HnRpSzK4m786Ip6OxOZQeEjpvfIfkQw0dmW3EyMAoplN32HBPZeC
         fXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364616; x=1793969416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+36S2XfMH3Fmmp6nC8LledtkU6qCJGGKMmxe5Dy6N18=;
        b=YxzQ70NUz/91EotwiowWe0om+N9oy4L2M4VA8TW77AUTiA4NHtwhcmcEptw2muEp8o
         POMOZbpaLe/FYPFvtsiPN/00jVZmvV2A0YJknLqLJZxr/jKqOtbnkHjTPdoGtiZBmZgK
         iAnYQVsVqLi+5y89l3DRLLRWmbEaLcsI+tVsM8EqTyzCbNvD32hWMmXIaswM442YgHWI
         Tm1ZnFWMxWFqoQtochtHrYnD80x2ixPcrx5Vpv9kSuj/thaaTG0O6FYc9lXng8VCNnRk
         nhokQ70bOI5+xmpYBhJmZehY+Bbkdny8jWvFl5FRVGT2dAzzpBBDxFe5kGTAMf5RT2JJ
         YvsA==
X-Gm-Message-State: AFq9FYI8H2LAdWybsYtqCZCK67sAmodDYLbONcYaA3HESaXmj3KdT/Ho
	JuJPcpMZISKHyOOVb/4jcJdVFT9zjfR9eiDuv3xtw6C2OQcdeBOk2rbeT21iI0kuzBz6YsGUjOD
	9j6jOLJHMfuVluJwSSBLXVHXDO7iJtCHLEU6bF9UoyL9nNteeX9xpqLyWMPu7UJZjWsE=
X-Gm-Gg: AYBFou2r7xMYyYjfQSWgRChBMmXCscl9nLM3/LwM9buqcNKQwRgqYTDX+CNzADtWsax
	+o3enWjJTaWN0LMbefW4L+AJyjMP7vpZh8NNshRueXaqLcguglCsBKUH73QvAl+JrcpHCgaI6fi
	9yC1G5yu/bVeI9pbOF2rKl6j1sf4KG4jcbz/y/1g4nrvsUy2L7sLk1EmTHkv64KkV/YkLM0p2Qz
	4Ydt9jSTZCUwQCipj4A81OM9/BFBMKd0gzhl5BVBYWMsa4KNTjiLfNURJT8BFPwMHmnUlhlLMrV
	MoHj1bcGVYC/c97KVtL5N+aip45oLhe5sIifmNVlKBSdE6QiuPm0W5GIFGr3ffU1dWYPaAaRjdN
	RPipPE0aKGpcYj6//SyYaG5Ab4ye9EsbKNhpgdWS8LvmvV0a69x5/nmzvTI02uPN6mAumBs8=
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr364698785a.1.1793364615933;
        Fri, 30 Oct 2026 05:50:15 -0700 (PDT)
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr364694985a.1.1793364615590;
        Fri, 30 Oct 2026 05:50:15 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe8f9bbsm62954366b.67.2026.10.30.05.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:50:14 -0700 (PDT)
Message-ID: <415ffc75-d1ed-4540-9a55-dde0f6bd24cd@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:50:12 +0100
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: Fix GMEM_BASE on a8xx
To: Connor Abbott <cwabbott0@gmail.com>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nicolas Schier <nsc@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20261029-drm-msm-gmem-base-fix-v2-1-26b338471b46@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-drm-msm-gmem-base-fix-v2-1-26b338471b46@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX5mzOctk41w63
 W3Gg0Dv7k6ASXcWSySahNwUFmKyAArb/ADkI6Ax+mtsjM+Jxu6hHKIdvuQaI6k8yF2gRi+4qq4d
 9KuGZ+OQXCU5d+AgdKhWDtMC4GT/gVpWkM2mUz4c1GfXdac9zR7BhlPoVAIg7HNgp7st+AXvgfP
 xetMtqW9MPnLZhWiXNAuGLMqL3NWc/5H+wvDAJMAfXGVuu9SmS4f8BLj1hlXYK1tlhI2iwuF6kU
 ysDcLtTvg0uU047OYdPy9m/9kPR4aWr8BlM91bSYjv+z47H7hmexzY47DEWrNZCqC4hqrMjbK+b
 vFj11kgD8xp8hz+HSt5qxsSb5gbZ/Xe0KvUdLFUVGaykJ2wsy5eLBWBx72x953xOAhzk1RfGZhU
 sGgSrjn2pko7uz0scMBDXGl62J7iC0K7LWM7hjGmlzZazpjNpnwA23F1ibMzICnsbIIMHdRRg65
 tcsTRi7h3SHuEcMFu+Q==
X-Proofpoint-GUID: UsGtYBB-9zV1MSgjWj3IsWLW2dLPGUNp
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae49288 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XAuXcVFvbmlwbjzS6hgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: UsGtYBB-9zV1MSgjWj3IsWLW2dLPGUNp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX9AQXYxSkml1H
 c8MhiLLrwOR6rPeS/Otvx+pvYETWE3v2RjnW/wh7A9kUUGm5RvePEqcMHXv34j8QFLysd/e5X7s
 D+FdYBTfGvSXw7OTUIaNqWNfvNKi8IE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/30/26 12:02 AM, Connor Abbott wrote:
> This was missed during initial bringup because GMEM_BASE is not used
> anymore for textures on a8xx. However other things such as mesh shading
> still use the GMEM aperture. Fix it to match the value programmed into
> the registers.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
